#!/bin/bash
# ============================================================================
#  一键环境安装脚本（MySQL 8.0.31 @ CentOS Stream 9）
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
# ============================================================================
set -e

# ---------------------------- 颜色与输出 ------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_info()    { echo -e "${BLUE}[信息]${NC} $1"; }
print_success() { echo -e "${GREEN}[成功]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[警告]${NC} $1"; }
print_error()   { echo -e "${RED}[错误]${NC} $1"; }
print_step()    { echo -e "\n${GREEN}========================================${NC}"; \
                  echo -e "${GREEN}  $1${NC}"; \
                  echo -e "${GREEN}========================================${NC}\n"; }

CURRENT_STEP="初始化"
trap 'print_error "安装在第 $CURRENT_STEP 阶段失败，可运行 ./install.sh uninstall 清理后重试"; exit 1' ERR

# ---------------------------- 前置检查 --------------------------------------
if [ "$(id -u)" -ne 0 ]; then
    print_error "请使用 root 用户运行: sudo ./install.sh"
    exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

if ! grep -qi "CentOS Stream 9\|CentOS Stream release 9" /etc/os-release 2>/dev/null; then
    print_warning "当前系统不是 CentOS Stream 9，脚本可能不兼容（继续执行）"
    grep PRETTY /etc/os-release 2>/dev/null || true
fi

# ---------------------------- 定位安装包 ------------------------------------
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

# ---------------------------- 卸载模式 --------------------------------------
if [ "$1" = "uninstall" ] || [ "$1" = "-u" ]; then
    CURRENT_STEP="卸载"
    clear
    echo -e "${RED}"
    cat << "EOF"
