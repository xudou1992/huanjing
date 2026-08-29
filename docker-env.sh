#!/bin/bash
# Docker profiles for legacy TLBB server packages. One profile is active at a time.
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
WORK_DIR="${HUANJING_DOCKER_DIR:-/opt/huanjing-docker}"
DATA_DIR="$WORK_DIR/data"
ENV_FILE="$WORK_DIR/.env"
COMPOSE_FILE="$WORK_DIR/docker-compose.yml"
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'
info() { echo -e "  ${BLUE}i${NC} $1"; }
ok() { echo -e "  ${GREEN}OK${NC} $1"; }
warn() { echo -e "  ${YELLOW}!${NC} $1"; }
err() { echo -e "  ${RED}X${NC} $1"; }

require_root() {
    [ "$(id -u)" -eq 0 ] || { err "请使用 root 用户运行"; exit 1; }
}

docker_compose() {
    if docker compose version >/dev/null 2>&1; then
        docker compose "$@"
    elif command -v docker-compose >/dev/null 2>&1; then
        docker-compose "$@"
    else
        err "未找到 Docker Compose"
        exit 1
    fi
}

require_docker() {
    if command -v docker >/dev/null 2>&1 && { docker compose version >/dev/null 2>&1 || command -v docker-compose >/dev/null 2>&1; }; then
        return 0
    fi
    command -v curl >/dev/null 2>&1 || { err "缺少 curl，无法安装 Docker"; exit 1; }
    warn "Docker 或 Docker Compose 未安装"
    read -r -p "现在安装 Docker Engine 与 Compose？(Y/n): " install_docker
    [[ "$install_docker" =~ ^[Nn] ]] && exit 1
    local install_url="${HUANJING_DOCKER_INSTALL_URL:-https://get.docker.com}"
    info "Docker 安装地址: $install_url"
    curl -fsSL "$install_url" | sh
    systemctl enable --now docker
    command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1 || {
        err "Docker 安装后仍未找到 Compose；请安装 docker-compose-plugin 后重试"
        exit 1
    }
}

profile_values() {
    case "$1" in
        1) PROFILE_NAME='环境1：CentOS 6 + MySQL 5.1'; SERVER_IMAGE='registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_server:latest'; MYSQL_IMAGE='registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_mysql51:latest'; DB_MODE='image' ;;
        2) PROFILE_NAME='环境2：CentOS 7 + MySQL 5.1'; SERVER_IMAGE='registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_server7:latest'; MYSQL_IMAGE='registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_mysql51:latest'; DB_MODE='image' ;;
        3) PROFILE_NAME='环境3：CentOS 7 + MySQL 5.7'; SERVER_IMAGE='registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_server7:latest'; MYSQL_IMAGE='registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_mysql57:latest'; DB_MODE='image' ;;
        4) PROFILE_NAME='环境4：CentOS 9 + MySQL 8.0'; SERVER_IMAGE='registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_server9:latest'; MYSQL_IMAGE='registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_mysql80:latest'; DB_MODE='sql8' ;;
        *) err "环境编号只能是 1 到 4"; return 1 ;;
    esac
}

write_compose() {
    mkdir -p "$WORK_DIR" "$DATA_DIR/gsmysql" "$DATA_DIR/redis" "$DATA_DIR/tlbb" "$DATA_DIR/backup"
    cat > "$COMPOSE_FILE" <<'EOF'
services:
  gsserver:
    image: ${SERVER_IMAGE}
    container_name: gsserver
    volumes:
      - "${DATA_DIR}/:/home"
    ports:
      - "${LOGIN_PORT}:13580"
      - "${SERVER_PORT}:15680"
      - "${BILLING_PORT}:21818"
    depends_on:
      - gsmysql
      - gsredis
    restart: unless-stopped
  gsmysql:
    image: ${MYSQL_IMAGE}
    container_name: gsmysql
    volumes:
      - "${DATA_DIR}/gsmysql:/var/lib/mysql"
      - "${DATA_DIR}/backup:/home/backup"
    ports:
      - "${MYSQL_PORT}:3306"
    environment:
      MYSQL_USER: root
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      MYSQL_ROOT_PASSWORD: ${MYSQL_PASSWORD}
      MYSQL_ALLOW_EMPTY_PASSWORD: "yes"
      MYSQL_DATABASE_TLBBDB: tlbbdb
      MYSQL_DATABASE_WEB: web
      TZ: Asia/Shanghai
    restart: unless-stopped
  gsredis:
    image: ${REDIS_IMAGE}
    container_name: gsredis
    command: ["redis-server", "--appendonly", "yes", "--requirepass", "${REDIS_PASSWORD}"]
    ports:
      - "${REDIS_PORT}:6379"
    volumes:
      - "${DATA_DIR}/redis:/data"
    restart: unless-stopped
EOF
}

