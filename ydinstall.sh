#!/bin/bash
set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印函数
print_info() {
    echo -e "${BLUE}[信息]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[成功]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[警告]${NC} $1"
}

print_error() {
    echo -e "${RED}[错误]${NC} $1"
}

print_step() {
    echo -e "\n${GREEN}========================================${NC}"
    echo -e "${GREEN}  $1${NC}"
    echo -e "${GREEN}========================================${NC}\n"
}

# 显示欢迎信息
clear
echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════════╗
║                                           ║
║     MySQL 8.0.31 自动化安装脚本           ║
║     CentOS 9 Stream 专用版本              ║
║                                           ║
╚═══════════════════════════════════════════╝
EOF
echo -e "${NC}"

# 步骤1：配置腾讯云镜像源
print_step "步骤 1/12: 配置腾讯云 YUM 镜像源"

# 等待其他 yum/dnf 进程完成
print_info "检查 yum/dnf 进程..."
WAIT_COUNT=0
while pgrep -x "yum|dnf" > /dev/null; do
    if [ $WAIT_COUNT -eq 0 ]; then
        print_warning "检测到其他 yum/dnf 进程正在运行，等待完成..."
    fi
    sleep 5
    WAIT_COUNT=$((WAIT_COUNT + 1))
    if [ $WAIT_COUNT -gt 60 ]; then
        print_error "等待超时，尝试强制终止..."
        pkill -9 yum 2>/dev/null || true
        pkill -9 dnf 2>/dev/null || true
        sleep 2
        break
    fi
done

if [ $WAIT_COUNT -gt 0 ]; then
    print_success "yum/dnf 进程已完成"
fi

print_info "备份原有 yum 源配置..."
mkdir -p /etc/yum.repos.d/backup
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup/ 2>/dev/null || true

print_info "配置腾讯云镜像源..."
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

print_info "清理并重建 yum 缓存..."
yum clean all 2>/dev/null || true
print_info "正在构建缓存（首次可能需要1-2分钟）..."
yum makecache 2>&1 | grep -v "Waiting for process" || true
print_success "腾讯云镜像源配置完成"

