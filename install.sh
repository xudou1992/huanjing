#!/bin/bash
# ============================================================================
#  游戏服务器环境一键安装脚本（MySQL 8.0.31 @ CentOS Stream 9）
#
#  用法:
#    ./install.sh                # 一键安装（交互式输入 MySQL root 密码）
#    ./install.sh -p <密码>      # 全自动安装（免交互）
#    ./install.sh uninstall      # 一键卸载
#
#  说明:
#    - 自动在脚本所在目录 / 当前目录 / /home / /root 下查找 mysql-packages/
#      文件夹或 mysql-packages.tar.gz 压缩包
#    - 安装内容: MySQL 8.0.31 + ODBC 驱动 + 三个数据库 + SSL 证书 + ODBC 数据源
#    - 详细日志: /var/log/huanjing-install.log
# ============================================================================
set -e

# ---------------------------- 全局定义 --------------------------------------
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

LOG_FILE=/var/log/huanjing-install.log
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
STEPS_TOTAL=13
STEP_NO=0
CURRENT_STEP="初始化"
NONINTERACTIVE=0
T_START=$SECONDS

# ---------------------------- 输出助手 --------------------------------------
info()    { echo -e "  ${BLUE}ℹ${NC} $1"; }
ok()      { echo -e "  ${GREEN}✔${NC} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${NC} $1"; }
err()     { echo -e "${RED}✖ $1${NC}"; }

make_bar() {  # make_bar <已填充格数> <总格数>
    local filled=$1 len=$2 out="" i
    for ((i = 0; i < filled; i++)); do out+="█"; done
    for ((i = filled; i < len; i++)); do out+="░"; done
    printf '%s' "$out"
}

step_begin() {  # step_begin <步骤标题>
    local title="$1"
    CURRENT_STEP="$title"
    STEP_NO=$((STEP_NO + 1))
    local pct=$((STEP_NO * 100 / STEPS_TOTAL))
    local bar
    bar=$(make_bar $((STEP_NO * 30 / STEPS_TOTAL)) 30)
    echo ""
    echo -e "${CYAN}${BOLD}▸ [$STEP_NO/$STEPS_TOTAL] $title${NC}  ${BLUE}$bar $pct%${NC}"
}

fail() {  # fail <描述> —— 打印阶段与日志尾部后退出
    echo
    err "$1（阶段: $CURRENT_STEP）"
    echo -e "  ${BLUE}ℹ${NC} 日志末尾 20 行:"
    tail -20 "$LOG_FILE" 2>/dev/null | sed 's/^/      /' || true
    echo -e "  ${BLUE}ℹ${NC} 完整日志: $LOG_FILE"
    exit 1
}
trap 'rc=$?; fail "命令执行出错（退出码 $rc）"' ERR

run()      {  # run <描述> <命令...> —— 静默执行，失败即退出
    local desc="$1"; shift
    if ! "$@" >>"$LOG_FILE" 2>&1; then fail "$desc"; fi
    ok "$desc"
}
run_sh()   {  # run_sh <描述> <shell 片段>
    local desc="$1" script="$2"
    if ! bash -c "$script" >>"$LOG_FILE" 2>&1; then fail "$desc"; fi
    ok "$desc"
}
run_opt()  {  # run_opt <描述> <命令...> —— 尽力执行，失败不中断
    local desc="$1"; shift
    info "$desc ..."
    "$@" >>"$LOG_FILE" 2>&1 || true
}

# ---------------------------- 前置检查 --------------------------------------
if [ "$(id -u)" -ne 0 ]; then
    err "请使用 root 用户运行: sudo ./install.sh"
    exit 1
fi

# ---------------------------- 服务端管理子命令 --------------------------------
find_server_dir() {
    # 通配任意服务端目录名（tlbb64 / tlbb757 / tlbb980 / tlbb通杀 ...），标准位置优先
    for d in /home/tlbb* /root/tlbb* "$SCRIPT_DIR"/tlbb*; do
        if [ -f "$d/Server/Config/ServerInfo.ini" ]; then
            echo "$d"; return 0
        fi
    done
    return 1
}

list_server_components() {
    # 服务端二进制的后缀随版本变化（例如 *64、*1），不能写死为某一个版本。
    local sd="$1" family
    for family in CenterServer ShareMemory World Server Login; do
        find "$sd/Server" -maxdepth 1 -type f -perm -111 -printf '%f\n' 2>/dev/null |
            grep -E "^${family}([0-9]+|64)?$" | sort | head -1 || true
    done
}

do_start() {
    local sd
    sd=$(find_server_dir) || { err "未找到服务端目录（tlbb64，需含 Server/Config/ServerInfo.ini）"; exit 1; }
    echo -e "${CYAN}${BOLD}▶ 启动服务端: $sd${NC}"
    info "顺序启动 ShareMemory → World → Server → Login（约需1分钟，请勿中断）..."
    sh "$sd/run.sh"
    echo ""
    ok "启动脚本执行完毕，查看进程状态: ./install.sh status"
}

do_stop() {
    local sd
    sd=$(find_server_dir) || { err "未找到服务端目录"; exit 1; }
    echo -e "${CYAN}${BOLD}■ 关闭服务端: $sd${NC}"
    info "安全停服中（等待各进程退出，可能需要几十秒）..."
    sh "$sd/stop.sh"
    echo ""
    ok "服务端已全部关闭"
}

do_status() {
    local sd all=1 comp pid components
    sd=$(find_server_dir) || { err "未找到服务端目录"; exit 1; }
    components=$(list_server_components "$sd")
    if [ -z "$components" ]; then
        err "未在 $sd/Server 找到可执行的 CenterServer / ShareMemory / World / Server / Login 组件"
        exit 1
    fi
    echo -e "${CYAN}${BOLD}服务端进程状态（$sd）${NC}"
    while IFS= read -r comp; do
        [ -n "$comp" ] || continue
        pid=$(pgrep -f "(^|/)$comp([[:space:]]|$)" | head -1 || true)
        if [ -n "$pid" ]; then
            echo -e "  ${GREEN}✔${NC} $comp   ${GREEN}运行中${NC} (PID $pid)"
        else
            echo -e "  ${RED}✖${NC} $comp   ${RED}未运行${NC}"
            all=0
        fi
    done <<EOF
$components
EOF
    if [ $all -eq 1 ]; then
        ok "全部组件运行正常"
    else
        warn "部分组件未运行，可执行 ./install.sh start 启动"
    fi
}

do_backup() {
    if [ ! -f /root/.my.cnf ]; then
        err "未找到 /root/.my.cnf，请先完成环境安装"
        exit 1
    fi
    local backup_dir=/root/tlbb_backup
    mkdir -p "$backup_dir"
    # 动态枚举游戏库（tlbbdb_main / tlbbdb_10 / tlbbdb_world ... 均覆盖）+ web
    local db_list
    db_list=$(mysql --defaults-file=/root/.my.cnf -N -e "SHOW DATABASES;" 2>>"$LOG_FILE" |
        grep -E '^(tlbbdb_[A-Za-z0-9_]*|web)$' | tr '\n' ' ')
    if [ -z "$db_list" ]; then
        err "未发现任何游戏数据库（tlbbdb_* / web）"
        exit 1
    fi
    local f="$backup_dir/tlbbdb_$(date +%Y%m%d_%H%M%S).sql.gz"
    info "正在导出: $db_list（含存储过程/触发器/事件，大库可能需要几分钟）..."
    mysqldump --defaults-file=/root/.my.cnf --single-transaction \
        --routines --triggers --events \
        --databases $db_list 2>>"$LOG_FILE" | gzip > "$f"
    ok "备份完成: $f ($(du -h "$f" | cut -f1))"
    info "恢复方法: gunzip < $(basename "$f") | mysql --defaults-file=/root/.my.cnf"
    ls -1t "$backup_dir"/tlbbdb_*.sql.gz 2>/dev/null | tail -n +6 | xargs -r rm -f
    info "自动保留最近 5 份备份（目录: $backup_dir）"
}

