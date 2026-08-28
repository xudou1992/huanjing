#!/bin/bash
set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

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

# 显示警告信息
clear
echo -e "${RED}"
cat << "EOF"
╔═══════════════════════════════════════════╗
║                                           ║
║          MySQL 卸载脚本                   ║
║          ⚠️  警告：此操作不可逆！         ║
║                                           ║
╚═══════════════════════════════════════════╝
EOF
echo -e "${NC}"

read -p "确认要卸载 MySQL 吗？(输入 YES 继续): " CONFIRM
if [ "$CONFIRM" != "YES" ]; then
    print_info "已取消卸载操作"
    exit 0
fi

# 停止并禁用MySQL服务
echo ""
print_info "停止 MySQL 服务..."
systemctl stop mysqld 2>/dev/null || true
systemctl disable mysqld 2>/dev/null || true
print_success "MySQL 服务已停止"

# 卸载MySQL软件包
print_info "卸载 MySQL 组件..."
dnf remove -y \
  mysql-community-server \
  mysql-community-client \
  mysql-community-client-plugins \
  mysql-community-common \
  mysql-community-icu-data-files \
  mysql-community-libs \
  mysql-connector-odbc 2>/dev/null || true
print_success "MySQL 组件已卸载"

# 清理残留文件和目录
print_info "删除数据文件和配置..."
rm -rf \
  /var/lib/mysql \
  /var/log/mysqld.log \
  /root/mysql8 \
  /root/.my.cnf \
  /etc/my.cnf.rpmsave \
  /etc/odbc.ini
print_success "数据文件已清理"

# 删除SSL证书
print_info "清理 SSL 证书..."
rm -rf /etc/mysql/ssl
print_success "SSL 证书已清理"

# 删除自动生成的MySQL配置文件
print_info "恢复 my.cnf 配置..."
sed -i '/ssl-ca/d;/ssl-cert/d;/ssl-key/d' /etc/my.cnf 2>/dev/null || true

# 可选：删除创建的数据库
echo ""
read -p "是否删除所有数据库？(y/N): " CLEAN_DB
if [[ $CLEAN_DB =~ [Yy] ]]; then
    print_warning "正在删除数据库..."
    MYSQL_ROOT_PASSWORD=$(grep 'Password' /etc/odbc.ini.bak 2>/dev/null | awk -F'=' '{print $2}' | tr -d ' ')
    [ -z "$MYSQL_ROOT_PASSWORD" ] && read -s -p "请输入MySQL root密码: " MYSQL_ROOT_PASSWORD
    
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "DROP DATABASE IF EXISTS tlbbdb_main; DROP DATABASE IF EXISTS tlbbdb_world; DROP DATABASE IF EXISTS web;" 2>/dev/null || true
    print_success "数据库已删除"
fi

# 清理系统依赖
print_info "清理残留依赖..."
dnf autoremove -y
print_success "残留依赖已清理"

# 重置ODBC配置
print_info "重置 ODBC 配置..."
mv /etc/odbc.ini /etc/odbc.ini.bak 2>/dev/null || true

# 恢复原有 yum 源
print_info "恢复原有 yum 源配置..."
if [ -d "/etc/yum.repos.d/backup" ]; then
    mv /etc/yum.repos.d/backup/*.repo /etc/yum.repos.d/ 2>/dev/null || true
    rmdir /etc/yum.repos.d/backup 2>/dev/null || true
fi

echo ""
echo -e "${GREEN}"
cat << "EOF"
╔═══════════════════════════════════════════╗
║                                           ║
║          卸载完成！                       ║
║                                           ║
╚═══════════════════════════════════════════╝
EOF
echo -e "${NC}"
print_success "MySQL 已完全卸载"
