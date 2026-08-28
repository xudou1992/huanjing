#!/bin/bash
# ============================================================================
#  网络拉取一键安装：从 GitHub 下载整个环境包并执行 install.sh
#
#  用法（在全新 CentOS 9 服务器上执行）:
#    # 私有仓库需先提供 GitHub Token（需要 repo 读取权限）
#    export GH_TOKEN=ghp_xxxxxxxx
#    bash <(curl -sL -H "Authorization: Bearer $GH_TOKEN" \
#        https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh)
#
#    # 仓库转公开后无需 Token:
#    bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh)
#
#    # 全自动（免交互）:
#    ... | bash -s -- -p 你的MySQL密码
#
#  可选环境变量:
#    HUANJING_REPO    默认 xudou1992/huanjing
#    HUANJING_BRANCH  默认 main
# ============================================================================
set -e

REPO="${HUANJING_REPO:-xudou1992/huanjing}"
BRANCH="${HUANJING_BRANCH:-main}"
INSTALL_DIR="/root/huanjing"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
print_info()    { echo -e "${BLUE}[信息]${NC} $1"; }
print_success() { echo -e "${GREEN}[成功]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[警告]${NC} $1"; }
print_error()   { echo -e "${RED}[错误]${NC} $1"; }

# ---------------------------- 前置检查 --------------------------------------
if [ "$(id -u)" -ne 0 ]; then
    print_error "请使用 root 用户运行"
    exit 1
fi
if ! command -v curl >/dev/null 2>&1; then
    print_info "安装 curl..."
    yum install -y curl
fi

# ---------------------------- 参数解析 --------------------------------------
# -t/--token 指定 Token；其余参数原样传给 install.sh（如 -p 密码）
GH_TOKEN="${GH_TOKEN:-${GITHUB_TOKEN:-}}"
PASSTHROUGH=()
while [ $# -gt 0 ]; do
    case "$1" in
        -t|--token)   GH_TOKEN="$2"; shift 2 ;;
        -t=*|--token=*) GH_TOKEN="${1#*=}"; shift ;;
        *)            PASSTHROUGH+=("$1"); shift ;;
    esac
done

# ---------------------------- 下载整包 --------------------------------------
TARBALL="/tmp/huanjing.tar.gz"
URL="https://api.github.com/repos/$REPO/tarball/$BRANCH"

download() {
    if [ -n "$GH_TOKEN" ]; then
        curl -fL --retry 3 -H "Authorization: Bearer $GH_TOKEN" -o "$TARBALL" "$URL"
    else
        curl -fL --retry 3 -o "$TARBALL" "$URL"
    fi
}

print_info "正在从 GitHub 拉取环境包: $REPO@$BRANCH ..."
if ! download; then
    print_warning "下载失败（私有仓库需要 Token 认证）"
    read -s -p "请输入 GitHub Token（Settings → Developer settings → Personal access tokens，需 repo 权限）: " GH_TOKEN
    echo
    if ! download; then
        print_error "下载失败：请检查 Token 是否有效、是否有 $REPO 的读取权限"
        rm -f "$TARBALL"
        exit 1
    fi
fi

if [ ! -s "$TARBALL" ]; then
    print_error "下载的文件为空，请检查网络后重试"
    rm -f "$TARBALL"; exit 1
fi

# ---------------------------- 解压并安装 ------------------------------------
print_info "解压到 $INSTALL_DIR ..."
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
tar -xzf "$TARBALL" -C "$INSTALL_DIR" --strip-components=1
rm -f "$TARBALL"

if [ ! -f "$INSTALL_DIR/install.sh" ]; then
    print_error "包内容异常：未找到 install.sh"
    exit 1
fi

cd "$INSTALL_DIR"
chmod +x install.sh
print_success "环境包就绪，开始一键安装..."
echo
if [ ${#PASSTHROUGH[@]} -gt 0 ]; then
    ./install.sh "${PASSTHROUGH[@]}"
else
    ./install.sh
fi