do_autostart() {
    local mode="$1" sd
    sd=$(find_server_dir) || { err "未找到服务端目录"; exit 1; }
    case "$mode" in
        on)
            cat > /etc/systemd/system/tlbb.service <<EOF
[Unit]
Description=TLBB Game Server
After=network-online.target mysqld.service mariadb.service redis.service redis-server.service
Wants=mysqld.service mariadb.service redis.service redis-server.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=$sd
ExecStart=/bin/sh $sd/run.sh
ExecStop=/bin/sh $sd/stop.sh
TimeoutStartSec=300
TimeoutStopSec=180

[Install]
WantedBy=multi-user.target
EOF
            systemctl daemon-reload
            systemctl enable tlbb.service >/dev/null 2>&1
            ok "开机自启已开启（服务器重启后自动拉起服务端）"
            info "也可用 systemctl start/stop tlbb 管理"
            ;;
        off)
            systemctl disable tlbb.service >/dev/null 2>&1 || true
            rm -f /etc/systemd/system/tlbb.service
            systemctl daemon-reload
            ok "开机自启已关闭"
            ;;
        *)
            if [ -f /etc/systemd/system/tlbb.service ]; then
                ok "开机自启: 已开启（tlbb.service）"
            else
                info "开机自启: 未开启（开启命令: tlbb autostart on）"
            fi
            ;;
    esac
}

# ---------------------------- 远程数据库开关 ----------------------------------
do_remote_db() {
    local mode="${1:-}" pw
    [ -f /root/.my.cnf ] || { err "未找到 /root/.my.cnf，请先完成环境安装"; exit 1; }
    pw=$(sed -n 's/^password[[:space:]]*=[[:space:]]*//p' /root/.my.cnf | head -1)
    local mycnf=/etc/my.cnf
    case "$mode" in
        on)
            if grep -q '^bind-address' "$mycnf"; then
                sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' "$mycnf"
            else
                printf '\n[mysqld]\nbind-address = 0.0.0.0\n' >> "$mycnf"
            fi
            systemctl restart mysqld 2>/dev/null || systemctl restart mariadb 2>/dev/null || true
            mysql --defaults-file=/root/.my.cnf >>"$LOG_FILE" 2>&1 <<EOF || { err "数据库用户配置失败，详见 $LOG_FILE"; exit 1; }
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED WITH mysql_native_password BY '$pw';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
            ok "数据库远程访问已开启（0.0.0.0:3306，root@%）"
            warn "3306 已对公网开放：请确认云安全组仅对授权 IP 放行 3306"
            ;;
        off)
            if grep -q '^bind-address' "$mycnf"; then
                sed -i 's/^bind-address.*/bind-address = 127.0.0.1/' "$mycnf"
            fi
            mysql --defaults-file=/root/.my.cnf >>"$LOG_FILE" 2>&1 -e "DROP USER IF EXISTS 'root'@'%'; FLUSH PRIVILEGES;" || true
            systemctl restart mysqld 2>/dev/null || systemctl restart mariadb 2>/dev/null || true
            ok "数据库远程访问已关闭（仅 127.0.0.1，root@% 已移除）"
            ;;
        *)
            local bind hasroot
            bind=$(grep -oE '^bind-address[[:space:]]*=.*' "$mycnf" 2>/dev/null | head -1 | awk '{print $NF}')
            bind="${bind:-127.0.0.1(默认)}"
            hasroot=$(mysql --defaults-file=/root/.my.cnf -N -e "SELECT COUNT(*) FROM mysql.user WHERE user='root' AND host='%';" 2>/dev/null)
            if [ "${hasroot:-0}" -gt 0 ]; then
                info "远程访问: ${YELLOW}已开启${NC}（bind=$bind，存在 root@%）"
            else
                info "远程访问: ${GREEN}已关闭${NC}（bind=$bind，无 root@%）"
            fi
            info "开启: tlbb remote-db on / 关闭: tlbb remote-db off"
            ;;
    esac
}

# ---------------------------- 环境体检 doctor --------------------------------
doctor_fix_definers() {
    local db bad
    while read -r db; do
        [ -n "$db" ] || continue
        bad=$(mysql --defaults-file=/root/.my.cnf -N -e \
            "SELECT COUNT(*) FROM information_schema.routines WHERE routine_schema='$db' AND definer NOT IN (SELECT CONCAT(user,'@',host) FROM mysql.user);" 2>/dev/null)
        [ "${bad:-0}" -eq 0 ] && continue
        local tmp="/tmp/huanjing-definer-$db.sql"
        mysqldump --defaults-file=/root/.my.cnf --routines --no-data --no-create-info \
            --skip-triggers "$db" 2>>"$LOG_FILE" |
            sed 's/DEFINER=`[^`]*`@`[^`]*`/DEFINER=`root`@`localhost`/g' > "$tmp"
        mysql --defaults-file=/root/.my.cnf "$db" < "$tmp" 2>>"$LOG_FILE" || { err "重建 $db 存储过程失败"; return 1; }
        rm -f "$tmp"
        ok "$db 的存储过程 DEFINER 已重建为 root@localhost（$bad 个引用了不存在的用户）"
    done < <(mysql --defaults-file=/root/.my.cnf -N -e \
        "SELECT DISTINCT routine_schema FROM information_schema.routines WHERE routine_schema LIKE 'tlbbdb%';" 2>/dev/null)
}

