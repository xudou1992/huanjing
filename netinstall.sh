#!/bin/bash
# ============================================================================
#  一键环境命令：装环境 → 部署服务端 → 写配置 → 启动（开服一条龙）
#
#  用法（在全新 CentOS 9 服务器上执行）:
#    bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh)
#
#    # 全自动免交互（Redis密码自动生成，服务端自动启动）:
#    bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh) -p 你的MySQL密码
#
#  可选参数:
#    --no-config    只装环境，不改服务端配置
#    --no-start     装/配完不启动服务端
#    -t <Token>     仓库转私有时使用
#
#  装完后的日常管理（在 /root/huanjing 执行）:
#    ./install.sh start | stop | status | restart
#
#  可选环境变量:
#    HUANJING_REPO    默认 xudou1992/huanjing
#    HUANJING_BRANCH  默认 main
# ============================================================================
set -e

REPO="${HUANJING_REPO:-xudou1992/huanjing}"
BRANCH="${HUANJING_BRANCH:-main}"
INSTALL_DIR="/root/huanjing"
SERVER_DIR="/home/tlbb64"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

info()    { echo -e "  ${BLUE}ℹ${NC} $1"; }
ok()      { echo -e "  ${GREEN}✔${NC} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${NC} $1"; }
err()     { echo -e "${RED}✖ $1${NC}"; }

echo -e "${CYAN}"
echo  "╔══════════════════════════════════════════════╗"
echo -e "║   ${BOLD}🚀 游戏服务器 · 一键环境部署${NC}${CYAN}"
echo -e "║   装环境 → 改配置 → 启动服务端"
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
NO_CONFIG=0
NO_START=0
NONINTERACTIVE=0
while [ $# -gt 0 ]; do
    case "$1" in
        -t|--token)     GH_TOKEN="$2"; shift 2 ;;
        -t=*|--token=*) GH_TOKEN="${1#*=}"; shift ;;
        --no-config)    NO_CONFIG=1; shift ;;
        --no-start)     NO_START=1; shift ;;
        -p)             PASSTHROUGH+=("-p" "$2"); NONINTERACTIVE=1; shift 2 ;;
        *)              PASSTHROUGH+=("$1"); shift ;;
    esac
done

# ---------------------------- 阶段0：下载整包 --------------------------------
TARBALL="/tmp/huanjing.tar.gz"
URL="https://api.github.com/repos/$REPO/tarball/$BRANCH"

download() {
    if [ -n "$GH_TOKEN" ]; then
        curl -fL --retry 3 -# -H "Authorization: Bearer $GH_TOKEN" -o "$TARBALL" "$URL"
    else
        curl -fL --retry 3 -# -o "$TARBALL" "$URL"
    fi
}

echo ""
info "阶段 0/3：正在从 GitHub 拉取整包 ${BOLD}$REPO@$BRANCH${NC}（含服务端约 200MB，请耐心等待）..."
if ! download; then
    warn "下载失败（私有仓库需要 Token 认证）"
    if ! read -s -p "  请输入 GitHub Token: " GH_TOKEN </dev/tty 2>/dev/null; then
        err "无法交互输入 Token，请用: netinstall.sh -t <Token> 或环境变量 GH_TOKEN"
        exit 1
    fi
    echo
    if ! download; then
        err "下载失败：请检查 Token 是否有效、是否有 $REPO 的读取权限"
        rm -f "$TARBALL"; exit 1
    fi
fi
if [ ! -s "$TARBALL" ]; then
    err "下载的文件为空，请检查网络后重试"
    rm -f "$TARBALL"; exit 1
fi
ok "下载完成: $(du -h "$TARBALL" 2>/dev/null | cut -f1)"

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
chmod +x install.sh config.sh netinstall.sh
ok "整包就绪: $INSTALL_DIR"

