#!/bin/bash
# Publish this file with huanjing-env.tar.gz on the same domestic site.
set -e

# Change this once before publishing bootstrap.sh.
SOURCE_BASE="https://YOUR_DOMAIN/huanjing"
ARCHIVE_URL="${HUANJING_SOURCE_BASE:-$SOURCE_BASE}/huanjing-env.tar.gz"
INSTALL_DIR="/root/huanjing"
ARCHIVE_FILE="/tmp/huanjing-env.tar.gz"

RED='\033[0;31m'; GREEN='\033[0;32m'; BLUE='\033[0;34m'; BOLD='\033[1m'; NC='\033[0m'
info() { echo -e "  ${BLUE}i${NC} $1"; }
ok()   { echo -e "  ${GREEN}OK${NC} $1"; }
err()  { echo -e "  ${RED}X${NC} $1"; }

if [ "$(id -u)" -ne 0 ]; then
    err "请使用 root 用户运行"
    exit 1
fi
if [[ "$ARCHIVE_URL" == *"YOUR_DOMAIN"* ]]; then
    err "请先在 bootstrap.sh 中设置 SOURCE_BASE 为你的实际域名路径"
    exit 1
fi
if ! command -v curl >/dev/null 2>&1; then
    err "缺少 curl，请先安装 curl 后重试"
    exit 1
fi

echo -e "${BOLD}TLBB 环境一键安装${NC}"
info "下载地址: $ARCHIVE_URL"
info "下载内容: 环境脚本与数据库 SQL；MySQL/Redis 将在线安装（不含服务端）"
curl --progress-bar --fail --location --retry 3 --connect-timeout 10 -o "$ARCHIVE_FILE" "$ARCHIVE_URL"

# 完整性校验（发布侧用 pack-release.sh 生成 .sha256）
SHA_URL="${ARCHIVE_URL}.sha256"
SHA_FILE="/tmp/huanjing-env.tar.gz.sha256"
if curl -fsSL --retry 2 --connect-timeout 10 -o "$SHA_FILE" "$SHA_URL" 2>/dev/null; then
    EXPECTED=$(awk '{print $1}' "$SHA_FILE" | head -1)
    ACTUAL=$(sha256sum "$ARCHIVE_FILE" | awk '{print $1}')
    if [ "$EXPECTED" != "$ACTUAL" ]; then
        rm -f "$ARCHIVE_FILE" "$SHA_FILE"
        err "压缩包 SHA256 校验失败（传输损坏或被篡改），请重试"
        exit 1
    fi
    ok "SHA256 校验通过: ${ACTUAL:0:16}..."
else
    warn "未找到 .sha256 校验文件，跳过完整性校验"
fi
rm -f "$SHA_FILE"

if ! tar -tzf "$ARCHIVE_FILE" >/dev/null 2>&1; then
    rm -f "$ARCHIVE_FILE"
    err "环境压缩包无效"
    exit 1
fi
if tar -tzf "$ARCHIVE_FILE" | grep -Eq '^(\./)?tlbb[^/]*/'; then
    rm -f "$ARCHIVE_FILE"
    err "环境压缩包包含服务端目录，已停止"
    exit 1
fi

rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
tar -xzf "$ARCHIVE_FILE" -C "$INSTALL_DIR"
rm -f "$ARCHIVE_FILE"
if [ ! -f "$INSTALL_DIR/install.sh" ] || [ ! -f "$INSTALL_DIR/menu.sh" ] || [ ! -f "$INSTALL_DIR/docker-env.sh" ]; then
    err "环境压缩包缺少 install.sh、menu.sh 或 docker-env.sh"
    exit 1
fi
chmod +x "$INSTALL_DIR"/*.sh
ok "环境包已解压: $INSTALL_DIR"
exec "$INSTALL_DIR/install.sh" "$@"