doctor_check_odbc() {
    local fix="$1" dsn user pass
    [ -f /etc/odbc.ini ] || { err "未找到 /etc/odbc.ini"; return 1; }
    while IFS= read -r dsn; do
        dsn=${dsn#\[}; dsn=${dsn%\]}
        case "$dsn" in ""|" "*|ODBC*) continue ;; esac
        user=$(awk -v sec="[$dsn]" '$0==sec{f=1;next} /^\[/{f=0} f && tolower($1)=="user"{print $3; exit}' /etc/odbc.ini)
        pass=$(awk -v sec="[$dsn]" '$0==sec{f=1;next} /^\[/{f=0} f && tolower($1)=="password"{sub(/^[^=]*=[[:space:]]*/,""); print; exit}' /etc/odbc.ini)
        # DSN 未内嵌账号时回退到 /root/.my.cnf 的 root 凭据
        [ -n "$user" ] || user=root
        if [ -z "$pass" ] && [ -f /root/.my.cnf ]; then
            pass=$(sed -n 's/^password[[:space:]]*=[[:space:]]*//p' /root/.my.cnf | head -1)
        fi
        if ! printf 'select 1\n' | isql -v "$dsn" "$user" "$pass" >/dev/null 2>&1; then
            err "ODBC 数据源 $dsn 无法连接（isql 失败）"
            continue
        fi
        ok "ODBC 数据源 $dsn 连接正常"
    done < <(grep -E '^\[' /etc/odbc.ini | tr -d '[]')
    # 字符集一致性：连接字符集 vs 角色表字符集（latin1 表 + utf8 连接 = GBK 角色名写入失败）
    tbl_coll=$(mysql --defaults-file=/root/.my.cnf -N -e \
        "SELECT TABLE_COLLATION FROM information_schema.TABLES WHERE TABLE_SCHEMA='tlbbdb_main' AND TABLE_NAME='t_char';" 2>/dev/null)
    case "$tbl_coll" in
        latin1*)
            local _user _pass
            _user=$(awk '/^\[tlbbdb_main\]/{f=1;next} /^\[/{f=0} f && tolower($1)=="user"{print $3; exit}' /etc/odbc.ini)
            _pass=$(awk '/^\[tlbbdb_main\]/{f=1;next} /^\[/{f=0} f && tolower($1)=="password"{sub(/^[^=]*=[[:space:]]*/,""); print}' /etc/odbc.ini)
            [ -n "$_user" ] || _user=root
            [ -n "$_pass" ] || _pass=$(sed -n 's/^password[[:space:]]*=[[:space:]]*//p' /root/.my.cnf | head -1)
            conn_charset=$(printf "select @@character_set_client;\n" | isql -v tlbbdb_main "$_user" "$_pass" 2>/dev/null |
                grep 'character_set_client' | tail -1 | awk -F'|' '{gsub(/[[:space:]]/,"",$3); print $3}')
            if [ -n "$conn_charset" ] && [ "$conn_charset" != "latin1" ]; then
                warn "连接字符集为 $conn_charset，而 t_char 是 latin1 —— GBK 角色名将写入失败（症状: 建角色内部错误559）"
                if [ "$1" = "--fix" ] && ! grep -qi '^Charset' /etc/odbc.ini; then
                    sed -i 's/^\[tlbbdb_main\]/[tlbbdb_main]\nCharset=latin1/; s/^\[tlbbdb_10\]/[tlbbdb_10]\nCharset=latin1/; s/^\[tlbbdb_world\]/[tlbbdb_world]\nCharset=latin1/' /etc/odbc.ini
                    ok "已在 /etc/odbc.ini 各数据源补写 Charset=latin1（对新建连接生效）"
                else
                    info "修复方法: 在 /etc/odbc.ini 各数据源加 Charset=latin1 后重启服务端，或执行 tlbb doctor --fix"
                fi
            else
                ok "ODBC 字符集与表字符集一致（latin1）"
            fi
            ;;
    esac
}

do_doctor() {
    local fix="${1:-}"
    echo -e "${CYAN}${BOLD}▶ 环境体检${NC}"
    [ "$(id -u)" -eq 0 ] || { err "请使用 root 用户运行"; exit 1; }

    # 1. 数据库连通
    if [ ! -f /root/.my.cnf ]; then
        err "未找到 /root/.my.cnf（环境未安装或被清理）"
    elif mysql --defaults-file=/root/.my.cnf -e 'SELECT 1;' >/dev/null 2>&1; then
        ok "MySQL 本地连接正常"
    else
        err "MySQL 无法连接（/root/.my.cnf 凭据失效？）"
    fi

    # 2. 存储过程 DEFINER
    local bad
    bad=$(mysql --defaults-file=/root/.my.cnf -N -e \
        "SELECT COUNT(*) FROM information_schema.routines r WHERE r.routine_schema LIKE 'tlbbdb%' AND NOT EXISTS (SELECT 1 FROM mysql.user u WHERE CONCAT(u.user,'@',u.host)=r.definer);" 2>/dev/null)
    if [ "${bad:-0}" -gt 0 ]; then
        err "$bad 个存储过程/函数的 DEFINER 用户不存在 —— 症状: 建角色/存档报内部错误"
        mysql --defaults-file=/root/.my.cnf -e \
            "SELECT routine_schema,routine_type,routine_name,definer FROM information_schema.routines r WHERE r.routine_schema LIKE 'tlbbdb%' AND NOT EXISTS (SELECT 1 FROM mysql.user u WHERE CONCAT(u.user,'@',u.host)=r.definer) LIMIT 10;" 2>/dev/null
        if [ "$fix" = "--fix" ]; then doctor_fix_definers; else info "自动修复: tlbb doctor --fix"; fi
    else
        ok "存储过程 DEFINER 全部有效"
    fi

    # 3. 关键表存在性
    local db miss
    while read -r db; do
        [ -n "$db" ] || continue
        miss=$(mysql --defaults-file=/root/.my.cnf -N -e \
            "SELECT COUNT(*) FROM information_schema.TABLES WHERE TABLE_SCHEMA='$db' AND TABLE_NAME IN ('t_char','t_charextra');" 2>/dev/null)
        if [ "${miss:-0}" -ge 2 ]; then
            ok "$db 关键角色表齐全"
        else
            warn "$db 缺少 t_char / t_charextra（SQL 未导入完整？）"
        fi
    done < <(mysql --defaults-file=/root/.my.cnf -N -e "SHOW DATABASES;" 2>/dev/null | grep -E '^tlbbdb_')

    # 4. ODBC 连通 + 字符集
    if command -v isql >/dev/null 2>&1; then
        doctor_check_odbc "$fix"
    else
        warn "未安装 unixODBC（isql 不可用），跳过 ODBC 检查"
    fi

    # 5. billing
    local sd bill_port
    if sd=$(find_server_dir) && [ -f "$sd/Server/Config/ServerInfo.ini" ]; then
        # 文件中首个 Port0= 属于 [Billing] 段（其后才是 [Server0]/[Server1] 的监听端口）
        bill_port=$(grep -aE '^Port0=' "$sd/Server/Config/ServerInfo.ini" | head -1 | cut -d= -f2 | tr -d '\r')
        [ -n "$bill_port" ] || bill_port=11100
        if ss -lnt 2>/dev/null | grep -qE "[:.]$bill_port([[:space:]]|$)"; then
            ok "billing 正在监听 $bill_port"
        else
            warn "billing 未监听 $bill_port（登录将报 108）—— 检查 billing 服务是否启动"
        fi
    fi

    # 6. Redis
    local redis_pw redis_ok
    if sd=$(find_server_dir); then
        redis_pw=$(awk 'BEGIN{IGNORECASE=0} /^\[Redis\]/{f=1;next} /^\[/{f=0} f && /^Password=/{sub(/^Password=[[:space:]]*/,""); print; exit}' "$sd/Server/Config/ServerInfo.ini" 2>/dev/null | tr -d '\r')
        if [ -n "$redis_pw" ]; then
            redis_ok=$(redis-cli -a "$redis_pw" --no-auth-warning ping 2>/dev/null)
            [ "$redis_ok" = "PONG" ] && ok "Redis 连接正常（服务端配置的密码有效）" || warn "Redis 用服务端配置的密码无法连通（密码不一致或服务未启动）"
        fi
    fi

    # 7. 进程
    if sd=$(find_server_dir); then
        do_status >/dev/null 2>&1
    fi

    echo ""
    ok "体检完成（修复项执行: tlbb doctor --fix）"
}

