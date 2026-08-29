#!/bin/bash
# ============================================================================
#  一键修改服务端游戏配置文件（写入数据库密码 / Redis 密码 / 外网IP）
#
#  用法:
#    ./config.sh                          # 交互式（自动读取安装时保存的密码）
#    ./config.sh -d /root/tlbb64          # 指定服务端目录
#    ./config.sh -m MySQL密码 -r Redis密码 -i 外网IP    # 全自动免交互
#    ./config.sh -b 127.0.0.1:11100                     # 指定billing地址(默认本机:11100)
#
#  修改内容（按字段名定位，兼容任意旧值；GBK/CRLF 编码原样保留）:
#    LoginInfo.ini / CenterServerInfo.ini / ShareMemInfo.ini 的 *DBPassword=
#    CenterServerInfo.ini / ServerInfo.ini [Redis] 段的 Password=
#    ServerInfo.ini [Billing] 的外网IP占位（192.168.*）
#    BillingInfo.ini 生成/更新（游戏进程的 billing 上报配置，缺失会导致
#      billing 验证服务"在线玩家"始终为空、无法统计在线人数；默认 127.0.0.1:11100）
#
#  修改前自动备份 Server/Config 目录到 tlbb64/ConfigBackup_时间.tar.gz
# ============================================================================
set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

info()    { echo -e "  ${BLUE}ℹ${NC} $1"; }
ok()      { echo -e "  ${GREEN}✔${NC} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${NC} $1"; }
err()     { echo -e "${RED}✖ $1${NC}"; }

echo -e "${CYAN}"
echo  "╔══════════════════════════════════════════════╗"
echo -e "║   ${BOLD}🔧 服务端配置 · 一键写入${NC}${CYAN}"
echo -e "║   数据库密码 / Redis密码 / 外网IP"
echo  "╚══════════════════════════════════════════════╝"
echo -e "${NC}"

# ---------------------------- 前置检查 --------------------------------------
if [ "$(id -u)" -ne 0 ]; then
    err "请使用 root 用户运行"
    exit 1
fi
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
BAD_CHARS='[$`"'"'"'\\ ]'

if ! command -v perl >/dev/null 2>&1; then
    warn "未安装 perl，正在安装（GBK 配置文件需要它按字节安全替换）..."
    yum install -y perl
fi

# ---------------------------- 参数解析 --------------------------------------
SERVER_DIR="" ; MYSQL_PASSWORD="" ; REDIS_PASSWORD="" ; NEW_IP="" ; BILLING_ADDR="" ; ASSUME_YES=0
while [ $# -gt 0 ]; do
    case "$1" in
        -d|--dir)     SERVER_DIR="$2"; shift 2 ;;
        -m|--mysql)   MYSQL_PASSWORD="$2"; shift 2 ;;
        -r|--redis)   REDIS_PASSWORD="$2"; shift 2 ;;
        -i|--ip)      NEW_IP="$2"; shift 2 ;;
        -b|--billing) BILLING_ADDR="$2"; shift 2 ;;
        -y|--yes)     ASSUME_YES=1; shift ;;
        *)            err "未知参数: $1（支持 -d 目录 -m MySQL密码 -r Redis密码 -i 外网IP -b billing地址 -y 免确认）"; exit 1 ;;
    esac
done

# ---------------------------- 定位服务端 ------------------------------------
# 通配任意服务端目录名（tlbb64 / tlbb757 / tlbb980 ...），标准位置优先
if [ -z "$SERVER_DIR" ]; then
    for d in /home/tlbb* /root/tlbb* "$SCRIPT_DIR"/tlbb* "$PWD"/tlbb*; do
        if [ -f "$d/Server/Config/ServerInfo.ini" ]; then
            SERVER_DIR="$d"; break
        fi
    done
fi
if [ ! -f "$SERVER_DIR/Server/Config/ServerInfo.ini" ]; then
    err "未找到服务端目录（需要存在 Server/Config/ServerInfo.ini）"
    info "可用 -d 指定，例如: ./config.sh -d /root/tlbb64"
    exit 1
