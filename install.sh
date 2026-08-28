#!/bin/bash
# ============================================================================
#  游戏服务器环境一键安装脚本（MySQL 8.0.31 @ CentOS Stream 9）
#
#  用法:
#    ./install.sh                # 一键安装（交互式输入 MySQL root 密码）
#    ./install.sh -p <密码>      # 全自动安装（免交互）
#    ./install.sh uninstall      # 一键卸载
#
#  说明:
#    - 自动在脚本所在目录 / 当前目录 / /home / /root 下查找 mysql-packages/
#      文件夹或 mysql-packages.tar.gz 压缩包
#    - 安装内容: MySQL 8.0.31 + ODBC 驱动 + 三个数据库 + SSL 证书 + ODBC 数据源
#    - 详细日志: /var/log/huanjing-install.log
# ============================================================================
set -e

# ---------------------------- 全局定义 --------------------------------------
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

LOG_FILE=/var/log/huanjing-install.log
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
STEPS_TOTAL=12
STEP_NO=0
CURRENT_STEP="初始化"
NONINTERACTIVE=0
T_START=$SECONDS
: > "$LOG_FILE"

# ---------------------------- 输出助手 --------------------------------------
info()    { echo -e "  ${BLUE}ℹ${NC} $1"; }
ok()      { echo -e "  ${GREEN}✔${NC} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${NC} $1"; }
err()     { echo -e "${RED}✖ $1${NC}"; }

make_bar() {  # make_bar <已填充格数> <总格数>
    local filled=$1 len=$2 out="" i
    for ((i = 0; i < filled; i++)); do out+="█"; done
    for ((i = filled; i < len; i++)); do out+="░"; done
    printf '%s' "$out"
}

step_begin() {  # step_begin <步骤标题>
    local title="$1"
    CURRENT_STEP="$title"
    STEP_NO=$((STEP_NO + 1))
    local pct=$((STEP_NO * 100 / STEPS_TOTAL))
    local bar
    bar=$(make_bar $((STEP_NO * 30 / STEPS_TOTAL)) 30)
    echo ""
    echo -e "${CYAN}${BOLD}▸ [$STEP_NO/$STEPS_TOTAL] $title${NC}  ${BLUE}$bar $pct%${NC}"
}

fail() {  # fail <描述> —— 打印阶段与日志尾部后退出
    echo
    err "$1（阶段: $CURRENT_STEP）"
    echo -e "  ${BLUE}ℹ${NC} 日志末尾 20 行:"
    tail -20 "$LOG_FILE" 2>/dev/null | sed 's/^/      /' || true
    echo -e "  ${BLUE}ℹ${NC} 完整日志: $LOG_FILE"
    exit 1
}
trap 'rc=$?; fail "命令执行出错（退出码 $rc）"' ERR

run()      {  # run <描述> <命令...> —— 静默执行，失败即退出
    local desc="$1"; shift
    if ! "$@" >>"$LOG_FILE" 2>&1; then fail "$desc"; fi
    ok "$desc"
}
run_sh()   {  # run_sh <描述> <shell 片段>
    local desc="$1" script="$2"
    if ! bash -c "$script" >>"$LOG_FILE" 2>&1; then fail "$desc"; fi
    ok "$desc"
}
run_opt()  {  # run_opt <描述> <命令...> —— 尽力执行，失败不中断
    local desc="$1"; shift
    info "$desc ..."
    "$@" >>"$LOG_FILE" 2>&1 || true
}

# ---------------------------- 前置检查 --------------------------------------
if [ "$(id -u)" -ne 0 ]; then
    err "请使用 root 用户运行: sudo ./install.sh"
    exit 1
fi

if ! grep -qi "CentOS Stream 9\|CentOS Stream release 9" /etc/os-release 2>/dev/null; then
    echo -e "${YELLOW}⚠ 当前系统不是 CentOS Stream 9，脚本可能不兼容（将继续执行）${NC}"
    grep PRETTY /etc/os-release 2>/dev/null | sed 's/^/    /' || true
fi

clear
echo -e "${CYAN}"
echo  "╔══════════════════════════════════════════════╗"
echo -e "║   ${BOLD}🚀 游戏服务器环境 · 一键部署${NC}${CYAN}"
echo -e "║   MySQL 8.0.31 · CentOS Stream 9"
echo  "╚══════════════════════════════════════════════╝"
echo -e "${NC}"