# ---------------------------- 服务端日志落盘 ----------------------------------
do_logfix() {
    local sd logdir
    sd=$(find_server_dir) || { err "未找到服务端目录"; exit 1; }
    logdir="$sd/log"
    mkdir -p "$logdir"
    cp "$sd/run.sh" "$sd/run.sh.bak-$(date +%Y%m%d%H%M%S)"
    # ./Xxx1 >/dev/null 2>&1 &  或  ./Xxx1 > /dev/null 2>&1 &  →  ./Xxx1 >>log/Xxx1.log 2>&1 &
    SRV_DIR="$sd" perl -i -pe '
        s{(\./([A-Za-z0-9_]+))\s*>\s*/dev/null\s+2>&1(\s*&\s*)$}{$1 >> $ENV{SRV_DIR}/log/$2.log 2>&1$3}g;
    ' "$sd/run.sh"
    ok "run.sh 已改为按组件落盘日志（$logdir/组件名.log），原脚本已备份"
    info "生效需重启服务端: tlbb restart"
}

do_help() {
    cat <<'EOF'
TLBB 管理命令：
  tlbb menu       打开交互式管理菜单
  tlbb docker     打开 Docker 多版本环境菜单（环境1-4）
  tlbb untar      从 /home 选择服务端压缩包并解压
  tlbb config     写入服务端数据库、Redis 与外网 IP 配置
  tlbb start      启动服务端
  tlbb stop       停止服务端
  tlbb status     查看服务端进程状态
  tlbb backup     备份数据库（含存储过程/触发器）
  tlbb autostart on|off
  tlbb remote-db on|off   开启/关闭数据库远程访问（默认关闭，仅本地）
  tlbb doctor [--fix]     环境体检：存储过程DEFINER/ODBC字符集/连通性等（--fix 自动修复常见项）
  tlbb logfix             把服务端 run.sh 的黑洞日志改为按组件落盘，便于排障
EOF
}

case "${1:-}" in
    menu)      exec "$SCRIPT_DIR/menu.sh" ;;
    docker|env) exec "$SCRIPT_DIR/docker-env.sh" menu ;;
    untar)     exec "$SCRIPT_DIR/menu.sh" --extract ;;
    start)     do_start;     exit 0 ;;
    stop)      do_stop;      exit 0 ;;
    status)    do_status;    exit 0 ;;
    restart)   do_stop; sleep 3; do_start; exit 0 ;;
    backup)    do_backup;    exit 0 ;;
    config)    shift; exec "$SCRIPT_DIR/config.sh" "$@" ;;
    autostart) do_autostart "${2:-}"; exit 0 ;;
    remote-db) do_remote_db "${2:-}"; exit 0 ;;
    doctor)    do_doctor "${2:-}"; exit 0 ;;
    logfix)    do_logfix;    exit 0 ;;
    help|-h|--help) do_help; exit 0 ;;
esac

# 管理子命令不应清空安装日志；仅安装流程从头记录
: > "$LOG_FILE"

# 系统识别：通杀 RHEL 系（CentOS 7/8/9、AlmaLinux、Rocky、腾讯OS、阿里云Linux 等）
OS_ID=$(sed -n 's/^ID=//p' /etc/os-release 2>/dev/null | head -1 | tr -d '"')
OS_PRETTY=$(sed -n 's/^PRETTY_NAME=//p' /etc/os-release 2>/dev/null | head -1 | tr -d '"')
EL_VER=$(rpm -E '%{rhel}' 2>/dev/null | grep -oE '^[0-9]+$' || true)
if ! [[ "$EL_VER" =~ ^(7|8|9)$ ]]; then
    EL_VER=$(sed -n 's/^VERSION_ID="\?\([0-9]*\).*/\1/p' /etc/os-release 2>/dev/null | head -1)
fi
case "$OS_ID:$EL_VER" in
    tencentos:2) EL_VER=7 ;;
    tencentos:3) EL_VER=8 ;;
    alibaba:2)   EL_VER=7 ;;
    alibaba:3)   EL_VER=8 ;;
esac
case "$OS_ID" in
    centos|rhel|almalinux|rocky|tencentos|alibaba|anolis|opencloudos) ;;
    *)
        err "当前系统: ${OS_PRETTY:-未知}（ID=$OS_ID）"
        err "本脚本支持 RHEL 系: CentOS 7/8/9、AlmaLinux、Rocky、腾讯OS、阿里云Linux 等"
        err "游戏服务端为 CentOS 编译，Debian/Ubuntu 无法直接运行，请更换系统后重试"
        exit 1
        ;;
esac
if ! [[ "$EL_VER" =~ ^(7|8|9)$ ]]; then
    err "未能识别系统版本（$OS_PRETTY），仅支持 EL 7/8/9"
    exit 1
fi

clear
echo -e "${CYAN}"
echo  "╔══════════════════════════════════════════════╗"
echo -e "║   ${BOLD}🚀 游戏服务器环境 · 一键部署${NC}${CYAN}"
echo -e "║   MySQL 8.0 + Redis · RHEL 系通杀（CentOS 7/8/9）"
echo  "╚══════════════════════════════════════════════╝"
echo -e "${NC}"

# 已安装检测与磁盘检查（卸载模式跳过；非交互模式下直接报错退出）
if [ "$1" != "uninstall" ] && [ "$1" != "-u" ]; then
    if command -v mysql >/dev/null 2>&1 || systemctl list-unit-files 2>/dev/null | grep -q "^mysqld"; then
        warn "检测到本机已安装 MySQL"
        if [ "$1" = "-p" ]; then
            err "非交互模式无法确认，请先执行 ./install.sh uninstall 后重装"
            exit 1
        fi
        read -p "  继续安装可能造成冲突，仍要继续吗？(y/N): " GO_ON
        [[ $GO_ON =~ [Yy] ]] || { info "已退出，建议先执行 ./install.sh uninstall"; exit 0; }
    fi
    if systemctl list-unit-files 2>/dev/null | grep -q "^mariadb" && systemctl is-active --quiet mariadb 2>/dev/null; then
        warn "检测到正在运行的 MariaDB（与 huanjing 安装的 MySQL 并存会引起字符集/ODBC 驱动差异）"
        info "建议: 备份数据后执行 ./install.sh uninstall，或明确知道自己在做什么再继续"
    fi

    AVAIL_KB=$(df -Pk / | awk 'NR==2 {print $4}')
    if [ "${AVAIL_KB:-0}" -lt $((2 * 1024 * 1024)) ]; then
        warn "根分区剩余空间不足 2GB（当前约 $((AVAIL_KB / 1024 / 1024))GB），安装可能失败"
    fi

    # Swap 检查：低内存且无 Swap 时创建，防止 MySQL / 服务端 OOM
    if ! swapon --show 2>/dev/null | grep -q .; then
        MEM_MB=$(free -m | awk '/^Mem:/ {print $2}')
        if [ "${MEM_MB:-0}" -le 4000 ] && [ "${AVAIL_KB:-0}" -ge $((5 * 1024 * 1024)) ]; then
            warn "未检测到 Swap 且内存仅 ${MEM_MB}MB，建议创建 4G Swap 防止内存不足"
            if [ "$1" = "-p" ] || { read -p "  现在创建 4G Swap？(Y/n): " SW_Y; [[ ! $SW_Y =~ ^[Nn] ]]; }; then
                info "创建 4G Swap..."
                dd if=/dev/zero of=/swapfile bs=1M count=4096 status=none
                chmod 600 /swapfile
                mkswap -q /swapfile
                swapon /swapfile
                grep -q '^/swapfile' /etc/fstab || echo '/swapfile none swap sw 0 0' >> /etc/fstab
                ok "Swap 已创建并写入 /etc/fstab（重启持久）"
            fi
        fi
    fi
fi