make_env_file() {
    cat > "$ENV_FILE" <<EOF
PROFILE=$PROFILE
PROFILE_NAME="$PROFILE_NAME"
DB_MODE=$DB_MODE
SERVER_IMAGE=$SERVER_IMAGE
MYSQL_IMAGE=$MYSQL_IMAGE
REDIS_IMAGE=registry.cn-hangzhou.aliyuncs.com/yulinzhihou/gs_redis:latest
DATA_DIR=$DATA_DIR
MYSQL_PASSWORD=$MYSQL_PASSWORD
REDIS_PASSWORD=$REDIS_PASSWORD
MYSQL_PORT=$MYSQL_PORT
REDIS_PORT=$REDIS_PORT
LOGIN_PORT=$LOGIN_PORT
SERVER_PORT=$SERVER_PORT
BILLING_PORT=$BILLING_PORT
EOF
    chmod 600 "$ENV_FILE"
}

load_env() {
    [ -f "$ENV_FILE" ] || { err "未安装 Docker 环境，请先选择菜单 1"; exit 1; }
    # shellcheck disable=SC1090
    . "$ENV_FILE"
}

random_password() { tr -dc 'A-Za-z0-9' </dev/urandom | head -c 16; }

select_profile() {
    echo -e "${CYAN}${BOLD}选择 Docker 环境版本${NC}"
    echo "  1) CentOS 6 + MySQL 5.1（老服务端）"
    echo "  2) CentOS 7 + MySQL 5.1（老服务端）"
    echo "  3) CentOS 7 + MySQL 5.7（改引擎/改库服务端）"
    echo "  4) CentOS 9 + MySQL 8.0（64 位源端服务端）"
    if [ "${FORCE_PROFILE:-0}" != 1 ]; then
        read -r -p "请选择（默认 1）: " PROFILE
        PROFILE="${PROFILE:-1}"
    fi
    profile_values "$PROFILE"
}

