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
STEPS_TOTAL=13
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

# ---------------------------- 服务端管理子命令 --------------------------------
find_server_dir() {
    for d in "$SCRIPT_DIR/tlbb64" /home/tlbb64 /root/tlbb64; do
        if [ -f "$d/Server/Config/ServerInfo.ini" ]; then
            echo "$d"; return 0
        fi
    done
    return 1
}

do_start() {
    local sd
    sd=$(find_server_dir) || { err "未找到服务端目录（tlbb64，需含 Server/Config/ServerInfo.ini）"; exit 1; }
    echo -e "${CYAN}${BOLD}▶ 启动服务端: $sd${NC}"
    info "顺序启动 ShareMemory → World → Server → Login（约需1分钟，请勿中断）..."
    sh "$sd/run.sh"
    echo ""
    ok "启动脚本执行完毕，查看进程状态: ./install.sh status"
}

do_stop() {
    local sd
    sd=$(find_server_dir) || { err "未找到服务端目录"; exit 1; }
    echo -e "${CYAN}${BOLD}■ 关闭服务端: $sd${NC}"
    info "安全停服中（等待各进程退出并自动打包日志，可能需要几十秒）..."
    sh "$sd/stop.sh"
    echo ""
    ok "服务端已全部关闭，日志已归档到 $sd/logbak/"
}

do_status() {
    local sd all=1 comp pid
    sd=$(find_server_dir) || { err "未找到服务端目录"; exit 1; }
    echo -e "${CYAN}${BOLD}服务端进程状态（$sd）${NC}"
    for comp in ShareMemory64 World64 Server64 Login64; do
        pid=$(pgrep -f "\./$comp" | head -1)
        if [ -n "$pid" ]; then
            echo -e "  ${GREEN}✔${NC} $comp   ${GREEN}运行中${NC} (PID $pid)"
        else
            echo -e "  ${RED}✖${NC} $comp   ${RED}未运行${NC}"
            all=0
        fi
    done
    if [ $all -eq 1 ]; then
        ok "全部组件运行正常"
    else
        warn "部分组件未运行，可执行 ./install.sh start 启动"
    fi
}

do_backup() {
    if [ ! -f /root/.my.cnf ]; then
        err "未找到 /root/.my.cnf，请先完成环境安装"
        exit 1
    fi
    local backup_dir=/root/tlbb_backup
    mkdir -p "$backup_dir"
    local f="$backup_dir/tlbbdb_$(date +%Y%m%d_%H%M%S).tar.gz"
    info "正在导出 tlbbdb_main / tlbbdb_world / web（大库可能需要几分钟）..."
    mysqldump --defaults-file=/root/.my.cnf --single-transaction --databases tlbbdb_main tlbbdb_world web 2>>"$LOG_FILE" | gzip > "$f"
    ok "备份完成: $f ($(du -h "$f" | cut -f1))"
    ls -1t "$backup_dir"/tlbbdb_*.tar.gz 2>/dev/null | tail -n +6 | xargs -r rm -f
    info "自动保留最近 5 份备份（目录: $backup_dir）"
}

do_autostart() {
    local mode="$1" sd
    sd=$(find_server_dir) || { err "未找到服务端目录"; exit 1; }
    case "$mode" in
        on)
            cat > /etc/systemd/system/tlbb.service <<EOF
[Unit]
Description=TLBB Game Server
After=network.target mysqld.service redis.service
Requires=mysqld.service redis.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=$sd
ExecStart=/bin/sh $sd/run.sh
ExecStop=/bin/sh $sd/stop.sh
TimeoutStartSec=300

[Install]
WantedBy=multi-user.target
EOF
            systemctl daemon-reload
            systemctl enable tlbb.service >/dev/null 2>&1
            ok "开机自启已开启（服务器重启后自动拉起服务端）"
            info "也可用 systemctl start/stop tlbb 管理"
            ;;
        off)
            systemctl disable tlbb.service >/dev/null 2>&1 || true
            rm -f /etc/systemd/system/tlbb.service
            systemctl daemon-reload
            ok "开机自启已关闭"
            ;;
        *)
            if [ -f /etc/systemd/system/tlbb.service ]; then
                ok "开机自启: 已开启（tlbb.service）"
            else
                info "开机自启: 未开启（开启命令: tlbb autostart on）"
            fi
            ;;
    esac
}