# ---------------------------- 卸载模式 --------------------------------------
if [ "$1" = "uninstall" ] || [ "$1" = "-u" ]; then
    CURRENT_STEP="卸载"
    trap - ERR
    echo -e "${RED}"
    echo  "╔══════════════════════════════════════════════╗"
    echo -e "║   ${BOLD}⚠ MySQL 一键卸载 · 此操作不可逆${NC}${RED}"
    echo  "╚══════════════════════════════════════════════╝"
    echo -e "${NC}"

    read -p "确认要卸载 MySQL 吗？(输入 YES 继续): " CONFIRM
    if [ "$CONFIRM" != "YES" ]; then
        info "已取消卸载操作"; exit 0
    fi

    if sd=$(find_server_dir); then
        info "检测到游戏服务端（$sd），先执行安全停服（可能需要几十秒）..."
        sh "$sd/stop.sh" >>"$LOG_FILE" 2>&1 || true
        ok "游戏服务端已关闭"
    fi

    info "停止 MySQL 与 Redis 服务..."
    systemctl stop mysqld 2>/dev/null || true
    systemctl stop redis 2>/dev/null >>"$LOG_FILE" 2>&1 || true
    systemctl disable mysqld >>"$LOG_FILE" 2>&1 || true
    systemctl disable redis >>"$LOG_FILE" 2>&1 || true
    ok "MySQL 服务已停止"

    info "卸载 MySQL 与 Redis 组件..."
    yum remove -y mysql-community-server mysql-community-client \
        mysql-community-client-plugins mysql-community-common \
        mysql-community-icu-data-files mysql-community-libs \
        mysql-connector-odbc redis >>"$LOG_FILE" 2>&1 || true
    ok "组件已卸载"

    info "删除数据文件和配置..."
    rm -rf /var/lib/mysql /var/log/mysqld.log /root/mysql8 /root/.my.cnf \
        /etc/my.cnf.rpmsave /etc/odbc.ini /etc/mysql/ssl /var/lib/redis \
        /etc/redis.conf.rpmsave /root/huanjing-credentials.txt
    ok "数据文件已清理"

    read -p "是否删除所有数据库残留？(y/N): " CLEAN_DB
    if [[ $CLEAN_DB =~ [Yy] ]]; then
        read -s -p "  请输入 MySQL root 密码: " DB_PWD; echo
        mysql -uroot -p"$DB_PWD" -e "DROP DATABASE IF EXISTS tlbbdb_main; \
DROP DATABASE IF EXISTS tlbbdb_world; DROP DATABASE IF EXISTS web;" >>"$LOG_FILE" 2>&1 || true
        ok "数据库已删除"
    fi

    info "清理残留依赖..."
    yum autoremove -y >>"$LOG_FILE" 2>&1 || true

    info "恢复原有 yum 源配置..."
    if [ -d /etc/yum.repos.d/backup ]; then
        mv /etc/yum.repos.d/backup/*.repo /etc/yum.repos.d/ 2>/dev/null || true
        rmdir /etc/yum.repos.d/backup 2>/dev/null || true
    fi
    ok "yum 源已恢复"

    info "移除全局命令与开机自启..."
    rm -f /usr/local/bin/tlbb
    systemctl disable tlbb.service >/dev/null 2>&1 || true
    rm -f /etc/systemd/system/tlbb.service
    systemctl daemon-reload 2>/dev/null || true

    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    ok "MySQL 已完全卸载"
    exit 0
fi

# ---------------------------- 安装模式 --------------------------------------
# 密码: -p 参数（免交互）或交互输入；禁止会破坏 SQL/heredoc 的字符
BAD_CHARS='[$`"'"'"'\\ ]'
if [ "$1" = "-p" ] && [ -n "$2" ]; then
    NONINTERACTIVE=1
    MYSQL_ROOT_PASSWORD="$2"
    if [ ${#MYSQL_ROOT_PASSWORD} -lt 4 ]; then
        err "密码长度不足，请输入至少4位字符"; exit 1
    fi
    if [[ "$MYSQL_ROOT_PASSWORD" =~ $BAD_CHARS ]]; then
        err "密码不能包含 \$ \` \" ' 空格或反斜杠"; exit 1
    fi
else
    while true; do
        read -s -p "请输入 MySQL root 密码（至少4位）: " MYSQL_ROOT_PASSWORD; echo
        read -s -p "请再次输入确认: " MYSQL_ROOT_PASSWORD2; echo
        if [ "$MYSQL_ROOT_PASSWORD" != "$MYSQL_ROOT_PASSWORD2" ]; then
            warn "两次输入不一致，请重新输入"; continue
        fi
        if [ ${#MYSQL_ROOT_PASSWORD} -lt 4 ]; then
            warn "密码长度不足，请输入至少4位字符"; continue
        fi
        if [[ "$MYSQL_ROOT_PASSWORD" =~ $BAD_CHARS ]]; then
            warn "密码不能包含 \$ \` \" ' 空格或反斜杠，请重新输入"; continue
        fi
        break
    done
fi
ok "密码设置完成"

# Redis 密码：与 MySQL 分开。-p 模式自动生成；交互模式可自填或回车自动生成
gen_random_pw() { tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 16; }
if [ $NONINTERACTIVE -eq 1 ]; then
    REDIS_PASSWORD=$(gen_random_pw)
    ok "Redis 密码已自动生成（安装完成后在汇总面板与 /root/huanjing-credentials.txt 查看）"
else
    AUTO_REDIS=0
    read -p "请输入 Redis 密码（与 MySQL 不同，直接回车自动生成）: " REDIS_PASSWORD
    if [ -z "$REDIS_PASSWORD" ]; then
        REDIS_PASSWORD=$(gen_random_pw)
        AUTO_REDIS=1
    elif [[ "$REDIS_PASSWORD" =~ $BAD_CHARS ]]; then
        warn "Redis 密码包含 \$ \` \" ' 空格或反斜杠，已自动生成随机密码"
        REDIS_PASSWORD=$(gen_random_pw)
        AUTO_REDIS=1
    fi
    if [ $AUTO_REDIS -eq 1 ]; then
        ok "Redis 密码已自动生成: ${YELLOW}$REDIS_PASSWORD${NC}"
    fi
fi

# 步骤 1/13：腾讯云镜像源
step_begin "配置系统镜像源（el$EL_VER · $OS_ID）"
info "检查 yum/dnf 进程..."
WAIT_COUNT=0
while pgrep -x yum >/dev/null 2>&1 || pgrep -x dnf >/dev/null 2>&1; do
    [ $WAIT_COUNT -eq 0 ] && warn "检测到其他 yum/dnf 进程正在运行，等待完成..."
    sleep 5; WAIT_COUNT=$((WAIT_COUNT + 1))
    if [ $WAIT_COUNT -gt 60 ]; then
        warn "等待超时，尝试强制终止..."
        pkill -9 yum 2>/dev/null || true; pkill -9 dnf 2>/dev/null || true; sleep 2; break
    fi
done

# 多镜像探测：单一镜像关停时自动切换（腾讯→阿里→中科大→华为）
probe_url() { [ "$(curl -s -o /dev/null -w '%{http_code}' --max-time 6 -L "$1" 2>/dev/null)" = "200" ]; }
YUM_MIRROR=""
if [ "$OS_ID" = "centos" ] && [ "$EL_VER" = "7" ]; then
    PROBE_PATHS="centos-vault/7.9.2009/os/x86_64/repodata/repomd.xml epel/7/x86_64/repodata/repomd.xml"
else
    PROBE_PATHS="centos-stream/$EL_VER-stream/AppStream/x86_64/os/repodata/repomd.xml"
fi
for m in mirrors.tencent.com mirrors.aliyun.com mirrors.ustc.edu.cn mirrors.huaweicloud.com; do
    MIRROR_OK=1
    for p in $PROBE_PATHS; do
        probe_url "https://$m/$p" || { MIRROR_OK=0; break; }
    done
    if [ $MIRROR_OK -eq 1 ]; then
        YUM_MIRROR="$m"; break
    fi
done

if [ "$OS_ID" != "centos" ]; then
    info "检测到 $OS_PRETTY，保留系统自带镜像源"
elif [ -n "$YUM_MIRROR" ]; then
    info "备份原有 yum 源配置..."
    mkdir -p /etc/yum.repos.d/backup
    mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup/ 2>/dev/null || true
    info "使用已探测可用的镜像源: ${YELLOW}$YUM_MIRROR${NC}"
    if [ "$EL_VER" = "7" ]; then
        info "CentOS 7 已停止维护，写入 vault 归档源 + EPEL..."
        cat > /etc/yum.repos.d/CentOS-Base.repo << EOF
[base]
name=CentOS-7 - Base - $YUM_MIRROR
baseurl=https://$YUM_MIRROR/centos-vault/7.9.2009/os/\$basearch/
gpgcheck=1
gpgkey=https://$YUM_MIRROR/centos-vault/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-7 - Updates - $YUM_MIRROR
baseurl=https://$YUM_MIRROR/centos-vault/7.9.2009/updates/\$basearch/
gpgcheck=1
gpgkey=https://$YUM_MIRROR/centos-vault/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-7 - Extras - $YUM_MIRROR
baseurl=https://$YUM_MIRROR/centos-vault/7.9.2009/extras/\$basearch/
gpgcheck=1
gpgkey=https://$YUM_MIRROR/centos-vault/RPM-GPG-KEY-CentOS-7

[epel]
name=EPEL-7 - $YUM_MIRROR
baseurl=https://$YUM_MIRROR/epel/7/\$basearch/
gpgcheck=0
enabled=1
EOF
    else
        cat > /etc/yum.repos.d/CentOS-Base.repo << EOF
[baseos]
name=CentOS Stream - BaseOS - $YUM_MIRROR
baseurl=https://$YUM_MIRROR/centos-stream/\$releasever-stream/BaseOS/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=https://$YUM_MIRROR/centos-stream/RPM-GPG-KEY-CentOS-Official

[appstream]
name=CentOS Stream - AppStream - $YUM_MIRROR
baseurl=https://$YUM_MIRROR/centos-stream/\$releasever-stream/AppStream/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=https://$YUM_MIRROR/centos-stream/RPM-GPG-KEY-CentOS-Official

[extras-common]
name=CentOS Stream - Extras - $YUM_MIRROR
baseurl=https://$YUM_MIRROR/centos-stream/\$releasever-stream/extras-common/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://$YUM_MIRROR/centos-stream/RPM-GPG-KEY-CentOS-Official
EOF
    fi
else
    warn "所有国内镜像探测失败，保留系统原有源继续（若系统源也不可用将无法安装依赖）"
fi
run_opt "清理 yum 缓存" yum clean all
run_opt "构建 yum 缓存（首次约1-2分钟）" yum makecache

# 步骤 2/13：系统依赖
step_begin "安装系统依赖包"
run     "安装 perl / net-tools / libaio / zip / openssl" yum install -y perl net-tools libaio zip openssl
run_opt "移除旧版 mysql-libs" yum -y remove mysql-libs
run_opt "安装 libnuma 依赖" yum install -y libnuma*
ok "依赖包安装完成"

# 步骤 3/13：定位安装包（RPM 仅 el9 离线用；SQL 备份所有版本都需要）
step_begin "定位 MySQL 安装包与数据库备份"
TAR_FILE=""; PKG_DIR=""
find_packages() {
    for d in "$SCRIPT_DIR/mysql-packages" "$PWD/mysql-packages" /home/mysql-packages /root/mysql8; do
        if [ -d "$d" ] && { ls "$d"/*.rpm >/dev/null 2>&1 || ls "$d"/*.sql >/dev/null 2>&1; }; then
            PKG_DIR="$d"; return 0
        fi
    done
    for f in "$SCRIPT_DIR/mysql-packages.tar.gz" "$PWD/mysql-packages.tar.gz" /home/mysql-packages.tar.gz; do
        if [ -f "$f" ]; then
            TAR_FILE="$f"; return 0
        fi
    done
    return 1
}
if find_packages; then
    if [ -n "$PKG_DIR" ]; then
        ok "已找到安装包目录: $PKG_DIR"
        TARGET_DIR="$PKG_DIR"
    else
        TARGET_DIR="/root/mysql8"
        info "找到压缩包 $TAR_FILE，解压到 $TARGET_DIR ..."
        rm -rf "$TARGET_DIR"; mkdir -p "$TARGET_DIR"
        tar -xzf "$TAR_FILE" -C "$TARGET_DIR" --strip-components=1 2>/dev/null || tar -xzf "$TAR_FILE" -C "$TARGET_DIR"
        if ! ls "$TARGET_DIR"/*.rpm >/dev/null 2>&1; then
            SUB=$(find "$TARGET_DIR" -maxdepth 2 -name "*.rpm" | head -1 | xargs -r dirname)
            if [ -n "$SUB" ] && [ "$SUB" != "$TARGET_DIR" ]; then
                mv "$SUB"/*.rpm "$TARGET_DIR/" 2>/dev/null || true
                mv "$SUB"/*.sql "$TARGET_DIR/" 2>/dev/null || true
                rm -rf "$SUB"
            fi
        fi
        ok "解压完成"
    fi
else
    TARGET_DIR=""
    warn "未找到 mysql-packages/ 目录或 mysql-packages.tar.gz（RPM 或 SQL）"
    if [ "$EL_VER" = "9" ]; then
        info "MySQL 将改用官方在线源安装；数据库备份 SQL 缺失，导入步骤将跳过"
    else
        info "el$EL_VER 使用官方在线源安装 MySQL；数据库备份 SQL 缺失，导入步骤将跳过"
    fi
    info "如需完整部署，请将 mysql-packages 放在 install.sh 同目录后重试"
fi

# 步骤 4/13：安装 MySQL 组件（离线包 → 系统AppStream → 官方源，三级兜底）
step_begin "安装 MySQL 组件（el$EL_VER）"
OFFLINE_RPMS=""
if [ "$EL_VER" = "9" ] && [ -n "$TARGET_DIR" ] && ls "$TARGET_DIR"/*.rpm >/dev/null 2>&1; then
    OFFLINE_RPMS=1
fi
install_mysql_appstream() {
    info "尝试系统 AppStream 的 MySQL 8.0（无需外部源）..."
    yum -y module reset mysql >>"$LOG_FILE" 2>&1 || true
    yum -y module enable mysql:8.0 >>"$LOG_FILE" 2>&1 || true
    yum install -y mysql-server mysql-connector-odbc >>"$LOG_FILE" 2>&1
}
install_mysql_official() {
    if ! probe_url "https://repo.mysql.com/yum/mysql-8.0-community/el/$EL_VER/x86_64/repodata/repomd.xml"; then
        warn "MySQL 官方源当前不可达"
        return 1
    fi
    info "写入 MySQL 官方源（repo.mysql.com）..."
    if [ "$EL_VER" = "8" ]; then
        yum -y module disable mysql >>"$LOG_FILE" 2>&1 || true
    fi
    cat > /etc/yum.repos.d/mysql80-community.repo <<EOF
[mysql80-community]
name=MySQL 8.0 Community Server
baseurl=https://repo.mysql.com/yum/mysql-8.0-community/el/$EL_VER/\$basearch/
enabled=1
gpgcheck=0

[mysql-connectors-community]
name=MySQL Connectors Community
baseurl=https://repo.mysql.com/yum/mysql-connectors-community/el/$EL_VER/\$basearch/
enabled=1
gpgcheck=0
EOF
    yum install -y mysql-community-server mysql-connector-odbc >>"$LOG_FILE" 2>&1
}
if [ "$OFFLINE_RPMS" = "1" ]; then
    RPM_COUNT=$(ls -1 "$TARGET_DIR"/*.rpm 2>/dev/null | wc -l)
    info "离线模式：使用自带 $RPM_COUNT 个 RPM 包（输出已写入日志）..."
    cd "$TARGET_DIR"
    run "MySQL 8.0.31 及 ODBC 驱动安装完成" yum install -y \
        mysql-community-common-*.rpm \
        mysql-community-libs-*.rpm \
        mysql-community-client-plugins-*.rpm \
        mysql-community-icu-data-files-*.rpm \
        mysql-community-client-*.rpm \
        mysql-community-server-*.rpm \
        mysql-connector-odbc-*.rpm
elif [ "$EL_VER" != "7" ] && install_mysql_appstream; then
    ok "MySQL 8.0 及 ODBC 驱动安装完成（系统 AppStream 源）"
elif install_mysql_official; then
    ok "MySQL 8.0 及 ODBC 驱动安装完成（MySQL 官方源）"
else
    err "MySQL 安装失败：离线包 / AppStream / 官方源均不可用，详见 $LOG_FILE"
    exit 1
fi

# 步骤 5/13：启动服务
step_begin "启动 MySQL 服务"
run "设置开机自启" systemctl enable mysqld
run "启动 mysqld"  systemctl start mysqld
sleep 3
ok "MySQL 服务已启动"

# 步骤 6/13：初始密码
step_begin "获取初始临时密码"
TEMP_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
if [ -z "$TEMP_PASSWORD" ]; then
    err "未在 /var/log/mysqld.log 中找到临时密码"
    tail -20 /var/log/mysqld.log 2>/dev/null || true
    exit 1
fi
info "临时密码: ${YELLOW}$TEMP_PASSWORD${NC}"

# 步骤 7/13：用户权限
step_begin "配置 MySQL 用户权限"
mysql --connect-expired-password -uroot -p"$TEMP_PASSWORD" >>"$LOG_FILE" 2>&1 <<EOF || fail "配置 root 密码与权限"
ALTER USER 'root'@'localhost' IDENTIFIED BY '$TEMP_PASSWORD';
FLUSH PRIVILEGES;
SET GLOBAL validate_password.policy = 0;
SET GLOBAL validate_password.length = 4;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
ok "root 密码配置完成（默认仅本地访问；远程: tlbb remote-db on）"

cat > /root/.my.cnf <<EOF
[client]
user = root
password = $MYSQL_ROOT_PASSWORD
host = localhost
EOF
chmod 600 /root/.my.cnf
ok "已创建 /root/.my.cnf 免密登录配置"

mysql --defaults-file=/root/.my.cnf >>"$LOG_FILE" 2>&1 <<EOF || fail "切换认证插件"
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
ok "认证插件已切换为 mysql_native_password"

# 步骤 8/13：SSL 证书
step_begin "生成 SSL 证书"
OPENSSL_DIR="/etc/mysql/ssl"
mkdir -p "$OPENSSL_DIR"
if ! command -v openssl >/dev/null 2>&1; then
    warn "OpenSSL 未安装，正在安装（不升级现有版本）..."
    run "安装 OpenSSL" yum install -y openssl --setopt=obsoletes=0
else
    ok "OpenSSL 已存在（$(openssl version 2>/dev/null)），跳过安装"
fi
if ! systemctl is-active --quiet sshd; then
    warn "SSH 服务异常，尝试修复（防止 OpenSSL/SSH 版本冲突）..."
    systemctl restart sshd 2>/dev/null || {
        for i in 1 2 3; do yum downgrade openssl -y >>"$LOG_FILE" 2>&1 && break || true; done
        systemctl restart sshd 2>/dev/null || {
            run_opt "安装 openssh-server" yum install -y openssh-server
            systemctl restart sshd 2>/dev/null || true
        }
    }
    systemctl is-active --quiet sshd && ok "SSH 服务已修复" || warn "SSH 仍未正常，请通过 VNC 检查"
else
    ok "SSH 服务运行正常"
fi
run "生成 RSA 私钥" openssl genpkey -algorithm RSA -out "$OPENSSL_DIR/server-key.pem"
run "生成证书请求"  openssl req -new -key "$OPENSSL_DIR/server-key.pem" -out "$OPENSSL_DIR/certificate_request.csr" -subj "/CN=mysql-server"
run "签发证书"      openssl x509 -req -days 365 -in "$OPENSSL_DIR/certificate_request.csr" -signkey "$OPENSSL_DIR/server-key.pem" -out "$OPENSSL_DIR/server-cert.pem"
cp "$OPENSSL_DIR/server-cert.pem" "$OPENSSL_DIR/ca.pem"
ok "SSL 证书生成完成"

# 步骤 9/13：MySQL SSL 配置
step_begin "配置 MySQL SSL"
# 只在缺失时追加，保证脚本幂等（重跑不会重复追加 [mysqld] 段）
if ! grep -q '^ssl-ca' /etc/my.cnf 2>/dev/null; then
    cat >> /etc/my.cnf <<EOF

[mysqld]
ssl-ca = $OPENSSL_DIR/ca.pem
ssl-cert = $OPENSSL_DIR/server-cert.pem
ssl-key = $OPENSSL_DIR/server-key.pem
bind-address = 127.0.0.1
port = 3306
EOF
    ok "SSL 已写入 /etc/my.cnf（默认仅监听 127.0.0.1:3306）"
else
    ok "MySQL SSL 配置已存在，跳过（保持幂等）"
fi
info "需要数据库远程访问时执行: ${YELLOW}tlbb remote-db on${NC}"

# 步骤 10/13：导入数据库
step_begin "导入数据库"
if [ -z "$TARGET_DIR" ]; then
    warn "未找到 SQL 备份（mysql-packages 目录），跳过数据库导入，请稍后手动导入"
else
    for DB in tlbbdb_main tlbbdb_world web; do
        SQL_FILE="$TARGET_DIR/$DB.sql"
        if [ -f "$SQL_FILE" ]; then
            run "创建数据库 $DB" mysql --defaults-file=/root/.my.cnf -e "CREATE DATABASE IF NOT EXISTS $DB"
            info "导入 $DB.sql（大文件可能需要几分钟）..."
            run "导入 $DB 完成" bash -c "mysql --defaults-file=/root/.my.cnf '$DB' < '$SQL_FILE'"
        else
            warn "未找到 $SQL_FILE，跳过 $DB"
        fi
    done
fi

# 步骤 11/13：ODBC 数据源
step_begin "配置 ODBC 数据源"
# 动态定位 ODBC 驱动（不同版本/安装方式路径可能不同）
ODBC_DRIVER=$(ls /usr/lib64/libmyodbc8a.so 2>/dev/null || ls /usr/lib64/libmyodbc*.so 2>/dev/null | head -1 || echo "/usr/lib64/libmyodbc8a.so")
info "ODBC 驱动: $ODBC_DRIVER"
cat > /etc/odbc.ini <<EOF
# CHARSET 与库表字符集保持一致（huanjing 内置 SQL 为 latin1），
# 游戏端以 GBK 原始字节写入，缺省的 utf8mb4 连接会导致中文写入静默失败。
[tlbbdb_main]
Driver          = $ODBC_DRIVER
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = tlbbdb_main
CHARSET         = latin1
OPTION          = 3
SOCKET          =

[tlbbdb_world]
Driver          = $ODBC_DRIVER
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = tlbbdb_world
CHARSET         = latin1
OPTION          = 3
SOCKET          =

[web]
Driver          = $ODBC_DRIVER
SERVER          = 127.0.0.1
PORT            = 3306
USER            = root
Password        = $MYSQL_ROOT_PASSWORD
Database        = web
CHARSET         = latin1
OPTION          = 3
SOCKET          =
EOF
ok "三个 ODBC 数据源已写入 /etc/odbc.ini（CHARSET=latin1 与库表一致）"

# 步骤 12/13：Redis
step_begin "安装配置 Redis"
run "安装 Redis" yum install -y redis
info "配置远程访问与独立访问密码..."
if grep -q '^bind ' /etc/redis.conf; then
    sed -i 's/^bind .*/bind 0.0.0.0/' /etc/redis.conf