# 已安装检测与磁盘检查（卸载模式跳过；非交互模式下直接报错退出）
if [ "$1" != "uninstall" ] && [ "$1" != "-u" ]; then
    if command -v mysql >/dev/null 2>&1 || systemctl list-unit-files 2>/dev/null | grep -q "^mysqld"; then
        warn "检测到本机已安装 MySQL"
        if [ "$1" = "-p" ]; then
            err "非交互模式无法确认，请先执行 ./install.sh uninstall 后重装"
            exit 1
        fi
        read -p "  继续安装可能造成冲突，仍要继续吗？(y/N): " GO_ON
        [[ $GO_ON =~ [Yy] ]] || { info "已退出，建议先执行 ./install.sh uninstall"; exit 0; }
    fi

    AVAIL_KB=$(df -Pk / | awk 'NR==2 {print $4}')
    if [ "${AVAIL_KB:-0}" -lt $((2 * 1024 * 1024)) ]; then
        warn "根分区剩余空间不足 2GB（当前约 $((AVAIL_KB / 1024 / 1024))GB），安装可能失败"
    fi
fi

# ---------------------------- 卸载模式 --------------------------------------
if [ "$1" = "uninstall" ] || [ "$1" = "-u" ]; then
    CURRENT_STEP="卸载"
    trap - ERR
    echo -e "${RED}"
    echo  "╔══════════════════════════════════════════════╗"
    echo -e "║   ${BOLD}⚠ MySQL 一键卸载 · 此操作不可逆${NC}${RED}"
    echo  "╚══════════════════════════════════════════════╝"
    echo -e "${NC}"

    read -p "确认要卸载 MySQL 吗？(输入 YES 继续): " CONFIRM
    if [ "$CONFIRM" != "YES" ]; then
        info "已取消卸载操作"; exit 0
    fi

    info "停止 MySQL 服务..."
    systemctl stop mysqld 2>/dev/null || true
    systemctl disable mysqld >>"$LOG_FILE" 2>&1 || true
    ok "MySQL 服务已停止"

    info "卸载 MySQL 组件..."
    dnf remove -y mysql-community-server mysql-community-client \
        mysql-community-client-plugins mysql-community-common \
        mysql-community-icu-data-files mysql-community-libs \
        mysql-connector-odbc >>"$LOG_FILE" 2>&1 || true
    ok "MySQL 组件已卸载"

    info "删除数据文件和配置..."
    rm -rf /var/lib/mysql /var/log/mysqld.log /root/mysql8 /root/.my.cnf \
        /etc/my.cnf.rpmsave /etc/odbc.ini /etc/mysql/ssl
    ok "数据文件已清理"

    read -p "是否删除所有数据库残留？(y/N): " CLEAN_DB
    if [[ $CLEAN_DB =~ [Yy] ]]; then
        read -s -p "  请输入 MySQL root 密码: " DB_PWD; echo
        mysql -uroot -p"$DB_PWD" -e "DROP DATABASE IF EXISTS tlbbdb_main; \
DROP DATABASE IF EXISTS tlbbdb_world; DROP DATABASE IF EXISTS web;" >>"$LOG_FILE" 2>&1 || true
        ok "数据库已删除"
    fi

    info "清理残留依赖..."
    dnf autoremove -y >>"$LOG_FILE" 2>&1 || true

    info "恢复原有 yum 源配置..."
    if [ -d /etc/yum.repos.d/backup ]; then
        mv /etc/yum.repos.d/backup/*.repo /etc/yum.repos.d/ 2>/dev/null || true
        rmdir /etc/yum.repos.d/backup 2>/dev/null || true
    fi
    ok "yum 源已恢复"

    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    ok "MySQL 已完全卸载"
    exit 0
fi

# ---------------------------- 安装模式 --------------------------------------
# 密码: -p 参数（免交互）或交互输入；禁止会破坏 SQL/heredoc 的字符
BAD_CHARS='[$`"'"'"'\\ ]'
if [ "$1" = "-p" ] && [ -n "$2" ]; then
    NONINTERACTIVE=1
    MYSQL_ROOT_PASSWORD="$2"
    if [ ${#MYSQL_ROOT_PASSWORD} -lt 4 ]; then
        err "密码长度不足，请输入至少4位字符"; exit 1
    fi
    if [[ "$MYSQL_ROOT_PASSWORD" =~ $BAD_CHARS ]]; then
        err "密码不能包含 \$ \` \" ' 空格或反斜杠"; exit 1
    fi
else
    while true; do
        read -s -p "请输入 MySQL root 密码（至少4位）: " MYSQL_ROOT_PASSWORD; echo
        read -s -p "请再次输入确认: " MYSQL_ROOT_PASSWORD2; echo
        if [ "$MYSQL_ROOT_PASSWORD" != "$MYSQL_ROOT_PASSWORD2" ]; then
            warn "两次输入不一致，请重新输入"; continue
        fi
        if [ ${#MYSQL_ROOT_PASSWORD} -lt 4 ]; then
            warn "密码长度不足，请输入至少4位字符"; continue
        fi
        if [[ "$MYSQL_ROOT_PASSWORD" =~ $BAD_CHARS ]]; then
            warn "密码不能包含 \$ \` \" ' 空格或反斜杠，请重新输入"; continue
        fi
        break
    done
fi
ok "密码设置完成"

# 步骤 1/12：腾讯云镜像源
step_begin "配置腾讯云 YUM 镜像源"
info "检查 yum/dnf 进程..."
WAIT_COUNT=0
while pgrep -x yum >/dev/null 2>&1 || pgrep -x dnf >/dev/null 2>&1; do
    [ $WAIT_COUNT -eq 0 ] && warn "检测到其他 yum/dnf 进程正在运行，等待完成..."
    sleep 5; WAIT_COUNT=$((WAIT_COUNT + 1))
    if [ $WAIT_COUNT -gt 60 ]; then
        warn "等待超时，尝试强制终止..."
        pkill -9 yum 2>/dev/null || true; pkill -9 dnf 2>/dev/null || true; sleep 2; break
    fi
done

info "备份原有 yum 源并写入腾讯云镜像配置..."
mkdir -p /etc/yum.repos.d/backup
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup/ 2>/dev/null || true
cat > /etc/yum.repos.d/CentOS-Base.repo << 'EOF'
[baseos]
name=CentOS Stream $releasever - BaseOS - mirrors.tencent.com
baseurl=https://mirrors.tencent.com/centos-stream/$stream/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=https://mirrors.tencent.com/centos-stream/RPM-GPG-KEY-CentOS-Official

[appstream]
name=CentOS Stream $releasever - AppStream - mirrors.tencent.com
baseurl=https://mirrors.tencent.com/centos-stream/$stream/AppStream/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=https://mirrors.tencent.com/centos-stream/RPM-GPG-KEY-CentOS-Official

[extras-common]
name=CentOS Stream $releasever - Extras packages - mirrors.tencent.com
baseurl=https://mirrors.tencent.com/centos-stream/SIGs/$stream/extras/$basearch/extras-common/
gpgcheck=1
enabled=1
gpgkey=https://mirrors.tencent.com/centos-stream/RPM-GPG-KEY-CentOS-Official
EOF
run_opt "清理 yum 缓存" yum clean all
run_opt "构建 yum 缓存（首次约1-2分钟）" yum makecache

# 步骤 2/12：系统依赖
step_begin "安装系统依赖包"
run     "安装 perl / net-tools / libaio / zip / openssl" yum install -y perl net-tools libaio zip openssl
run_opt "移除旧版 mysql-libs" yum -y remove mysql-libs
run_opt "安装 libnuma 依赖" yum install -y libnuma*
ok "依赖包安装完成"

# 步骤 3/12：定位安装包
step_begin "定位 MySQL 安装包"
TAR_FILE=""; PKG_DIR=""
find_packages() {
    for d in "$SCRIPT_DIR/mysql-packages" "$PWD/mysql-packages" /home/mysql-packages /root/mysql8; do
        if [ -d "$d" ] && ls "$d"/*.rpm >/dev/null 2>&1; then
            PKG_DIR="$d"; return 0
        fi
    done
    for f in "$SCRIPT_DIR/mysql-packages.tar.gz" "$PWD/mysql-packages.tar.gz" /home/mysql-packages.tar.gz; do
        if [ -f "$f" ]; then
            TAR_FILE="$f"; return 0
        fi
    done
    return 1
}
if find_packages; then
    if [ -n "$PKG_DIR" ]; then
        ok "已找到安装包目录: $PKG_DIR"
        TARGET_DIR="$PKG_DIR"
    else
        TARGET_DIR="/root/mysql8"
        info "找到压缩包 $TAR_FILE，解压到 $TARGET_DIR ..."
        rm -rf "$TARGET_DIR"; mkdir -p "$TARGET_DIR"
        tar -xzf "$TAR_FILE" -C "$TARGET_DIR" --strip-components=1 2>/dev/null || tar -xzf "$TAR_FILE" -C "$TARGET_DIR"
        if ! ls "$TARGET_DIR"/*.rpm >/dev/null 2>&1; then
            SUB=$(find "$TARGET_DIR" -maxdepth 2 -name "*.rpm" | head -1 | xargs -r dirname)
            if [ -n "$SUB" ] && [ "$SUB" != "$TARGET_DIR" ]; then
                mv "$SUB"/*.rpm "$TARGET_DIR/" 2>/dev/null || true
                mv "$SUB"/*.sql "$TARGET_DIR/" 2>/dev/null || true
                rm -rf "$SUB"
            fi
        fi
        ok "解压完成"
    fi
else
    err "未找到 mysql-packages/ 目录或 mysql-packages.tar.gz"
    info "请将 mysql-packages 文件夹（或压缩包）放在 install.sh 同目录后重试"
    exit 1
fi

# 步骤 4/12：安装 MySQL 组件
step_begin "安装 MySQL 组件"
cd "$TARGET_DIR"
RPM_COUNT=$(ls -1 *.rpm 2>/dev/null | wc -l)
if [ "$RPM_COUNT" -eq 0 ]; then
    err "未找到 RPM 文件"; ls -la "$TARGET_DIR"; exit 1
fi
info "找到 $RPM_COUNT 个 RPM 包，按依赖顺序安装（输出已写入日志）..."
run "MySQL 8.0.31 及 ODBC 驱动安装完成" dnf install -y \
    mysql-community-common-*.rpm \
    mysql-community-libs-*.rpm \
    mysql-community-client-plugins-*.rpm \
    mysql-community-icu-data-files-*.rpm \
    mysql-community-client-*.rpm \
    mysql-community-server-*.rpm \
    mysql-connector-odbc-*.rpm

# 步骤 5/12：启动服务
step_begin "启动 MySQL 服务"
run "设置开机自启" systemctl enable mysqld
run "启动 mysqld"  systemctl start mysqld
sleep 3
ok "MySQL 服务已启动"

# 步骤 6/12：初始密码
step_begin "获取初始临时密码"
TEMP_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
if [ -z "$TEMP_PASSWORD" ]; then
    err "未在 /var/log/mysqld.log 中找到临时密码"
    tail -20 /var/log/mysqld.log 2>/dev/null || true
    exit 1
fi
info "临时密码: ${YELLOW}$TEMP_PASSWORD${NC}"

# 步骤 7/12：用户权限
step_begin "配置 MySQL 用户权限"
mysql --connect-expired-password -uroot -p"$TEMP_PASSWORD" >>"$LOG_FILE" 2>&1 <<EOF || fail "配置 root 密码与远程权限"
ALTER USER 'root'@'localhost' IDENTIFIED BY '$TEMP_PASSWORD';
FLUSH PRIVILEGES;
SET GLOBAL validate_password.policy = 0;
SET GLOBAL validate_password.length = 4;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
ok "root 密码与远程权限（root@%）配置完成"

cat > /root/.my.cnf <<EOF
[client]
user = root
password = $MYSQL_ROOT_PASSWORD
host = localhost
EOF
chmod 600 /root/.my.cnf
ok "已创建 /root/.my.cnf 免密登录配置"

mysql --defaults-file=/root/.my.cnf >>"$LOG_FILE" 2>&1 <<EOF || fail "切换认证插件"
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
ok "认证插件已切换为 mysql_native_password"

# 步骤 8/12：SSL 证书
step_begin "生成 SSL 证书"
OPENSSL_DIR="/etc/mysql/ssl"
mkdir -p "$OPENSSL_DIR"
if ! command -v openssl >/dev/null 2>&1; then
    warn "OpenSSL 未安装，正在安装（不升级现有版本）..."
    run "安装 OpenSSL" yum install -y openssl --setopt=obsoletes=0
else
    ok "OpenSSL 已存在（$(openssl version 2>/dev/null)），跳过安装"
fi
if ! systemctl is-active --quiet sshd; then
    warn "SSH 服务异常，尝试修复（防止 OpenSSL/SSH 版本冲突）..."
    systemctl restart sshd 2>/dev/null || {
        for i in 1 2 3; do yum downgrade openssl -y >>"$LOG_FILE" 2>&1 && break || true; done
        systemctl restart sshd 2>/dev/null || {
            run_opt "安装 openssh-server" yum install -y openssh-server
            systemctl restart sshd 2>/dev/null || true
        }
    }
    systemctl is-active --quiet sshd && ok "SSH 服务已修复" || warn "SSH 仍未正常，请通过 VNC 检查"
else
    ok "SSH 服务运行正常"
fi
run "生成 RSA 私钥" openssl genpkey -algorithm RSA -out "$OPENSSL_DIR/server-key.pem"
run "生成证书请求"  openssl req -new -key "$OPENSSL_DIR/server-key.pem" -out "$OPENSSL_DIR/certificate_request.csr" -subj "/CN=mysql-server"
run "签发证书"      openssl x509 -req -days 365 -in "$OPENSSL_DIR/certificate_request.csr" -signkey "$OPENSSL_DIR/server-key.pem" -out "$OPENSSL_DIR/server-cert.pem"
cp "$OPENSSL_DIR/server-cert.pem" "$OPENSSL_DIR/ca.pem"
ok "SSL 证书生成完成"

# 步骤 9/12：MySQL SSL 配置
step_begin "配置 MySQL SSL"
cat >> /etc/my.cnf <<EOF

[mysqld]
ssl-ca = $OPENSSL_DIR/ca.pem
ssl-cert = $OPENSSL_DIR/server-cert.pem
ssl-key = $OPENSSL_DIR/server-key.pem
EOF
ok "SSL 配置已写入 /etc/my.cnf"

# 步骤 10/12：导入数据库
step_begin "导入数据库"
for DB in tlbbdb_main tlbbdb_world web; do
    SQL_FILE="$TARGET_DIR/$DB.sql"
    if [ -f "$SQL_FILE" ]; then
        run "创建数据库 $DB" mysql --defaults-file=/root/.my.cnf -e "CREATE DATABASE IF NOT EXISTS $DB"
        info "导入 $DB.sql（大文件可能需要几分钟）..."
        run "导入 $DB 完成" bash -c "mysql --defaults-file=/root/.my.cnf '$DB' < '$SQL_FILE'"
    else
        warn "未找到 $SQL_FILE，跳过 $DB"
    fi
done

# 步骤 11/12：ODBC 数据源
step_begin "配置 ODBC 数据源"
cat > /etc/odbc.ini <<EOF
[tlbbdb_main]
Driver          = /usr/lib64/libmyodbc8a.so
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = tlbbdb_main
OPTION          = 3
SOCKET          =

[tlbbdb_world]
Driver          = /usr/lib64/libmyodbc8a.so
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = tlbbdb_world
OPTION          = 3
SOCKET          =

[web]
Driver          = /usr/lib64/libmyodbc8a.so
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = web
OPTION          = 3
SOCKET          =
EOF
ok "三个 ODBC 数据源已写入 /etc/odbc.ini"

# 步骤 12/12：重启验证
step_begin "重启并验证服务"
run "重启 mysqld" systemctl restart mysqld
sleep 2
run_sh "MySQL 登录验证" "mysql --defaults-file=/root/.my.cnf -e 'SHOW DATABASES;'"
trap - ERR
if systemctl is-active --quiet sshd; then
    SSH_STATUS="${GREEN}✔ 正常运行${NC}"
else
    SSH_STATUS="${RED}✖ 异常（请通过 VNC 检查）${NC}"
fi

T_ELAPSED=$((SECONDS - T_START))
T_FMT=$(printf '%d分%02d秒' $((T_ELAPSED / 60)) $((T_ELAPSED % 60)))

clear
echo -e "${GREEN}"
echo  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  ${BOLD}🎉 安装成功完成！${NC}${GREEN}   总耗时: $T_FMT"
echo  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${NC}"
echo -e "  ${GREEN}✔${NC} MySQL 版本     ${YELLOW}8.0.31${NC}（systemctl 管理，开机自启）"
echo -e "  ${GREEN}✔${NC} 数据库         ${YELLOW}tlbbdb_main / tlbbdb_world / web${NC}"
echo -e "  ${GREEN}✔${NC} 远程访问       root@% 已开启，插件 mysql_native_password"
echo -e "  ${GREEN}✔${NC} ODBC 数据源    ${YELLOW}/etc/odbc.ini${NC}"
echo -e "  ${GREEN}✔${NC} SSL 证书       ${YELLOW}/etc/mysql/ssl/${NC}"
echo -e "  ${GREEN}✔${NC} SSH 服务       $SSH_STATUS"
echo ""
echo -e "  ${BLUE}ℹ${NC} 安装日志: $LOG_FILE"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${GREEN}${BOLD}🚀 现在可以上传版本，开服！${NC}"
echo ""