case "${1:-}" in
    start)     do_start;     exit 0 ;;
    stop)      do_stop;      exit 0 ;;
    status)    do_status;    exit 0 ;;
    restart)   do_stop; sleep 3; do_start; exit 0 ;;
    backup)    do_backup;    exit 0 ;;
    config)    shift; exec "$SCRIPT_DIR/config.sh" "$@" ;;
    autostart) do_autostart "${2:-}"; exit 0 ;;
esac

# 系统识别：通杀 RHEL 系（CentOS 7/8/9、AlmaLinux、Rocky、腾讯OS、阿里云Linux 等）
OS_ID=$(sed -n 's/^ID=//p' /etc/os-release 2>/dev/null | head -1 | tr -d '"')
OS_PRETTY=$(sed -n 's/^PRETTY_NAME=//p' /etc/os-release 2>/dev/null | head -1 | tr -d '"')
EL_VER=$(rpm -E '%{rhel}' 2>/dev/null | grep -oE '^[0-9]+$' || true)
if ! [[ "$EL_VER" =~ ^(7|8|9)$ ]]; then
    EL_VER=$(sed -n 's/^VERSION_ID="\?\([0-9]*\).*/\1/p' /etc/os-release 2>/dev/null | head -1)
fi
case "$OS_ID:$EL_VER" in
    tencentos:2) EL_VER=7 ;;
    tencentos:3) EL_VER=8 ;;
    alibaba:2)   EL_VER=7 ;;
    alibaba:3)   EL_VER=8 ;;
esac
case "$OS_ID" in
    centos|rhel|almalinux|rocky|tencentos|alibaba|anolis|opencloudos) ;;
    *)
        err "当前系统: ${OS_PRETTY:-未知}（ID=$OS_ID）"
        err "本脚本支持 RHEL 系: CentOS 7/8/9、AlmaLinux、Rocky、腾讯OS、阿里云Linux 等"
        err "游戏服务端为 CentOS 编译，Debian/Ubuntu 无法直接运行，请更换系统后重试"
        exit 1
        ;;
esac
if ! [[ "$EL_VER" =~ ^(7|8|9)$ ]]; then
    err "未能识别系统版本（$OS_PRETTY），仅支持 EL 7/8/9"
    exit 1
fi