else
    echo 'bind 0.0.0.0' >> /etc/redis.conf
fi
if grep -q '^protected-mode ' /etc/redis.conf; then
    sed -i 's/^protected-mode .*/protected-mode no/' /etc/redis.conf
else
    echo 'protected-mode no' >> /etc/redis.conf
fi
sed -i '/^requirepass /d' /etc/redis.conf
echo "requirepass $REDIS_PASSWORD" >> /etc/redis.conf
run "设置 redis 开机自启" systemctl enable redis
run "启动 redis" systemctl restart redis
run_sh "Redis 连接验证" "redis-cli -a '$REDIS_PASSWORD' --no-auth-warning ping | grep -q PONG"
run_sh "Redis 远程监听验证" "ss -lnt | grep -Eq '(^|[[:space:]])0\\.0\\.0\\.0:6379([[:space:]]|$)'"
ok "Redis 配置完成（0.0.0.0:6379）"

# 步骤 13/13：重启验证
step_begin "重启并验证服务"
run "重启 mysqld" systemctl restart mysqld
sleep 2
run_sh "MySQL 登录验证" "mysql --defaults-file=/root/.my.cnf -e 'SHOW DATABASES;'"
run_sh "MySQL 远程监听验证" "ss -lnt | grep -Eq '(^|[[:space:]])0\\.0\\.0\\.0:3306([[:space:]]|$)'"
trap - ERR
if systemctl is-active --quiet sshd; then
    SSH_STATUS="${GREEN}✔ 正常运行${NC}"