# 步骤2：用户输入 MySQL root 密码
print_step "步骤 2/12: 配置 MySQL 密码"
while true; do
    read -p "请输入MySQL root密码（至少4位）: " MYSQL_ROOT_PASSWORD
    if [ ${#MYSQL_ROOT_PASSWORD} -ge 4 ]; then
        break
    else
        print_error "密码长度不足，请输入至少4位字符"
    fi
done
print_success "密码设置完成"

# 步骤3：安装依赖包
print_step "步骤 3/12: 安装系统依赖包"
print_info "安装 perl, net-tools, libaio, zip..."
yum install -y perl net-tools libaio zip
print_info "移除旧版本 mysql-libs..."
yum -y remove mysql-libs 2>/dev/null || true
print_info "安装 libnuma 依赖..."
yum install -y perl libnuma*
print_success "依赖包安装完成"

# 步骤4：解压安装包
print_step "步骤 4/12: 解压 MySQL 安装包"
TAR_FILE="/home/mysql-packages.tar.gz"
TARGET_DIR="/root/mysql8"

if [ ! -f "$TAR_FILE" ]; then
    print_error "安装包不存在: $TAR_FILE"
    exit 1
fi

mkdir -p "$TARGET_DIR"
print_info "正在解压到 $TARGET_DIR ..."
tar -xzf "$TAR_FILE" -C /root/
# 如果解压后是 mysql-packages 目录，重命名为 mysql8
if [ -d "/root/mysql-packages" ]; then
    rm -rf "$TARGET_DIR"
    mv /root/mysql-packages "$TARGET_DIR"
fi
print_success "解压完成"

# 步骤5：安装 MySQL RPM 包
print_step "步骤 5/12: 安装 MySQL 组件"
cd "$TARGET_DIR"

# 验证 RPM 文件是否存在
RPM_COUNT=$(ls -1 *.rpm 2>/dev/null | wc -l)
if [ $RPM_COUNT -eq 0 ]; then
    print_error "未找到 RPM 文件，请检查压缩包内容"
    ls -la "$TARGET_DIR"
    exit 1
fi

print_info "找到 $RPM_COUNT 个 RPM 包"
print_info "按依赖顺序安装 RPM 包..."
dnf install -y \
  mysql-community-common-*.rpm \
  mysql-community-libs-*.rpm \
  mysql-community-client-plugins-*.rpm \
  mysql-community-icu-data-files-*.rpm \
  mysql-community-client-*.rpm \
  mysql-community-server-*.rpm \
  mysql-connector-odbc-*.rpm
print_success "MySQL 组件安装完成"

# 步骤6：启动 MySQL 服务
print_step "步骤 6/12: 启动 MySQL 服务"
print_info "设置开机自启动..."
systemctl enable mysqld
print_info "启动 MySQL 服务..."
systemctl start mysqld
sleep 3
print_success "MySQL 服务已启动"

# 步骤7：获取初始密码
print_step "步骤 7/12: 获取初始临时密码"
TEMP_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
print_info "临时密码: ${YELLOW}$TEMP_PASSWORD${NC}"

# 步骤8：配置 root 密码和权限
print_step "步骤 8/12: 配置 MySQL 用户权限"
print_info "修改密码策略..."
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

print_info "创建 /root/.my.cnf 配置文件..."
cat <<EOF > /root/.my.cnf
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

# 步骤9：生成 SSL 证书
print_step "步骤 9/12: 生成 SSL 证书"
OPENSSL_DIR="/etc/mysql/ssl"
mkdir -p "$OPENSSL_DIR"

# 备份当前 OpenSSL 和 SSH 版本信息
OPENSSL_VERSION_BEFORE=$(openssl version 2>/dev/null || echo "未安装")
SSH_VERSION_BEFORE=$(ssh -V 2>&1 | head -n1)

if ! command -v openssl &> /dev/null; then
    print_warning "OpenSSL 未安装，正在安装（不升级现有版本）..."
    yum install -y openssl --setopt=obsoletes=0
else
    print_info "OpenSSL 已安装，跳过安装步骤"
fi

# 检查 OpenSSL 版本是否发生变化
OPENSSL_VERSION_AFTER=$(openssl version 2>/dev/null)
if [ "$OPENSSL_VERSION_BEFORE" != "$OPENSSL_VERSION_AFTER" ] && [ "$OPENSSL_VERSION_BEFORE" != "未安装" ]; then
    print_warning "检测到 OpenSSL 版本变化，正在检查 SSH 兼容性..."
    
    # 测试 SSH 服务是否正常
    if ! systemctl status sshd &>/dev/null; then
        print_error "SSH 服务异常，正在尝试修复..."
        
        # 尝试重启 SSH
        systemctl restart sshd 2>/dev/null || {
            print_warning "SSH 重启失败，尝试降级 OpenSSL..."
            
            # 降级 OpenSSL
            for i in {1..3}; do
                yum downgrade openssl -y 2>/dev/null || break
            done
            
            # 再次尝试重启 SSH
            systemctl restart sshd 2>/dev/null || {
                print_warning "降级失败，尝试升级 SSH 服务..."
                yum install openssh-server -y
                systemctl restart sshd
            }
        }
        
        # 验证修复结果
        if systemctl status sshd &>/dev/null; then
            print_success "SSH 服务已修复"
        else
            print_error "SSH 服务修复失败，请通过 VNC 手动处理"
        fi
    else
        print_success "SSH 服务运行正常"
    fi
fi

print_info "生成 RSA 私钥..."
openssl genpkey -algorithm RSA -out "$OPENSSL_DIR/server-key.pem"
print_info "生成证书请求..."
openssl req -new -key "$OPENSSL_DIR/server-key.pem" -out "$OPENSSL_DIR/certificate_request.csr" -subj "/CN=mysql-server"
print_info "签发证书..."
openssl x509 -req -days 365 -in "$OPENSSL_DIR/certificate_request.csr" -signkey "$OPENSSL_DIR/server-key.pem" -out "$OPENSSL_DIR/server-cert.pem"
cp "$OPENSSL_DIR/server-cert.pem" "$OPENSSL_DIR/ca.pem"
print_success "SSL 证书生成完成"

# 步骤10：配置 MySQL SSL
print_step "步骤 10/12: 配置 MySQL SSL"
cat <<EOF >> /etc/my.cnf
[mysqld]
ssl-ca = $OPENSSL_DIR/ca.pem
ssl-cert = $OPENSSL_DIR/server-cert.pem
ssl-key = $OPENSSL_DIR/server-key.pem
EOF
print_success "SSL 配置完成"

# 步骤11：导入数据库
print_step "步骤 11/12: 导入数据库"
print_info "创建数据库 tlbbdb_main..."
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS tlbbdb_main"
print_info "导入 tlbbdb_main.sql (可能需要几分钟)..."
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" tlbbdb_main < "$TARGET_DIR/tlbbdb_main.sql"
print_success "tlbbdb_main 导入完成"

print_info "创建数据库 tlbbdb_world..."
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS tlbbdb_world"
print_info "导入 tlbbdb_world.sql (可能需要几分钟)..."
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" tlbbdb_world < "$TARGET_DIR/tlbbdb_world.sql"
print_success "tlbbdb_world 导入完成"

print_info "创建数据库 web..."
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS web"
print_info "导入 web.sql..."
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" web < "$TARGET_DIR/web.sql"
print_success "web 导入完成"

# 步骤12：配置 ODBC
print_step "步骤 12/12: 配置 ODBC 数据源"
cat <<EOF > /etc/odbc.ini
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

# 重启 MySQL 服务
print_info "重启 MySQL 服务..."
systemctl restart mysqld
print_success "MySQL 服务重启完成"

# 最终 SSH 服务检查
print_info "执行最终 SSH 服务检查..."
if systemctl is-active --quiet sshd; then
    SSH_STATUS="${GREEN}✓ 正常运行${NC}"
else
    SSH_STATUS="${RED}✗ 服务异常${NC}"
    print_warning "SSH 服务状态异常，建议通过 VNC 检查"
fi

# 清理安装文件
print_info "清理安装文件..."
rm -f /home/ydinstall.sh /home/ydindd.sh /home/mysql-packages.tar.gz

# 显示完成信息
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
echo -e "${GREEN}✓${NC} 数据库列表:"
echo -e "  • tlbbdb_main"
echo -e "  • tlbbdb_world"
echo -e "  • web"
echo -e "${GREEN}✓${NC} ODBC 配置: ${YELLOW}/etc/odbc.ini${NC}"
echo -e "${GREEN}✓${NC} Root 密码: ${YELLOW}已设置${NC}"
echo -e "${GREEN}✓${NC} SSH 服务: $SSH_STATUS"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${GREEN}现在可以上传版本，开服！${NC}"
echo ""