╔═══════════════════════════════════════════╗
║          MySQL 一键卸载                   ║
║          ⚠️  警告：此操作不可逆！         ║
╚═══════════════════════════════════════════╝
EOF
    echo -e "${NC}"

    read -p "确认要卸载 MySQL 吗？(输入 YES 继续): " CONFIRM
    if [ "$CONFIRM" != "YES" ]; then
        print_info "已取消卸载操作"; exit 0
    fi

    print_info "停止 MySQL 服务..."
    systemctl stop mysqld 2>/dev/null || true
    systemctl disable mysqld 2>/dev/null || true

    print_info "卸载 MySQL 组件..."
    dnf remove -y mysql-community-server mysql-community-client \
        mysql-community-client-plugins mysql-community-common \
        mysql-community-icu-data-files mysql-community-libs \
        mysql-connector-odbc 2>/dev/null || true

    print_info "删除数据文件和配置..."
    rm -rf /var/lib/mysql /var/log/mysqld.log /root/mysql8 /root/.my.cnf \
        /etc/my.cnf.rpmsave /etc/odbc.ini /etc/mysql/ssl

    read -p "是否删除所有数据库备份残留？(y/N): " CLEAN_DB
    if [[ $CLEAN_DB =~ [Yy] ]]; then
        read -s -p "请输入 MySQL root 密码: " DB_PWD; echo
        mysql -uroot -p"$DB_PWD" -e "DROP DATABASE IF EXISTS tlbbdb_main; DROP DATABASE IF EXISTS tlbbdb_world; DROP DATABASE IF EXISTS web;" 2>/dev/null || true
    fi

    print_info "清理残留依赖..."
    dnf autoremove -y

    print_info "恢复原有 yum 源配置..."
    if [ -d /etc/yum.repos.d/backup ]; then
        mv /etc/yum.repos.d/backup/*.repo /etc/yum.repos.d/ 2>/dev/null || true
        rmdir /etc/yum.repos.d/backup 2>/dev/null || true
    fi

    echo ""
    print_success "MySQL 已完全卸载"
    exit 0
fi

# ---------------------------- 安装模式 --------------------------------------
clear
echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════════╗
║                                           ║
║     一键环境安装 · MySQL 8.0.31           ║
║     CentOS 9 Stream 专用版本              ║
║                                           ║
╚═══════════════════════════════════════════╝
EOF
echo -e "${NC}"

# 密码: -p 参数 或 交互输入（两次确认，禁止 shell 特殊字符）
if [ "$1" = "-p" ] && [ -n "$2" ]; then
    MYSQL_ROOT_PASSWORD="$2"
else
    while true; do
        read -s -p "请输入 MySQL root 密码（至少4位）: " MYSQL_ROOT_PASSWORD; echo
        read -s -p "请再次输入确认: " MYSQL_ROOT_PASSWORD2; echo
        [ "$MYSQL_ROOT_PASSWORD" != "$MYSQL_ROOT_PASSWORD2" ] && { print_error "两次输入不一致，请重新输入"; continue; }
        if [ ${#MYSQL_ROOT_PASSWORD} -lt 4 ]; then
            print_error "密码长度不足，请输入至少4位字符"; continue
        fi
        if [ ${#MYSQL_ROOT_PASSWORD} -lt 4 ]; then
            print_error "密码长度不足，请输入至少4位字符"; continue
        fi
        # 禁止会破坏 SQL/heredoc 的 shell 特殊字符
        BAD_CHARS='[$`"'"'"'\\ ]'
        if [[ "$MYSQL_ROOT_PASSWORD" =~ $BAD_CHARS ]]; then
            print_error "密码不能包含 \$ \` \" ' 空格或反斜杠，请重新输入"; continue
        fi
        break
    done
fi
print_success "密码设置完成"

# 步骤1/12：腾讯云镜像源
CURRENT_STEP="配置 YUM 镜像源"
print_step "步骤 1/12: 配置腾讯云 YUM 镜像源"
print_info "检查 yum/dnf 进程..."
WAIT_COUNT=0
while pgrep -x yum >/dev/null 2>&1 || pgrep -x dnf >/dev/null 2>&1; do
    [ $WAIT_COUNT -eq 0 ] && print_warning "检测到其他 yum/dnf 进程正在运行，等待完成..."
    sleep 5; WAIT_COUNT=$((WAIT_COUNT + 1))
    if [ $WAIT_COUNT -gt 60 ]; then
        print_warning "等待超时，尝试强制终止..."
        pkill -9 yum 2>/dev/null || true; pkill -9 dnf 2>/dev/null || true; sleep 2; break
    fi
done

print_info "备份原有 yum 源配置..."
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

yum clean all 2>/dev/null || true
print_info "正在构建缓存（首次可能需要1-2分钟）..."
yum makecache >/dev/null 2>&1 || true
print_success "腾讯云镜像源配置完成"

# 步骤2/12：安装依赖
CURRENT_STEP="安装系统依赖"
print_step "步骤 2/12: 安装系统依赖包"
yum install -y perl net-tools libaio zip openssl
yum -y remove mysql-libs 2>/dev/null || true
yum install -y libnuma* 2>/dev/null || true
print_success "依赖包安装完成"

# 步骤3/12：定位/解压安装包
CURRENT_STEP="定位 MySQL 安装包"
print_step "步骤 3/12: 定位 MySQL 安装包"
TAR_FILE=""
PKG_DIR=""
if find_packages; then
    if [ -n "$PKG_DIR" ]; then
        print_success "已找到安装包目录: $PKG_DIR"
        TARGET_DIR="$PKG_DIR"
    else
        TARGET_DIR="/root/mysql8"
        print_info "找到压缩包 $TAR_FILE，正在解压到 $TARGET_DIR ..."
        rm -rf "$TARGET_DIR"; mkdir -p "$TARGET_DIR"
        tar -xzf "$TAR_FILE" -C "$TARGET_DIR" --strip-components=1 2>/dev/null || tar -xzf "$TAR_FILE" -C "$TARGET_DIR"
        # 若解压出嵌套目录则展开
        if ! ls "$TARGET_DIR"/*.rpm >/dev/null 2>&1; then
            SUB=$(find "$TARGET_DIR" -maxdepth 2 -name "*.rpm" | head -1 | xargs -r dirname)
            if [ -n "$SUB" ] && [ "$SUB" != "$TARGET_DIR" ]; then
                mv "$SUB"/*.rpm "$TARGET_DIR/" 2>/dev/null || true
                mv "$SUB"/*.sql "$TARGET_DIR/" 2>/dev/null || true
                rm -rf "$SUB"
            fi
        fi
        print_success "解压完成"
    fi
else
    print_error "未找到 mysql-packages/ 目录或 mysql-packages.tar.gz"
    print_info "请将 mysql-packages 文件夹（或压缩包）放在 install.sh 同目录后重试"
    exit 1
fi

# 步骤4/12：安装 MySQL RPM
CURRENT_STEP="安装 MySQL 组件"
print_step "步骤 4/12: 安装 MySQL 组件"
cd "$TARGET_DIR"
RPM_COUNT=$(ls -1 *.rpm 2>/dev/null | wc -l)
if [ "$RPM_COUNT" -eq 0 ]; then
    print_error "未找到 RPM 文件"; ls -la "$TARGET_DIR"; exit 1
fi
print_info "找到 $RPM_COUNT 个 RPM 包，按依赖顺序安装..."
dnf install -y \
    mysql-community-common-*.rpm \
    mysql-community-libs-*.rpm \
    mysql-community-client-plugins-*.rpm \
    mysql-community-icu-data-files-*.rpm \
    mysql-community-client-*.rpm \
    mysql-community-server-*.rpm \
    mysql-connector-odbc-*.rpm
print_success "MySQL 组件安装完成"

# 步骤5/12：启动服务
CURRENT_STEP="启动 MySQL 服务"
print_step "步骤 5/12: 启动 MySQL 服务"
systemctl enable mysqld
systemctl start mysqld
sleep 3
print_success "MySQL 服务已启动"

# 步骤6/12：获取临时密码
CURRENT_STEP="获取初始密码"
print_step "步骤 6/12: 获取初始临时密码"
TEMP_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
if [ -z "$TEMP_PASSWORD" ]; then
    print_error "未在 /var/log/mysqld.log 中找到临时密码，请检查 MySQL 启动状态"
    exit 1
fi
print_info "临时密码: ${YELLOW}$TEMP_PASSWORD${NC}"

# 步骤7/12：配置 root 密码与远程权限
CURRENT_STEP="配置 MySQL 用户权限"
print_step "步骤 7/12: 配置 MySQL 用户权限"
mysql --connect-expired-password -uroot -p"$TEMP_PASSWORD" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$TEMP_PASSWORD';
FLUSH PRIVILEGES;
SET GLOBAL validate_password.policy = 0;
SET GLOBAL validate_password.length = 4;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

print_info "创建 /root/.my.cnf 免密登录配置..."
cat > /root/.my.cnf <<EOF
[client]
user = root
password = $MYSQL_ROOT_PASSWORD
host = localhost
EOF
chmod 600 /root/.my.cnf

print_info "修改认证插件为 mysql_native_password..."
mysql --defaults-file=/root/.my.cnf <<EOF
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
print_success "用户权限配置完成"

# 步骤8/12：生成 SSL 证书
CURRENT_STEP="生成 SSL 证书"
print_step "步骤 8/12: 生成 SSL 证书"
OPENSSL_DIR="/etc/mysql/ssl"
mkdir -p "$OPENSSL_DIR"
if ! command -v openssl >/dev/null 2>&1; then
    print_warning "OpenSSL 未安装，正在安装（不升级现有版本）..."
    yum install -y openssl --setopt=obsoletes=0
else
    print_info "OpenSSL 已安装（$(openssl version 2>/dev/null)），跳过"
fi
if ! systemctl is-active --quiet sshd; then
    print_warning "SSH 服务异常，尝试修复（防止 OpenSSL/SSH 版本冲突）..."
    systemctl restart sshd 2>/dev/null || {
        for i in 1 2 3; do yum downgrade openssl -y 2>/dev/null && break || true; done
        systemctl restart sshd 2>/dev/null || { yum install -y openssh-server; systemctl restart sshd; }
    }
fi
print_info "生成 RSA 私钥与证书..."
openssl genpkey -algorithm RSA -out "$OPENSSL_DIR/server-key.pem"
openssl req -new -key "$OPENSSL_DIR/server-key.pem" -out "$OPENSSL_DIR/certificate_request.csr" -subj "/CN=mysql-server"
openssl x509 -req -days 365 -in "$OPENSSL_DIR/certificate_request.csr" -signkey "$OPENSSL_DIR/server-key.pem" -out "$OPENSSL_DIR/server-cert.pem"
cp "$OPENSSL_DIR/server-cert.pem" "$OPENSSL_DIR/ca.pem"
print_success "SSL 证书生成完成"

# 步骤9/12：配置 MySQL SSL
CURRENT_STEP="配置 MySQL SSL"
print_step "步骤 9/12: 配置 MySQL SSL"
cat >> /etc/my.cnf <<EOF
[mysqld]
ssl-ca = $OPENSSL_DIR/ca.pem
ssl-cert = $OPENSSL_DIR/server-cert.pem
ssl-key = $OPENSSL_DIR/server-key.pem
EOF
print_success "SSL 配置完成"

# 步骤10/12：导入数据库
CURRENT_STEP="导入数据库"
print_step "步骤 10/12: 导入数据库"
for DB in tlbbdb_main tlbbdb_world web; do
    print_info "创建并导入数据库 $DB ..."
    mysql --defaults-file=/root/.my.cnf -e "CREATE DATABASE IF NOT EXISTS $DB"
    SQL_FILE="$TARGET_DIR/$DB.sql"
    if [ -f "$SQL_FILE" ]; then
        mysql --defaults-file=/root/.my.cnf "$DB" < "$SQL_FILE"
        print_success "$DB 导入完成"
    else
        print_warning "未找到 $SQL_FILE，跳过 $DB"
    fi
done

# 步骤11/12：配置 ODBC
CURRENT_STEP="配置 ODBC 数据源"
print_step "步骤 11/12: 配置 ODBC 数据源"
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
print_success "ODBC 配置完成"

# 步骤12/12：重启并验证
CURRENT_STEP="重启并验证服务"
print_step "步骤 12/12: 重启并验证服务"
systemctl restart mysqld
sleep 2
mysql --defaults-file=/root/.my.cnf -e "SHOW DATABASES;" && print_success "MySQL 登录验证通过"

trap - ERR
if systemctl is-active --quiet sshd; then
    SSH_STATUS="${GREEN}✓ 正常运行${NC}"
else
    SSH_STATUS="${RED}✗ 服务异常（请通过 VNC 检查）${NC}"
fi

clear
echo -e "${GREEN}"
cat << "EOF"
╔═══════════════════════════════════════════╗
║                                           ║
║          安装成功完成！                   ║
║                                           ║
╚═══════════════════════════════════════════╝
EOF
echo -e "${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✓${NC} MySQL 版本: ${YELLOW}8.0.31${NC}"
echo -e "${GREEN}✓${NC} 数据库列表: ${YELLOW}tlbbdb_main / tlbbdb_world / web${NC}"
echo -e "${GREEN}✓${NC} ODBC 配置: ${YELLOW}/etc/odbc.ini${NC}"
echo -e "${GREEN}✓${NC} SSL 证书:  ${YELLOW}/etc/mysql/ssl/${NC}"
echo -e "${GREEN}✓${NC} SSH 服务: $SSH_STATUS"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${GREEN}现在可以上传版本，开服！${NC}"
echo ""
