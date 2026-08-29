#!/bin/bash
# Interactive management menu for the environment and a manually uploaded server archive.
set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

info() { echo -e "  ${BLUE}i${NC} $1"; }
ok()   { echo -e "  ${GREEN}OK${NC} $1"; }
warn() { echo -e "  ${YELLOW}!${NC} $1"; }
err()  { echo -e "  ${RED}X${NC} $1"; }

if [ "$(id -u)" -ne 0 ]; then
    err "请使用 root 用户运行"
    exit 1
fi

pause() {
    read -r -p "按回车键返回菜单..." _
}

list_archives() {
    find /home -maxdepth 1 -type f \( -name '*.tar' -o -name '*.tar.gz' -o -name '*.tgz' -o -name '*.tar.xz' \) -printf '%T@ %p\n' 2>/dev/null |
        sort -nr | cut -d' ' -f2-
}

pick_archive() {
    mapfile -t ARCHIVES < <(list_archives)
    if [ ${#ARCHIVES[@]} -eq 0 ]; then
        warn "未在 /home 找到 .tar / .tar.gz / .tgz / .tar.xz 服务端压缩包"
        return 1
    fi

    echo ""
    info "已发现的服务端压缩包："
    local i
    for i in "${!ARCHIVES[@]}"; do
        printf '  %2d) %s (%s)\n' "$((i + 1))" "${ARCHIVES[$i]}" "$(du -h "${ARCHIVES[$i]}" | cut -f1)"
    done
    read -r -p "请选择要解压的编号（0 返回）: " choice
    if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -eq 0 ] || [ "$choice" -gt ${#ARCHIVES[@]} ]; then
        warn "未选择有效压缩包"
        return 1
    fi
    SELECTED_ARCHIVE="${ARCHIVES[$((choice - 1))]}"
}

extract_server() {
    pick_archive || return 0
    local archive="$SELECTED_ARCHIVE" temp_dir info_file source_dir default_name target_name target_dir
    temp_dir="/home/.huanjing-extract-$$"
    mkdir -p "$temp_dir"

    info "正在解压: $archive"
    if ! tar -xf "$archive" -C "$temp_dir"; then
        rm -rf "$temp_dir"
        err "压缩包解压失败"
        return 1
    fi

    info_file=$(find "$temp_dir" -type f -path '*/Server/Config/ServerInfo.ini' -print -quit)
    if [ -z "$info_file" ]; then
        rm -rf "$temp_dir"
        err "压缩包中未找到 Server/Config/ServerInfo.ini，不是可识别的服务端包"
        return 1
    fi
    source_dir=$(dirname "$(dirname "$(dirname "$info_file")")")
    default_name=$(basename "$source_dir")
    [[ "$default_name" == tlbb* ]] || default_name="tlbb64"

    read -r -p "部署目录名（默认 /home/$default_name）: " target_name
    target_name="${target_name:-$default_name}"
    if ! [[ "$target_name" =~ ^tlbb[A-Za-z0-9._-]*$ ]]; then
        rm -rf "$temp_dir"
        err "目录名必须以 tlbb 开头，且只能包含字母、数字、点、下划线和连字符"
        return 1
    fi
    target_dir="/home/$target_name"
    if [ -e "$target_dir" ]; then
        read -r -p "$target_dir 已存在。备份当前服务端并替换？(Y/n): " replace
        if [[ "$replace" =~ ^[Nn] ]]; then
            rm -rf "$temp_dir"
            warn "已取消解压"
            return 0
        fi
        backup_existing_server "$target_dir" "$target_name"
        rm -rf "$target_dir"
    fi

    if [ "$source_dir" = "$temp_dir" ]; then
        mkdir -p "$target_dir"
        shopt -s dotglob
        mv "$temp_dir"/* "$target_dir"/
        shopt -u dotglob
        rmdir "$temp_dir"
    else
        mv "$source_dir" "$target_dir"
        rm -rf "$temp_dir"
    fi
    find "$target_dir" -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} +
    ok "服务端已解压: $target_dir"

    read -r -p "现在写入数据库、Redis 和外网 IP 配置？(Y/n): " configure
    if [[ ! "$configure" =~ ^[Nn] ]]; then
        if ! "$SCRIPT_DIR/config.sh" -d "$target_dir"; then
            err "服务端配置失败，可在菜单中选择 3 重试"
            return 1
        fi
    fi
}

find_server_dir() {
    local d
    for d in /home/tlbb* /root/tlbb*; do
        if [ -f "$d/Server/Config/ServerInfo.ini" ]; then
            echo "$d"
            return 0
        fi
    done
    return 1
}

backup_existing_server() {
    local server_dir="$1" server_name="$2" backup_dir backup_file
    backup_dir="/home/tlbb_backup"
    backup_file="$backup_dir/${server_name}_$(date +%Y%m%d_%H%M%S).tar.gz"
    mkdir -p "$backup_dir"
    info "正在停止并备份当前服务端..."
    "$SCRIPT_DIR/install.sh" stop >/dev/null 2>&1 || true
    tar -czf "$backup_file" -C "$(dirname "$server_dir")" "$(basename "$server_dir")"
    ok "服务端备份完成: $backup_file"
}

backup_all() {
    local server_dir
    if server_dir=$(find_server_dir); then
        backup_existing_server "$server_dir" "$(basename "$server_dir")"
    else
        warn "未找到服务端，跳过版本备份"
    fi
    "$SCRIPT_DIR/install.sh" backup
}

if [ "${1:-}" = "--extract" ]; then
    extract_server
    exit $?
fi

show_menu() {
    clear
    echo -e "${CYAN}"
    echo "=============================================="
    echo -e "  ${BOLD}TLBB 环境与服务端管理${NC}${CYAN}"
    echo "=============================================="
    echo -e "${NC}"
    echo "  1) 安装或重装 MySQL / Redis / ODBC 环境"
    echo "  2) 从 /home 选择服务端 tar 包并解压"
    echo "  3) 配置已解压的服务端"
    echo "  4) 启动服务端"
    echo "  5) 停止服务端"
    echo "  6) 查看服务端状态"
    echo "  7) 备份数据库"
    echo "  8) 备份服务端和数据库"
    echo "  9) Docker 多版本环境（环境1-4）"
    echo "  0) 退出"
    echo ""
}

while true; do
    show_menu
    read -r -p "请选择操作: " action
    case "$action" in
        1) "$SCRIPT_DIR/install.sh" || true; pause ;;
        2) extract_server || true; pause ;;
        3) "$SCRIPT_DIR/config.sh" || true; pause ;;
        4) "$SCRIPT_DIR/install.sh" start || true; pause ;;
        5) "$SCRIPT_DIR/install.sh" stop || true; pause ;;
        6) "$SCRIPT_DIR/install.sh" status || true; pause ;;
        7) "$SCRIPT_DIR/install.sh" backup || true; pause ;;
        8) backup_all || true; pause ;;
        9) "$SCRIPT_DIR/docker-env.sh" menu || true; ;;
        0) exit 0 ;;
        *) warn "请输入菜单中的编号"; pause ;;
    esac
done
