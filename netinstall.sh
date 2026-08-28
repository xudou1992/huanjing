#!/bin/bash
# ============================================================================
#  网络拉取一键安装：从 GitHub 下载整个环境包并执行 install.sh
#
#  用法（在全新 CentOS 9 服务器上执行）:
#    bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh)
#
#    # 全自动免交互:
#    bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh) -p 你的MySQL密码
#
#    # 若仓库为私有，附加 Token:
#    ... netinstall.sh -t <GitHub Token>
#
#  可选环境变量:
#    HUANJING_REPO    默认 xudou1992/huanjing
#    HUANJING_BRANCH  默认 main
# ============================================================================
set -e

REPO="${HUANJING_REPO:-xudou1992/huanjing}"
BRANCH="${HUANJING_BRANCH:-main}"
INSTALL_DIR="/root/huanjing"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

info()    { echo -e "  ${BLUE}ℹ${NC} $1"; }
ok()      { echo -e "  ${GREEN}✔${NC} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${NC} $1"; }
err()     { echo -e "${RED}✖ $1${NC}"; }

echo -e "${CYAN}"
echo  "╔══════════════════════════════════════════════╗"
echo -e "║   ${BOLD}🌐 网络拉取 · 游戏服务器环境一键部署${NC}${CYAN}"
echo -e "║   MySQL 8.0.31 · CentOS Stream 9"
echo  "╚══════════════════════════════════════════════╝"
echo -e "${NC}"

# ---------------------------- 前置检查 --------------------------------------
if [ "$(id -u)" -ne 0 ]; then
    err "请使用 root 用户运行"
    exit 1
fi
if ! command -v curl >/dev/null 2>&1; then
    info "安装 curl..."
    yum install -y curl
fi

# ---------------------------- 参数解析 --------------------------------------
# -t/--token 指定 Token；其余参数原样传给 install.sh（如 -p 密码）
GH_TOKEN="${GH_TOKEN:-${GITHUB_TOKEN:-}}"
PASSTHROUGH=()
while [ $# -gt 0 ]; do
    case "$1" in
        -t|--token)     GH_TOKEN="$2"; shift 2 ;;
        -t=*|--token=*) GH_TOKEN="${1#*=}"; shift ;;
        *)              PASSTHROUGH+=("$1"); shift ;;
    esac
done

# ---------------------------- 下载整包 --------------------------------------
TARBALL="/tmp/huanjing.tar.gz"
URL="https://api.github.com/repos/$REPO/tarball/$BRANCH"

download() {  # download —— 带 Token 则携带认证，-# 显示进度条
    if [ -n "$GH_TOKEN" ]; then
        curl -fL --retry 3 -# -H "Authorization: Bearer $GH_TOKEN" -o "$TARBALL" "$URL"
    else
        curl -fL --retry 3 -# -o "$TARBALL" "$URL"
    fi
}

info "正在从 GitHub 拉取环境包: ${BOLD}$REPO@$BRANCH${NC}"
if ! download; then
    warn "下载失败（私有仓库需要 Token 认证）"
    read -s -p "  请输入 GitHub Token（Settings → Developer settings → Personal access tokens）: " GH_TOKEN
    echo
    if ! download; then
        err "下载失败：请检查 Token 是否有效、是否有 $REPO 的读取权限"
        rm -f "$TARBALL"
        exit 1
    fi
fi

if [ ! -s "$TARBALL" ]; then
    err "下载的文件为空，请检查网络后重试"
    rm -f "$TARBALL"; exit 1
fi
ok "下载完成: $(du -h "$TARBALL" 2>/dev/null | cut -f1)"

# ---------------------------- 解压并安装 ------------------------------------
info "解压到 $INSTALL_DIR ..."
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
tar -xzf "$TARBALL" -C "$INSTALL_DIR" --strip-components=1
rm -f "$TARBALL"

if [ ! -f "$INSTALL_DIR/install.sh" ]; then
    err "包内容异常：未找到 install.sh"
    exit 1
fi

cd "$INSTALL_DIR"
chmod +x install.sh
ok "环境包就绪，开始一键安装..."
echo
if [ ${#PASSTHROUGH[@]} -gt 0 ]; then
    exec ./install.sh "${PASSTHROUGH[@]}"
else
    exec ./install.sh
fi