fi
CFG="$SERVER_DIR/Server/Config"
ok "服务端目录: $SERVER_DIR"

# ---------------------------- 读取密码 --------------------------------------
CRED_FILE=/root/huanjing-credentials.txt
if [ -f "$CRED_FILE" ]; then
    [ -z "$MYSQL_PASSWORD" ] && MYSQL_PASSWORD=$(sed -n 's/^MySQL root 密码 *: //p' "$CRED_FILE" | head -1)
    [ -z "$REDIS_PASSWORD" ] && REDIS_PASSWORD=$(sed -n 's/^Redis 密码 *: //p' "$CRED_FILE" | head -1)
    [ -n "$MYSQL_PASSWORD" ] && ok "已从 $CRED_FILE 读取安装时保存的密码"
fi
if [ -z "$MYSQL_PASSWORD" ]; then
    read -s -p "请输入 MySQL root 密码（直接回车=跳过数据库密码修改）: " MYSQL_PASSWORD; echo
fi
if [ -z "$REDIS_PASSWORD" ]; then
    read -s -p "请输入 Redis 密码（直接回车=跳过 Redis 密码修改）: " REDIS_PASSWORD; echo
fi
for pw_var in MYSQL_PASSWORD REDIS_PASSWORD; do
    pw="${!pw_var}"
    if [ -n "$pw" ] && [[ "$pw" =~ $BAD_CHARS ]]; then
        err "$pw_var 包含 \$ \` \" ' 空格或反斜杠，请检查"
        exit 1
    fi
done