validate_secret() {
    local label="$1" value="$2"
    [ ${#value} -ge 4 ] || { err "$label 至少 4 位"; return 1; }
    [[ "$value" =~ ^[A-Za-z0-9._:@%+=,-]+$ ]] || {
        err "$label 只能包含字母、数字和 . _ : @ % + = , -（便于写入 Compose）"
        return 1
    }
}

install_profile() {
    require_docker
    if [ -f "$ENV_FILE" ]; then
        . "$ENV_FILE"
        warn "已存在 Docker 环境：${PROFILE_NAME:-未知}"
        read -r -p "切换环境会删除当前 Docker 数据库和服务端数据，输入 RESET 继续: " confirm
        [ "$confirm" = RESET ] || { info "已取消"; return 0; }
        docker_compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" down -v || true
        rm -rf "$DATA_DIR"
    fi
    select_profile
    read -r -s -p "请输入 MySQL root 密码（回车自动生成）: " MYSQL_PASSWORD; echo
    MYSQL_PASSWORD="${MYSQL_PASSWORD:-$(random_password)}"
    validate_secret "MySQL 密码" "$MYSQL_PASSWORD"
    read -r -s -p "请输入 Redis 密码（回车自动生成）: " REDIS_PASSWORD; echo
    REDIS_PASSWORD="${REDIS_PASSWORD:-$(random_password)}"
    validate_secret "Redis 密码" "$REDIS_PASSWORD"
    MYSQL_PORT=33061; REDIS_PORT=6379; LOGIN_PORT=13580; SERVER_PORT=15680; BILLING_PORT=21818
    write_compose
    make_env_file
    info "拉取 ${PROFILE_NAME} 镜像并启动数据库、Redis、服务端容器..."
    docker_compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" pull
    docker_compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" up -d
    init_database
    ok "${PROFILE_NAME} 已部署"
    info "MySQL: 127.0.0.1:$MYSQL_PORT；Redis: 127.0.0.1:$REDIS_PORT"
    info "数据库和服务端数据目录: $DATA_DIR"
}

wait_mysql() {
    local n
    for n in $(seq 1 30); do
        if docker exec gsmysql mysql -uroot "-p$MYSQL_PASSWORD" -e 'SELECT 1' >/dev/null 2>&1; then return 0; fi
        sleep 2
    done
    err "MySQL 容器 60 秒内未就绪，查看日志：docker logs gsmysql"
    return 1
}

import_sql8() {
    local sql_dir="$SCRIPT_DIR/mysql-packages" file db
    for file in tlbbdb_main.sql tlbbdb_world.sql web.sql; do
        [ -f "$sql_dir/$file" ] || { err "缺少环境4 SQL: $sql_dir/$file"; return 1; }
    done
    for db in tlbbdb_main tlbbdb_world web; do
        docker exec gsmysql mysql -uroot "-p$MYSQL_PASSWORD" -e "DROP DATABASE IF EXISTS \`$db\`; CREATE DATABASE \`$db\`;"
    done
    docker exec -i gsmysql mysql -uroot "-p$MYSQL_PASSWORD" tlbbdb_main < "$sql_dir/tlbbdb_main.sql"
    docker exec -i gsmysql mysql -uroot "-p$MYSQL_PASSWORD" tlbbdb_world < "$sql_dir/tlbbdb_world.sql"
    docker exec -i gsmysql mysql -uroot "-p$MYSQL_PASSWORD" web < "$sql_dir/web.sql"
}

init_database() {
    load_env
    wait_mysql
    if [ "$DB_MODE" = sql8 ]; then
        info "导入环境4 MySQL 8 SQL..."
        import_sql8
    else
        info "执行镜像内置数据库初始化脚本..."
        docker exec gsmysql /bin/bash /usr/local/bin/init_db.sh
    fi
    docker exec gsmysql mysql -uroot "-p$MYSQL_PASSWORD" -e 'SHOW DATABASES;'
    ok "数据库初始化完成"
}

pick_archive() {
    mapfile -t ARCHIVES < <(find /home -maxdepth 1 -type f \( -name '*.tar' -o -name '*.tar.gz' -o -name '*.tgz' -o -name '*.tar.xz' -o -name '*.zip' \) -printf '%T@ %p\n' 2>/dev/null | sort -nr | cut -d' ' -f2-)
    [ ${#ARCHIVES[@]} -gt 0 ] || { err "未在 /home 找到服务端压缩包"; return 1; }
    local i
    for i in "${!ARCHIVES[@]}"; do printf '  %2d) %s\n' "$((i+1))" "${ARCHIVES[$i]}"; done
    read -r -p "选择服务端包（0 返回）: " choice
    [[ "$choice" =~ ^[1-9][0-9]*$ ]] && [ "$choice" -le ${#ARCHIVES[@]} ] || return 1
    SELECTED_ARCHIVE="${ARCHIVES[$((choice-1))]}"
}

extract_server() {
    load_env; pick_archive || return 0
    local temp="$WORK_DIR/.extract-$$" info_file source_dir backup
    mkdir -p "$temp"
    case "$SELECTED_ARCHIVE" in
        *.zip) unzip -q "$SELECTED_ARCHIVE" -d "$temp" ;;
        *) tar -xf "$SELECTED_ARCHIVE" -C "$temp" ;;
    esac
    info_file=$(find "$temp" -type f -path '*/Server/Config/ServerInfo.ini' -print -quit)
    [ -n "$info_file" ] || { rm -rf "$temp"; err "压缩包不是可识别的服务端"; return 1; }
    source_dir=$(dirname "$(dirname "$(dirname "$info_file")")")
    if [ -d "$DATA_DIR/tlbb/Server" ]; then
        backup="$DATA_DIR/backup/tlbb_$(date +%Y%m%d_%H%M%S).tar.gz"
        tar -czf "$backup" -C "$DATA_DIR" tlbb
        ok "旧服务端已备份: $backup"
    fi
    rm -rf "$DATA_DIR/tlbb"; mkdir -p "$DATA_DIR/tlbb"
    if [ "$source_dir" = "$temp" ]; then
        shopt -s dotglob; mv "$temp"/* "$DATA_DIR/tlbb/"; shopt -u dotglob
    else
        mv "$source_dir"/* "$DATA_DIR/tlbb/"
    fi
    rm -rf "$temp"
    find "$DATA_DIR/tlbb" -maxdepth 1 -name '*.sh' -type f -exec chmod +x {} +
    ok "服务端已解压到容器路径 /home/tlbb"
}

replace_system_value() {
    local file="$1" key="$2" value="$3"
    [ -f "$file" ] || return 0
    KEY="$key" VALUE="$value" perl -i -pe '
        if (/^\s*\[System\]\s*$/i) { $in_system=1 }
        elsif (/^\s*\[/) { $in_system=0 }
        if ($in_system) { s/^(\s*\Q$ENV{KEY}\E=)[^;\r\n]*/${1}$ENV{VALUE}/ }
    ' "$file"
}

replace_redis_values() {
    local file="$1"
    [ -f "$file" ] || return 0
    REDIS_PASSWORD="$REDIS_PASSWORD" perl -i -pe '
        if (/^\s*\[Redis\]\s*$/i) { $in_redis=1 }
        elsif (/^\s*\[/) { $in_redis=0 }
        if ($in_redis) {
            s/^(\s*IP=)[^;\r\n]*/${1}gsredis/;
            s/^(\s*Password=)[^;\r\n]*/${1}$ENV{REDIS_PASSWORD}/;
        }
    ' "$file"
}

write_odbc() {
    local cfg="$DATA_DIR/odbc.ini" driver
    if [ "$PROFILE" = 4 ]; then driver='/usr/lib64/libmyodbc8w.so'; else driver='/usr/lib/libmyodbc5.so'; fi
    cat > "$cfg" <<EOF
[tlbbdb]
Driver=$driver
SERVER=gsmysql
PORT=3306
USER=root
Password=$MYSQL_PASSWORD
Database=tlbbdb

[tlbbdb_main]
Driver=$driver
SERVER=gsmysql
PORT=3306
USER=root
Password=$MYSQL_PASSWORD
Database=tlbbdb_main

[tlbbdb_world]
Driver=$driver
SERVER=gsmysql
PORT=3306
USER=root
Password=$MYSQL_PASSWORD
Database=tlbbdb_world

[web]
Driver=$driver
SERVER=gsmysql
PORT=3306
USER=root
Password=$MYSQL_PASSWORD
Database=web
EOF
    docker cp "$cfg" gsserver:/etc/odbc.ini
}

configure_server() {
    load_env
    local cfg="$DATA_DIR/tlbb/Server/Config" file
    [ -d "$cfg" ] || { err "请先解压服务端"; return 1; }
    read -r -p "外网 IP（直接回车不修改）: " public_ip
    for file in "$cfg"/*.ini; do
        [ -f "$file" ] || continue
        replace_system_value "$file" DBIP gsmysql
        replace_system_value "$file" DBPort 3306
        replace_system_value "$file" DBUser root
        replace_system_value "$file" DBPassword "$MYSQL_PASSWORD"
        replace_redis_values "$file"
    done
    if [ "$DB_MODE" = image ]; then
        for file in "$cfg"/LoginInfo.ini "$cfg"/ShareMemInfo.ini; do replace_system_value "$file" DBName tlbbdb; done
    fi
    if [ -n "$public_ip" ] && [ -f "$cfg/ServerInfo.ini" ]; then
        PUBLIC_IP="$public_ip" perl -i -pe 's/^(\s*IP0=)(?!127\.0\.0\.1)[^;\r\n]*/${1}$ENV{PUBLIC_IP}/' "$cfg/ServerInfo.ini"
    fi
    write_odbc
    ok "容器网络配置已写入服务端"
}

start_server() {
    load_env
    [ -f "$DATA_DIR/tlbb/run.sh" ] || { err "请先解压服务端"; return 1; }
    docker exec gsserver /bin/bash -lc 'pkill -f "(ShareMemory|World|Server|Login|CenterServer)" || true' || true
    docker exec -d gsserver /bin/bash /home/tlbb/run.sh
    sleep 5
    docker_status
}

stop_server() {
    load_env
    if [ -f "$DATA_DIR/tlbb/stop.sh" ]; then docker exec gsserver /bin/bash /home/tlbb/stop.sh || true; fi
    docker exec gsserver /bin/bash -lc 'pkill -f "(ShareMemory|World|Server|Login|CenterServer)" || true' || true
    ok "已发送停服指令"
}

docker_status() {
    load_env
    docker_compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" ps
    echo; info "服务端进程："
    docker exec gsserver /bin/bash -lc 'ps -eo pid,comm,args | grep -E "(CenterServer|ShareMemory|World|Server|Login)[0-9]*" | grep -v grep || true'
}

show_menu() {
    clear
    echo -e "${CYAN}${BOLD}TLBB Docker 多版本环境${NC}"
    [ -f "$ENV_FILE" ] && { . "$ENV_FILE"; echo "当前：${PROFILE_NAME}"; }
    echo "  1) 选择并安装环境 1-4（会清空当前 Docker 数据）"
    echo "  2) 从 /home 解压服务端到容器"
    echo "  3) 写入容器数据库、Redis、外网 IP 配置"
    echo "  4) 初始化或重置数据库"
    echo "  5) 启动服务端"
    echo "  6) 停止服务端"
    echo "  7) 查看容器与服务端状态"
    echo "  0) 返回"
}

main_menu() {
    while true; do
        show_menu
        read -r -p "请选择操作: " action
        case "$action" in
            1) install_profile ;;
            2) extract_server ;;
            3) configure_server ;;
            4) init_database ;;
            5) start_server ;;
            6) stop_server ;;
            7) docker_status ;;
            0) return 0 ;;
            *) warn "请输入菜单中的编号" ;;
        esac
        read -r -p "按回车键继续..." _
    done
}

require_root
case "${1:-menu}" in
    menu) main_menu ;;
    install) PROFILE="${2:-1}"; FORCE_PROFILE=1; install_profile ;;
    init) init_database ;;
    extract) extract_server ;;
    config) configure_server ;;
    start) start_server ;;
    stop) stop_server ;;
    status) docker_status ;;
    *) echo "用法: $0 {menu|install [1-4]|init|extract|config|start|stop|status}"; exit 1 ;;
esac
