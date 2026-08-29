#!/bin/bash
# ============================================================================
#  一键环境命令：下载环境包 → 安装 MySQL / Redis / ODBC
#
#  用法（在全新 CentOS 9 服务器上执行）:
#    bash <(curl --progress-bar -fL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh)
#
#    # 全自动免交互（Redis 密码自动生成）:
#    bash <(curl --progress-bar -fL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh) -p 你的MySQL密码
#
#  可选参数:
#    -t <Token>     仓库转私有时使用
#
#  装完后的日常管理（在 /root/huanjing 执行）:
#    ./install.sh start | stop | status | restart
#
#  可选环境变量:
#    HUANJING_REPO    默认 xudou1992/huanjing
#    HUANJING_BRANCH  默认 main
#    HUANJING_REPO_URL 完整 Git 镜像地址，默认 GitHub；国内可设为 Gitee 或自建 Git 地址
# ============================================================================
set -e

REPO="${HUANJING_REPO:-xudou1992/huanjing}"
BRANCH="${HUANJING_BRANCH:-main}"
REPO_URL="${HUANJING_REPO_URL:-https://github.com/$REPO.git}"
INSTALL_DIR="/root/huanjing"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

info()    { echo -e "  ${BLUE}ℹ${NC} $1"; }
ok()      { echo -e "  ${GREEN}✔${NC} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${NC} $1"; }
err()     { echo -e "${RED}✖ $1${NC}"; }

echo -e "${CYAN}"
echo  "╔══════════════════════════════════════════════╗"
echo -e "║   ${BOLD}🚀 游戏服务器 · 一键环境部署${NC}${CYAN}"
echo -e "║   仅下载环境包 · 服务端由用户自行上传"
echo -e "║   支持 CentOS 7/8/9 · AlmaLinux · Rocky · 腾讯OS · 阿里云Linux"
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
GH_TOKEN="${GH_TOKEN:-${GITHUB_TOKEN:-}}"
PASSTHROUGH=()
while [ $# -gt 0 ]; do
    case "$1" in
        -t|--token)     GH_TOKEN="$2"; shift 2 ;;
        -t=*|--token=*) GH_TOKEN="${1#*=}"; shift ;;
        -p)             PASSTHROUGH+=("-p" "$2"); shift 2 ;;
        *)              PASSTHROUGH+=("$1"); shift ;;
    esac
done

# ---------------------------- 阶段0：稀疏下载环境包 --------------------------
echo ""
info "阶段 0/1：准备下载环境包"
info "下载地址: ${YELLOW}$REPO_URL${NC}"
info "分支: ${YELLOW}$BRANCH${NC}"
info "下载内容: install.sh / config.sh / menu.sh / mysql-packages/"
info "已排除: tlbb*/ 服务端目录（不会下载）"
if ! command -v git >/dev/null 2>&1; then
    info "未检测到 git，正在安装..."
    yum install -y git
fi

rm -rf "$INSTALL_DIR"
info "正在连接 GitHub 并下载环境文件..."
if [ -n "$GH_TOKEN" ]; then
    git -c http.extraHeader="Authorization: Bearer $GH_TOKEN" clone --depth 1 --filter=blob:none --sparse --branch "$BRANCH" --progress "$REPO_URL" "$INSTALL_DIR"
else
    git clone --depth 1 --filter=blob:none --sparse --branch "$BRANCH" --progress "$REPO_URL" "$INSTALL_DIR"
fi
cd "$INSTALL_DIR"
if ! git sparse-checkout set --no-cone /install.sh /config.sh /menu.sh /netinstall.sh /README.md /mysql-packages/; then
    err "当前 Git 版本不支持稀疏检出，已停止，避免下载服务端目录"
    exit 1
fi
if [ ! -f "$INSTALL_DIR/install.sh" ]; then
    err "下载内容异常：未找到 install.sh"
    exit 1
fi
chmod +x install.sh config.sh menu.sh netinstall.sh
ok "环境包就绪: $INSTALL_DIR（$(du -sh "$INSTALL_DIR" 2>/dev/null | cut -f1)）"

# ---------------------------- 阶段1：环境安装 --------------------------------
echo ""
info "阶段 1/1：安装环境（MySQL 8.0.31 + Redis + 三个数据库，约5-10分钟）..."
if ! ./install.sh "${PASSTHROUGH[@]}"; then
    err "环境安装失败，停止后续部署；请查看 /var/log/huanjing-install.log 并修复后重试"
    exit 1
fi

# ---------------------------- 完成提示 ---------------------------------------
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${BOLD}🎉 环境安装完成${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${NC}"
echo -e "  ${BLUE}ℹ${NC} 服务端未下载。将服务端 tar 包上传到 /home/ 后执行:"
echo -e "      ${YELLOW}sh $INSTALL_DIR/menu.sh${NC}"
echo -e "  ${BLUE}ℹ${NC} 在菜单中选择 2 解压服务端，随后可配置、启动和管理。"
echo -e "  ${BLUE}ℹ${NC} 账号密码: ${YELLOW}/root/huanjing-credentials.txt${NC}（仅 root 可读）"
echo ""