clear
echo -e "${CYAN}"
echo  "╔══════════════════════════════════════════════╗"
echo -e "║   ${BOLD}🚀 游戏服务器环境 · 一键部署${NC}${CYAN}"
echo -e "║   MySQL 8.0 + Redis · RHEL 系通杀（CentOS 7/8/9）"
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

    # Swap 检查：低内存且无 Swap 时创建，防止 MySQL / 服务端 OOM
    if ! swapon --show 2>/dev/null | grep -q .; then
        MEM_MB=$(free -m | awk '/^Mem:/ {print $2}')
        if [ "${MEM_MB:-0}" -le 4000 ] && [ "${AVAIL_KB:-0}" -ge $((5 * 1024 * 1024)) ]; then
            warn "未检测到 Swap 且内存仅 ${MEM_MB}MB，建议创建 4G Swap 防止内存不足"
            if [ "$1" = "-p" ] || { read -p "  现在创建 4G Swap？(Y/n): " SW_Y; [[ ! $SW_Y =~ ^[Nn] ]]; }; then
                info "创建 4G Swap..."
                dd if=/dev/zero of=/swapfile bs=1M count=4096 status=none
                chmod 600 /swapfile
                mkswap -q /swapfile
                swapon /swapfile
                grep -q '^/swapfile' /etc/fstab || echo '/swapfile none swap sw 0 0' >> /etc/fstab
                ok "Swap 已创建并写入 /etc/fstab（重启持久）"
            fi
        fi
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

    if sd=$(find_server_dir); then
        info "检测到游戏服务端（$sd），先执行安全停服（可能需要几十秒）..."
        sh "$sd/stop.sh" >>"$LOG_FILE" 2>&1 || true
        ok "游戏服务端已关闭"
    fi

    info "停止 MySQL 与 Redis 服务..."
    systemctl stop mysqld 2>/dev/null || true
    systemctl stop redis 2>/dev/null >>"$LOG_FILE" 2>&1 || true
    systemctl disable mysqld >>"$LOG_FILE" 2>&1 || true
    systemctl disable redis >>"$LOG_FILE" 2>&1 || true
    ok "MySQL 服务已停止"

    info "卸载 MySQL 与 Redis 组件..."
    yum remove -y mysql-community-server mysql-community-client \
        mysql-community-client-plugins mysql-community-common \
        mysql-community-icu-data-files mysql-community-libs \
        mysql-connector-odbc redis >>"$LOG_FILE" 2>&1 || true
    ok "组件已卸载"

    info "删除数据文件和配置..."
    rm -rf /var/lib/mysql /var/log/mysqld.log /root/mysql8 /root/.my.cnf \
        /etc/my.cnf.rpmsave /etc/odbc.ini /etc/mysql/ssl /var/lib/redis \
        /etc/redis.conf.rpmsave /root/huanjing-credentials.txt
    ok "数据文件已清理"

    read -p "是否删除所有数据库残留？(y/N): " CLEAN_DB
    if [[ $CLEAN_DB =~ [Yy] ]]; then
        read -s -p "  请输入 MySQL root 密码: " DB_PWD; echo
        mysql -uroot -p"$DB_PWD" -e "DROP DATABASE IF EXISTS tlbbdb_main; \
DROP DATABASE IF EXISTS tlbbdb_world; DROP DATABASE IF EXISTS web;" >>"$LOG_FILE" 2>&1 || true
        ok "数据库已删除"
    fi

    info "清理残留依赖..."
    yum autoremove -y >>"$LOG_FILE" 2>&1 || true

    info "恢复原有 yum 源配置..."
    if [ -d /etc/yum.repos.d/backup ]; then
        mv /etc/yum.repos.d/backup/*.repo /etc/yum.repos.d/ 2>/dev/null || true
        rmdir /etc/yum.repos.d/backup 2>/dev/null || true
    fi
    ok "yum 源已恢复"

    info "移除全局命令与开机自启..."
    rm -f /usr/local/bin/tlbb
    systemctl disable tlbb.service >/dev/null 2>&1 || true
    rm -f /etc/systemd/system/tlbb.service
    systemctl daemon-reload 2>/dev/null || true

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

# Redis 密码：与 MySQL 分开。-p 模式自动生成；交互模式可自填或回车自动生成
gen_random_pw() { tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 16; }
if [ $NONINTERACTIVE -eq 1 ]; then
    REDIS_PASSWORD=$(gen_random_pw)
    ok "Redis 密码已自动生成（安装完成后在汇总面板与 /root/huanjing-credentials.txt 查看）"
else
    AUTO_REDIS=0
    read -p "请输入 Redis 密码（与 MySQL 不同，直接回车自动生成）: " REDIS_PASSWORD
    if [ -z "$REDIS_PASSWORD" ]; then
        REDIS_PASSWORD=$(gen_random_pw)
        AUTO_REDIS=1
    elif [[ "$REDIS_PASSWORD" =~ $BAD_CHARS ]]; then
        warn "Redis 密码包含 \$ \` \" ' 空格或反斜杠，已自动生成随机密码"
        REDIS_PASSWORD=$(gen_random_pw)
        AUTO_REDIS=1
    fi
    if [ $AUTO_REDIS -eq 1 ]; then
        ok "Redis 密码已自动生成: ${YELLOW}$REDIS_PASSWORD${NC}"
    fi
fi

# 步骤 1/13：腾讯云镜像源
step_begin "配置系统镜像源（el$EL_VER · $OS_ID）"
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

info "备份原有 yum 源配置..."
mkdir -p /etc/yum.repos.d/backup
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup/ 2>/dev/null || true
if [ "$OS_ID" = "centos" ] && [ "$EL_VER" = "7" ]; then
    info "CentOS 7 已停止维护，写入腾讯云 vault 归档源 + EPEL..."
    cat > /etc/yum.repos.d/CentOS-Base.repo << 'EOF'
[base]
name=CentOS-7 - Base - mirrors.tencent.com
baseurl=https://mirrors.tencent.com/centos-vault/7.9.2009/os/$basearch/
gpgcheck=1
gpgkey=https://mirrors.tencent.com/centos-vault/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-7 - Updates - mirrors.tencent.com
baseurl=https://mirrors.tencent.com/centos-vault/7.9.2009/updates/$basearch/
gpgcheck=1
gpgkey=https://mirrors.tencent.com/centos-vault/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-7 - Extras - mirrors.tencent.com
baseurl=https://mirrors.tencent.com/centos-vault/7.9.2009/extras/$basearch/
gpgcheck=1
gpgkey=https://mirrors.tencent.com/centos-vault/RPM-GPG-KEY-CentOS-7

[epel]
name=EPEL-7 - mirrors.tencent.com
baseurl=https://mirrors.tencent.com/epel/7/$basearch/
gpgcheck=0
enabled=1
EOF
elif [ "$OS_ID" = "centos" ]; then
    info "写入腾讯云 CentOS Stream 镜像配置..."
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
else
    info "检测到 $OS_PRETTY，保留系统自带镜像源"
fi
run_opt "清理 yum 缓存" yum clean all
run_opt "构建 yum 缓存（首次约1-2分钟）" yum makecache

# 步骤 2/13：系统依赖
step_begin "安装系统依赖包"
run     "安装 perl / net-tools / libaio / zip / openssl" yum install -y perl net-tools libaio zip openssl
run_opt "移除旧版 mysql-libs" yum -y remove mysql-libs
run_opt "安装 libnuma 依赖" yum install -y libnuma*
ok "依赖包安装完成"

# 步骤 3/13：定位安装包（RPM 仅 el9 离线用；SQL 备份所有版本都需要）
step_begin "定位 MySQL 安装包与数据库备份"
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
    TARGET_DIR=""
    warn "未找到 mysql-packages/ 目录或 mysql-packages.tar.gz"
    if [ "$EL_VER" = "9" ]; then
        info "MySQL 将改用官方在线源安装；数据库备份 SQL 缺失，导入步骤将跳过"
    else
        info "el$EL_VER 使用官方在线源安装 MySQL；数据库备份 SQL 缺失，导入步骤将跳过"
    fi
    info "如需完整部署，请将 mysql-packages 放在 install.sh 同目录后重试"
fi

# 步骤 4/13：安装 MySQL 组件（el9 离线 RPM / 其他版本官方在线源）
step_begin "安装 MySQL 组件（el$EL_VER）"
OFFLINE_RPMS=""
if [ "$EL_VER" = "9" ] && [ -n "$TARGET_DIR" ] && ls "$TARGET_DIR"/*.rpm >/dev/null 2>&1; then
    OFFLINE_RPMS=1
fi
if [ "$OFFLINE_RPMS" = "1" ]; then
    RPM_COUNT=$(ls -1 "$TARGET_DIR"/*.rpm 2>/dev/null | wc -l)
    info "离线模式：使用自带 $RPM_COUNT 个 RPM 包（输出已写入日志）..."
    cd "$TARGET_DIR"
    run "MySQL 8.0.31 及 ODBC 驱动安装完成" yum install -y \
        mysql-community-common-*.rpm \
        mysql-community-libs-*.rpm \
        mysql-community-client-plugins-*.rpm \
        mysql-community-icu-data-files-*.rpm \
        mysql-community-client-*.rpm \
        mysql-community-server-*.rpm \
        mysql-connector-odbc-*.rpm
else
    info "在线模式：写入 MySQL 官方源（repo.mysql.com）并安装..."
    cat > /etc/yum.repos.d/mysql80-community.repo <<EOF
[mysql80-community]
name=MySQL 8.0 Community Server
baseurl=https://repo.mysql.com/yum/mysql-8.0-community/el/$EL_VER/\$basearch/
enabled=1
gpgcheck=0

[mysql-connectors-community]
name=MySQL Connectors Community
baseurl=https://repo.mysql.com/yum/mysql-connectors-community/el/$EL_VER/\$basearch/
enabled=1
gpgcheck=0
EOF
    if [ "$EL_VER" = "8" ]; then
        run_opt "禁用 el8 内置 mysql 模块" yum -y module disable mysql
    fi
    run "MySQL 8.0 及 ODBC 驱动安装完成（官方在线源）" yum install -y mysql-community-server mysql-connector-odbc
fi

# 步骤 5/13：启动服务
step_begin "启动 MySQL 服务"
run "设置开机自启" systemctl enable mysqld
run "启动 mysqld"  systemctl start mysqld
sleep 3
ok "MySQL 服务已启动"

# 步骤 6/13：初始密码
step_begin "获取初始临时密码"
TEMP_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
if [ -z "$TEMP_PASSWORD" ]; then
    err "未在 /var/log/mysqld.log 中找到临时密码"
    tail -20 /var/log/mysqld.log 2>/dev/null || true
    exit 1
fi
info "临时密码: ${YELLOW}$TEMP_PASSWORD${NC}"

# 步骤 7/13：用户权限
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

# 步骤 8/13：SSL 证书
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

# 步骤 9/13：MySQL SSL 配置
step_begin "配置 MySQL SSL"
cat >> /etc/my.cnf <<EOF

[mysqld]
ssl-ca = $OPENSSL_DIR/ca.pem
ssl-cert = $OPENSSL_DIR/server-cert.pem
ssl-key = $OPENSSL_DIR/server-key.pem
EOF
ok "SSL 配置已写入 /etc/my.cnf"

# 步骤 10/13：导入数据库
step_begin "导入数据库"
if [ -z "$TARGET_DIR" ]; then
    warn "未找到 SQL 备份（mysql-packages 目录），跳过数据库导入，请稍后手动导入"
else
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
fi

# 步骤 11/13：ODBC 数据源
step_begin "配置 ODBC 数据源"
# 动态定位 ODBC 驱动（不同版本/安装方式路径可能不同）
ODBC_DRIVER=$(ls /usr/lib64/libmyodbc8a.so 2>/dev/null || ls /usr/lib64/libmyodbc*.so 2>/dev/null | head -1 || echo "/usr/lib64/libmyodbc8a.so")
info "ODBC 驱动: $ODBC_DRIVER"
cat > /etc/odbc.ini <<EOF
[tlbbdb_main]
Driver          = $ODBC_DRIVER
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = tlbbdb_main
OPTION          = 3
SOCKET          =

[tlbbdb_world]
Driver          = $ODBC_DRIVER
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = tlbbdb_world
OPTION          = 3
SOCKET          =

[web]
Driver          = $ODBC_DRIVER
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = web
OPTION          = 3
SOCKET          =
EOF
ok "三个 ODBC 数据源已写入 /etc/odbc.ini"

# 步骤 12/13：Redis
step_begin "安装配置 Redis"
run "安装 Redis" yum install -y redis
info "配置远程访问与独立访问密码..."
sed -i 's/^bind .*/bind 0.0.0.0/' /etc/redis.conf
sed -i 's/^protected-mode .*/protected-mode no/' /etc/redis.conf
sed -i '/^requirepass /d' /etc/redis.conf
echo "requirepass $REDIS_PASSWORD" >> /etc/redis.conf
run "设置 redis 开机自启" systemctl enable redis
run "启动 redis" systemctl restart redis
run_sh "Redis 连接验证" "redis-cli -a '$REDIS_PASSWORD' --no-auth-warning ping | grep -q PONG"
ok "Redis 配置完成（端口 6379）"