# ---------------------------- 阶段1：环境安装 --------------------------------
echo ""
info "阶段 1/3：安装环境（MySQL 8.0.31 + Redis + 三个数据库，约5-10分钟）..."
if ! ./install.sh "${PASSTHROUGH[@]}"; then
    warn "环境安装阶段未正常结束（可能环境已安装过），继续后续流程"
fi

# ---------------------------- 阶段2：部署服务端并写配置 ----------------------
echo ""
info "阶段 2/3：部署服务端到 $SERVER_DIR 并写入配置..."
if [ -d "$INSTALL_DIR/tlbb64/Server" ]; then
    if [ -d "$SERVER_DIR/Server" ]; then
        warn "$SERVER_DIR 已存在，跳过部署（如需更新请先备份并删除旧目录）"
    elif [ -e "$SERVER_DIR" ]; then
        warn "$SERVER_DIR 已存在但不是完整服务端，请手动处理后执行: mv $INSTALL_DIR/tlbb64 $SERVER_DIR"
    else
        mkdir -p /home
        mv "$INSTALL_DIR/tlbb64" "$SERVER_DIR"
        ok "服务端已部署: $SERVER_DIR"
    fi
fi

if [ "$NO_CONFIG" -eq 1 ]; then
    warn "按要求跳过服务端配置"
elif [ -f "$SERVER_DIR/Server/Config/ServerInfo.ini" ]; then
    CFG_ARGS=(-d "$SERVER_DIR")
    [ $NONINTERACTIVE -eq 1 ] && CFG_ARGS+=(-y)
    if ! ./config.sh "${CFG_ARGS[@]}"; then
        warn "服务端配置未完成，可稍后手动执行: cd $INSTALL_DIR && ./config.sh -d $SERVER_DIR"
    fi
else
    warn "未找到服务端（$SERVER_DIR），跳过配置；手动部署后执行: ./config.sh -d 服务端目录"
fi

# ---------------------------- 阶段3：启动服务端 ------------------------------
echo ""
if [ "$NO_START" -eq 1 ]; then
    warn "按要求跳过启动服务端"
elif [ -f "$SERVER_DIR/run.sh" ]; then
    DO_START=1
    if [ $NONINTERACTIVE -ne 1 ]; then
        ANS="Y"
        read -r -p "是否立即启动服务端？(Y/n): " ANS </dev/tty 2>/dev/null || ANS="Y"
        [ -z "$ANS" ] && ANS="Y"
        [[ "$ANS" =~ ^[Nn] ]] && DO_START=0
    fi
    if [ $DO_START -eq 1 ]; then
        info "阶段 3/3：启动服务端（ShareMemory → World → Server → Login，约需1分钟）..."
        if ! ./install.sh start; then
            warn "启动未完成，可稍后手动执行: ./install.sh start"
        fi
    else
        info "已跳过启动。以后启动: ./install.sh start"
    fi
else
    warn "未找到 run.sh，跳过启动"
fi

# ---------------------------- 完成提示 ---------------------------------------
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${BOLD}🎉 一键部署流程结束${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${NC}"
echo -e "  ${BLUE}ℹ${NC} 日常管理（全局命令 ${YELLOW}tlbb${NC}，任意目录可用）:"
echo -e "      ${YELLOW}tlbb start${NC}     启动服务端"
echo -e "      ${YELLOW}tlbb stop${NC}      关闭服务端（安全停服+日志打包）"
echo -e "      ${YELLOW}tlbb status${NC}    查看进程状态"
echo -e "      ${YELLOW}tlbb restart${NC}   重启服务端"
echo -e "      ${YELLOW}tlbb backup${NC}    备份三个数据库（保留最近5份）"
echo -e "      ${YELLOW}tlbb autostart on${NC}  开启开机自启"
echo -e "  ${BLUE}ℹ${NC} 账号密码: ${YELLOW}/root/huanjing-credentials.txt${NC}（仅 root 可读）"
echo -e "  ${GREEN}🚀 祝开服顺利！${NC}"
echo ""