else
    SSH_STATUS="${RED}✖ 异常（请通过 VNC 检查）${NC}"
fi

T_ELAPSED=$((SECONDS - T_START))
T_FMT=$(printf '%d分%02d秒' $((T_ELAPSED / 60)) $((T_ELAPSED % 60)))
REDIS_VER=$(redis-server --version 2>/dev/null | awk '{print $3}' | cut -d= -f2)
REDIS_VER="${REDIS_VER:-6.2}"
MYSQL_VER=$(mysql --version 2>/dev/null | grep -oE '[0-9]+(\.[0-9]+)+' | head -1)
MYSQL_VER="${MYSQL_VER:-8.0}"

# 账号信息落盘（仅 root 可读），防止忘记密码
CRED_FILE=/root/huanjing-credentials.txt
cat > "$CRED_FILE" <<EOF
游戏服务器环境账号信息（生成于 $(date '+%Y-%m-%d %H:%M:%S')）
============================================================
MySQL root 密码 : $MYSQL_ROOT_PASSWORD
Redis 密码      : $REDIS_PASSWORD
Redis 端口      : 6379
MySQL 端口      : 3306
============================================================
EOF
chmod 600 "$CRED_FILE"

# 注册全局 tlbb 命令（借鉴 gstlenv）：任意目录可用
cat > /usr/local/bin/tlbb <<EOF
#!/bin/bash
exec $SCRIPT_DIR/install.sh "\$@"
EOF
chmod +x /usr/local/bin/tlbb