# ---------------------------- 外网IP ----------------------------------------
detect_ip() {
    local ip
    ip=$(curl -s --max-time 5 https://ifconfig.me 2>/dev/null) || true
    if ! [[ "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        ip=$(curl -s --max-time 5 https://api.ipify.org 2>/dev/null) || true
    fi
    if ! [[ "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        ip=$(hostname -I 2>/dev/null | awk '{print $1}')
    fi
    echo "$ip"
}
if [ -z "$NEW_IP" ]; then
    DETECTED_IP=$(detect_ip)
    if [ $ASSUME_YES -eq 1 ]; then
        NEW_IP="$DETECTED_IP"
    else
        echo ""
        info "检测到本机IP: ${YELLOW}${DETECTED_IP:-未知}${NC}"
        read -p "请输入服务端外网IP（回车=使用检测值 / 输入 s=跳过IP修改）: " INPUT_IP
        case "$INPUT_IP" in
            s|S) NEW_IP="" ;;
            "")  NEW_IP="$DETECTED_IP" ;;
            *)   NEW_IP="$INPUT_IP" ;;
        esac
    fi
fi
if [ -n "$NEW_IP" ] && ! [[ "$NEW_IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    err "IP 格式不正确: $NEW_IP"; exit 1
fi

# ---------------------------- billing地址 ------------------------------------
# 游戏进程通过 BillingInfo.ini 上报"进入游戏/心跳"给 billing 验证服务,
# 原版程序包通常不带此文件, 缺失时 billing 的在线玩家/在线人数永远为空。
BILLING_ADDR=${BILLING_ADDR:-127.0.0.1:11100}
BILLING_IP="${BILLING_ADDR%%:*}"
BILLING_PORT="${BILLING_ADDR##*:}"
if ! [[ "$BILLING_IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] || ! [[ "$BILLING_PORT" =~ ^[0-9]+$ ]]; then
    err "billing 地址格式不正确（应为 IP:端口）: $BILLING_ADDR"; exit 1
fi

# ---------------------------- 修改计划 --------------------------------------
# -a: GBK 文件含高位字节，grep 需强制按文本处理
mapfile -t DB_FILES < <(grep -la '^[A-Za-z]*DBPassword=' "$CFG"/*.ini 2>/dev/null || true)
mapfile -t REDIS_FILES < <(grep -la '^\[Redis\]' "$CFG"/*.ini 2>/dev/null || true)

echo ""
echo -e "${CYAN}${BOLD}即将进行以下修改：${NC}"
if [ -n "$MYSQL_PASSWORD" ]; then
    for f in "${DB_FILES[@]}"; do echo -e "  ${GREEN}•${NC} $(basename "$f") → *DBPassword=新MySQL密码"; done
else
    warn "未提供 MySQL 密码，跳过数据库密码修改"
fi
if [ -n "$REDIS_PASSWORD" ]; then
    for f in "${REDIS_FILES[@]}"; do echo -e "  ${GREEN}•${NC} $(basename "$f") → [Redis] Password=新Redis密码"; done
else
    warn "未提供 Redis 密码，跳过 Redis 密码修改"
fi
if [ -n "$NEW_IP" ]; then
    echo -e "  ${GREEN}•${NC} ServerInfo.ini → [Billing] 外网IP: $NEW_IP"
else
    warn "跳过外网IP修改"
fi
if [ -f "$CFG/BillingInfo.ini" ]; then
    echo -e "  ${GREEN}•${NC} BillingInfo.ini → [Billing] 更新为 $BILLING_IP:$BILLING_PORT"
else
    echo -e "  ${GREEN}•${NC} BillingInfo.ini → 新建（$BILLING_IP:$BILLING_PORT，billing在线统计必需）"
fi
if [ "$SERVER_DIR" != "/home/tlbb64" ]; then
    echo -e "  ${GREEN}•${NC} run.sh / stop.sh 等 → 内置路径 /home/tlbb64 改写为 $SERVER_DIR"
fi
echo ""

if [ $ASSUME_YES -ne 1 ]; then
    read -p "确认执行修改？(y/N): " CONFIRM
    [[ $CONFIRM =~ [Yy] ]] || { info "已取消"; exit 0; }
fi

# ---------------------------- 备份 ------------------------------------------
# 备份 Server/Config 目录 + 根目录全部启动/关闭脚本
BACKUP_FILE="$SERVER_DIR/ConfigBackup_$(date +%Y%m%d_%H%M%S).tar.gz"
SH_LIST=$(cd "$SERVER_DIR" && ls *.sh 2>/dev/null || true)
tar -czf "$BACKUP_FILE" -C "$SERVER_DIR" Server/Config $SH_LIST
ok "已备份原配置与启动脚本: $BACKUP_FILE"

# ---------------------------- 执行修改 --------------------------------------
# GBK 编码按字节安全替换：perl 不做编码转换，只改 ASCII 字段值，保留 CRLF 与注释
CHANGE_LOG="$SERVER_DIR/config_change.log"
: > "$CHANGE_LOG"

if [ -n "$MYSQL_PASSWORD" ]; then
    for f in "${DB_FILES[@]}"; do
        MYSQL_PASS="$MYSQL_PASSWORD" perl -i -pe 's/^(\s*[A-Za-z]*DBPassword=)[^;\r\n]*/${1}$ENV{MYSQL_PASS}/' "$f"
        ok "MySQL 密码已写入 $(basename "$f")"
    done
    echo "[MySQL] ${DB_FILES[*]}" >> "$CHANGE_LOG"
fi

if [ -n "$REDIS_PASSWORD" ]; then
    for f in "${REDIS_FILES[@]}"; do
        REDIS_PASS="$REDIS_PASSWORD" perl -i -pe 'if(/^\s*\[([^\]]+)\]/){$sec=$1} $sec eq "Redis" && s/^(\s*Password=)[^;\r\n]*/${1}$ENV{REDIS_PASS}/' "$f"
        ok "Redis 密码已写入 $(basename "$f")（仅 [Redis] 段）"
    done
    echo "[Redis] ${REDIS_FILES[*]}" >> "$CHANGE_LOG"
fi

if [ -n "$NEW_IP" ] && [ -f "$CFG/ServerInfo.ini" ]; then
    NEW_IP_ENV="$NEW_IP" perl -i -pe 's/^(\s*IP0=)192\.168\.[0-9.]+/${1}$ENV{NEW_IP_ENV}/' "$CFG/ServerInfo.ini"
    ok "外网IP已写入 ServerInfo.ini: $NEW_IP"
    echo "[IP] ServerInfo.ini IP0=$NEW_IP" >> "$CHANGE_LOG"
fi

# BillingInfo.ini：游戏进程的 billing 上报配置（原版程序包缺失，缺失=在线统计失效）
if [ -f "$CFG/BillingInfo.ini" ]; then
    BILLING_IP_ENV="$BILLING_IP" BILLING_PORT_ENV="$BILLING_PORT" perl -i -pe '
        s/^(\s*IP0=)[^;\r\n]*/${1}$ENV{BILLING_IP_ENV}/;
        s/^(\s*Port0=)[^;\r\n]*/${1}$ENV{BILLING_PORT_ENV}/;
    ' "$CFG/BillingInfo.ini"
    ok "BillingInfo.ini 已更新: $BILLING_IP:$BILLING_PORT"
    echo "[Billing] BillingInfo.ini IP0=$BILLING_IP Port0=$BILLING_PORT" >> "$CHANGE_LOG"
else
    printf '[Billing]\r\nNumber=1\r\nIP0=%s\r\nPort0=%s\r\n' "$BILLING_IP" "$BILLING_PORT" > "$CFG/BillingInfo.ini"
    ok "BillingInfo.ini 已新建: $BILLING_IP:$BILLING_PORT"
    echo "[Billing] BillingInfo.ini created IP0=$BILLING_IP Port0=$BILLING_PORT" >> "$CHANGE_LOG"
fi

# 启动/关闭脚本内置路径适配。旧包常写 /home/tlbb，新版常写 /home/tlbb64。
if [ "$SERVER_DIR" != "/home/tlbb" ] && [ "$SERVER_DIR" != "/home/tlbb64" ]; then
    for f in "$SERVER_DIR"/*.sh; do
        [ -f "$f" ] || continue
        SRV_DIR="$SERVER_DIR" perl -i -pe 's{/home/tlbb(?:64)?(?=/|\s|$)}{$ENV{SRV_DIR}}g' "$f"
    done
    ok "启动/关闭脚本内置路径已适配: $SERVER_DIR"
    echo "[Path] *.sh -> $SERVER_DIR" >> "$CHANGE_LOG"
fi

# ---------------------------- 验证结果 --------------------------------------
echo ""
echo -e "${CYAN}${BOLD}修改后关键配置：${NC}"
for f in "${DB_FILES[@]}"; do
    grep -a '^[A-Za-z]*DBPassword=' "$f" | sed "s|^|  $(basename "$f")  |" | sed -E 's/(=.*)/=<已更新>/'
done
for f in "${REDIS_FILES[@]}"; do
    perl -ne 'if(/^\s*\[([^\]]+)\]/){$sec=$1} print "$ARGV  [Redis] Password=<已更新>\n" if $sec eq "Redis" && /^\s*Password=/' "$f" 2>/dev/null || true
done
if [ -n "$NEW_IP" ]; then
    grep -a '^IP0=' "$CFG/ServerInfo.ini" | head -1 | sed 's/^/  ServerInfo.ini  /'
fi
if [ -f "$CFG/BillingInfo.ini" ]; then
    echo "  BillingInfo.ini  $(tr -d '\r' < "$CFG/BillingInfo.ini" | grep -a -E '^(IP0|Port0)=' | tr '\n' ' ')"
fi

# 注册全局 tlbb 命令（指向同目录的 install.sh 管理器）
if [ -f "$SCRIPT_DIR/install.sh" ]; then
    cat > /usr/local/bin/tlbb <<EOF
#!/bin/bash
exec $SCRIPT_DIR/install.sh "\$@"
EOF
    chmod +x /usr/local/bin/tlbb
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
ok "服务端配置修改完成！"
info "原配置备份: $BACKUP_FILE"
info "如需回滚: cd $SERVER_DIR && tar -xzf $(basename "$BACKUP_FILE")"
info "重启服务端使配置生效: ${YELLOW}tlbb restart${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