# 步骤 13/13：重启验证
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
REDIS_VER=$(redis-server --version 2>/dev/null | awk '{print $3}' | cut -d= -f2)
REDIS_VER="${REDIS_VER:-6.2}"
MYSQL_VER=$(mysql --version 2>/dev/null | grep -oE '[0-9]+(\.[0-9]+)+' | head -1)
MYSQL_VER="${MYSQL_VER:-8.0}"

# 账号信息落盘（仅 root 可读），防止忘记密码
CRED_FILE=/root/huanjing-credentials.txt
cat > "$CRED_FILE" <<EOF
游戏服务器环境账号信息（生成于 $(date '+%Y-%m-%d %H:%M:%S')）
============================================================
MySQL root 密码 : $MYSQL_ROOT_PASSWORD
Redis 密码      : $REDIS_PASSWORD
Redis 端口      : 6379
MySQL 端口      : 3306
============================================================
EOF
chmod 600 "$CRED_FILE"

# 注册全局 tlbb 命令（借鉴 gstlenv）：任意目录可用
cat > /usr/local/bin/tlbb <<EOF
#!/bin/bash
exec $SCRIPT_DIR/install.sh "\$@"
EOF
chmod +x /usr/local/bin/tlbb

clear
echo -e "${GREEN}"
echo  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  ${BOLD}🎉 安装成功完成！${NC}${GREEN}   总耗时: $T_FMT"
echo  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${NC}"
echo -e "  ${GREEN}✔${NC} MySQL 版本     ${YELLOW}${MYSQL_VER}${NC}（systemctl 管理，开机自启）"
echo -e "  ${GREEN}✔${NC} 数据库         ${YELLOW}tlbbdb_main / tlbbdb_world / web${NC}"
echo -e "  ${GREEN}✔${NC} 远程访问       root@% 已开启，插件 mysql_native_password"
echo -e "  ${GREEN}✔${NC} ODBC 数据源    ${YELLOW}/etc/odbc.ini${NC}"
echo -e "  ${GREEN}✔${NC} Redis 服务     ${YELLOW}${REDIS_VER}${NC}（端口 6379，独立密码）"
echo -e "  ${GREEN}✔${NC} SSL 证书       ${YELLOW}/etc/mysql/ssl/${NC}"
echo -e "  ${GREEN}✔${NC} SSH 服务       $SSH_STATUS"
echo ""
echo -e "  ${BLUE}ℹ${NC} 安装日志: $LOG_FILE"
echo -e "  ${BLUE}ℹ${NC} MySQL / Redis 密码已保存: ${YELLOW}$CRED_FILE${NC}（仅 root 可读）"
for d in "$SCRIPT_DIR/tlbb64" /root/tlbb64 /home/tlbb64; do
    if [ -f "$d/Server/Config/ServerInfo.ini" ]; then
        echo -e "  ${YELLOW}→${NC} 检测到服务端目录: ${YELLOW}$d${NC} — 运行 ${YELLOW}./config.sh${NC} 一键写入密码与外网IP"
        break
    fi
done
echo -e "  ${BLUE}ℹ${NC} 服务端管理: ${YELLOW}tlbb start | stop | status | restart | backup${NC}"
if sd=$(find_server_dir); then
    GAME_PORTS=$(grep -ahoE '^Port[0-9]*=[0-9]+' "$sd/Server/Config/ServerInfo.ini" 2>/dev/null | cut -d= -f2 | sort -un | tr '\n' ' ')
    [ -n "$GAME_PORTS" ] && echo -e "  ${YELLOW}→${NC} 云安全组请放行端口: ${YELLOW}$GAME_PORTS${NC}（6379/3306 建议仅对授权IP开放）"
fi
echo -e "  ${BLUE}ℹ${NC} 开机自启服务端: ${YELLOW}tlbb autostart on${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${GREEN}${BOLD}🚀 现在可以上传版本，开服！${NC}"
echo ""