clear
echo -e "${GREEN}"
echo  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  ${BOLD}🎉 安装成功完成！${NC}${GREEN}   总耗时: $T_FMT"
echo  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${NC}"
echo -e "  ${GREEN}✔${NC} MySQL 版本     ${YELLOW}${MYSQL_VER}${NC}（systemctl 管理，开机自启）"
echo -e "  ${GREEN}✔${NC} 数据库         ${YELLOW}tlbbdb_main / tlbbdb_10 / tlbbdb_world / web${NC}（按实际导入）"
echo -e "  ${GREEN}✔${NC} 远程访问       ${YELLOW}默认关闭${NC}（仅 127.0.0.1；需要时: tlbb remote-db on）"
echo -e "  ${GREEN}✔${NC} ODBC 数据源    ${YELLOW}/etc/odbc.ini${NC}"
echo -e "  ${GREEN}✔${NC} Redis 服务     ${YELLOW}${REDIS_VER}${NC}（端口 6379，独立密码）"
echo -e "  ${GREEN}✔${NC} SSL 证书       ${YELLOW}/etc/mysql/ssl/${NC}"
echo -e "  ${GREEN}✔${NC} SSH 服务       $SSH_STATUS"
echo ""
echo -e "  ${BLUE}ℹ${NC} 安装日志: $LOG_FILE"
echo -e "  ${BLUE}ℹ${NC} MySQL / Redis 密码已保存: ${YELLOW}$CRED_FILE${NC}（仅 root 可读）"
for d in /home/tlbb* /root/tlbb* "$SCRIPT_DIR"/tlbb*; do
    if [ -f "$d/Server/Config/ServerInfo.ini" ]; then
        echo -e "  ${YELLOW}→${NC} 检测到服务端目录: ${YELLOW}$d${NC} — 运行 ${YELLOW}./config.sh${NC} 一键写入密码与外网IP"
        break
    fi
done
echo -e "  ${BLUE}ℹ${NC} 服务端管理: ${YELLOW}tlbb start | stop | status | restart | backup${NC}"
if sd=$(find_server_dir); then
    GAME_PORTS=$(grep -ahoE '^Port[0-9]*=[0-9]+' "$sd/Server/Config/ServerInfo.ini" 2>/dev/null | cut -d= -f2 | sort -un | tr '\n' ' ')
    [ -n "$GAME_PORTS" ] && echo -e "  ${YELLOW}→${NC} 云安全组请放行端口: ${YELLOW}$GAME_PORTS${NC}（6379/3306 建议仅对授权IP开放）"
fi
echo -e "  ${BLUE}ℹ${NC} 开机自启服务端: ${YELLOW}tlbb autostart on${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${GREEN}${BOLD}🚀 现在可以上传版本，开服！${NC}"
echo ""
