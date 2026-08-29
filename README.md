# huanjing — 游戏服务器环境一键部署

CentOS Stream 9 专用：一条命令完成 **MySQL 8.0.31 + Redis + ODBC 驱动 + 三个业务数据库（tlbbdb_main / tlbbdb_world / web）+ SSL + ODBC 数据源** 的全自动安装配置。

## 目录结构

| 文件 | 说明 |
|---|---|
| `netinstall.sh` | 网络拉取版：从 GitHub 下载整包并自动执行安装（新服务器只需一条命令） |
| `install.sh` | 本地一键安装/卸载脚本（MySQL + Redis + 三个数据库） |
| `config.sh` | 一键修改服务端配置：写入数据库/Redis 密码与外网 IP |
| `tlbb64/` | 天龙服务端（Server 端程序 + Public 脚本资源，GBK 编码原样保存） |
| `mysql-packages/` | MySQL 8.0.31 RPM 包（el9）+ 三个数据库的 SQL 备份 |
| `.gitignore` / `.gitattributes` | git 配置（忽略压缩包与运行时文件，tlbb64 不做换行转换） |

## 环境要求

- CentOS Stream 9，root 权限
- 磁盘剩余空间 ≥ 2GB
- 网络可访问 `mirrors.tencent.com`（YUM 镜像）和 `github.com`（拉取安装包）

## 方式一：网络拉取一键部署（推荐）

在全新服务器上以 root 执行**一条命令**，自动完成全部四步：**下载整包 → 安装环境（MySQL + Redis + 数据库）→ 部署服务端到 `/home/tlbb64` 并写入密码/外网IP → 启动服务端**：

```bash
bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh)
```

过程中只需按提示输入 MySQL root 密码（两次确认）、Redis 密码（回车自动生成）并确认启动。

**全自动免交互版**（Redis 密码自动生成、服务端自动启动，适合脚本化批量部署）：

```bash
bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh) -p 你的MySQL密码
```

可选参数：`--no-config` 只装环境不改服务端配置；`--no-start` 装/配完不启动服务端；`-t <Token>` 仓库转私有时使用。

## 方式二：本地一键安装

把整个目录（`install.sh` + `mysql-packages/`）上传到服务器任意目录（如 `/root/huanjing`），然后：

```bash
cd /root/huanjing
chmod +x install.sh
./install.sh              # 交互式
./install.sh -p 你的密码   # 免交互
```

- 安装包查找顺序：脚本同目录 → 当前目录 → `/home` → `/root`；`mysql-packages/` 文件夹或 `mysql-packages.tar.gz` 压缩包均可识别。
- **MySQL root 密码**：至少 4 位；不能包含 `$` `` ` `` `"` `'` 空格、反斜杠（会破坏 SQL 配置写入）。
- **Redis 密码**：与 MySQL 分开设置。交互模式可自定义（直接回车自动生成 16 位随机密码）；`-p` 免交互模式自动生成随机密码。
- 两个密码安装完成后保存在服务器 `/root/huanjing-credentials.txt`（权限 600，仅 root 可读），汇总面板也会显示。

## 第三步：一键配置服务端

> 使用方式一的一键命令时，本步骤会**自动执行**，无需手动操作。以下仅用于手动补配或修改配置后重写。

在服务器上执行（`config.sh` 会自动定位服务端目录并读取安装时保存的密码）：

```bash
./config.sh
```

自动完成三件事：

| 修改 | 文件 | 内容 |
|---|---|---|
| MySQL 密码 | `LoginInfo.ini` / `CenterServerInfo.ini` / `ShareMemInfo.ini` | `DBPassword=` 写入新密码 |
| Redis 密码 | `CenterServerInfo.ini` / `ServerInfo.ini` | 仅 `[Redis]` 段的 `Password=` |
| 外网 IP | `ServerInfo.ini` | `[Billing]` 的 `192.168.*` 占位替换为公网 IP（自动检测，可手输或跳过） |

全自动免交互版：

```bash
./config.sh -d /root/tlbb64 -m MySQL密码 -r Redis密码 -i 外网IP -y
```

说明：

- **按字段名定位**替换，不依赖旧密码值；`DBName`（tlbbdb_main / tlbbdb_world）与 `DBUser=root` 与本环境一致，无需修改
- 服务端配置为 **GBK + CRLF 编码**，脚本用 perl 按字节安全替换，已做字节级校验：除目标字段外全部内容原样保留
- 修改前自动备份 `Config` 目录与全部启动脚本到 `tlbb64/ConfigBackup_时间.tar.gz`，回滚命令在执行结束时打印
- 服务端不在标准位置 `/home/tlbb64` 时，自动改写 `run.sh`/`stop.sh` 等脚本内置路径
- 改完重启服务端生效（`./install.sh restart`）

## 服务端日常管理

装完后在 `/root/huanjing` 目录执行：

```bash
./install.sh start      # 启动（ShareMemory → World → Server → Login，约1分钟）
./install.sh stop       # 关闭（安全停服，各进程退出后自动打包日志到 tlbb64/logbak/）
./install.sh status     # 查看四个组件进程状态
./install.sh restart    # 重启
```

等价于直接执行服务端自带的 `run.sh` / `stop.sh`，但会自动定位服务端目录并统一输出格式。

## 安装内容（13 步全自动）

1. 配置腾讯云 YUM 镜像源（原配置自动备份到 `/etc/yum.repos.d/backup/`）
2. 安装系统依赖：perl、net-tools、libaio、zip、openssl、libnuma
3. 定位 / 解压 MySQL 安装包
4. 按依赖顺序安装 7 个 RPM（含 MySQL ODBC 驱动）
5. 启动 mysqld 并设置开机自启
6. 获取 MySQL 初始临时密码
7. 配置 root 密码、`root@%` 远程访问、`mysql_native_password` 认证插件
8. 生成 SSL 证书（自动检测并修复 OpenSSL/SSH 版本冲突）
9. 写入 `/etc/my.cnf` SSL 配置
10. 创建并导入 `tlbbdb_main`、`tlbbdb_world`、`web` 三个数据库
11. 配置 `/etc/odbc.ini` 三个 ODBC 数据源
12. 安装并配置 Redis（远程访问、独立密码、开机自启）
13. 重启 MySQL 并验证登录

## 卸载

```bash
cd /root/huanjing
./install.sh uninstall    # 输入 YES 确认，可选是否删库
```

## 安装结果与文件位置

| 项目 | 位置 |
|---|---|
| MySQL 服务 | `systemctl` 管理，开机自启 |
| 数据库 | `tlbbdb_main`（主库）、`tlbbdb_world`（世界库）、`web`（网页库） |
| MySQL 配置 | `/etc/my.cnf` |
| ODBC 数据源 | `/etc/odbc.ini` |
| Redis | 端口 `6379`，独立 `requirepass` 密码，已开启远程访问 |
| SSL 证书 | `/etc/mysql/ssl/` |
| 数据目录 | `/var/lib/mysql` |
| 免密登录配置 | `/root/.my.cnf`（root 本机执行 mysql 不再需要输密码） |
| 账号信息备份 | `/root/huanjing-credentials.txt`（MySQL/Redis 密码，仅 root 可读） |
| 日志 | `/var/log/mysqld.log` |

## 常用命令

```bash
systemctl status mysqld        # 查看状态
systemctl restart mysqld       # 重启
mysql -uroot -p                # 登录 MySQL
mysql -uroot -p -e "SHOW DATABASES;"
cat /etc/odbc.ini              # 查看 ODBC 配置
systemctl status redis         # 查看 Redis 状态
redis-cli -a 你的密码 ping     # Redis 连通测试（返回 PONG）
```

## 常见问题

### 安装后 SSH 无法登录（极少数情况）

原因：OpenSSL 与 SSH 服务版本不匹配。通过云厂商 **VNC 控制台** 登录后处理：

```bash
openssl version && ssh -V        # 检查版本

# 方案一：降级 OpenSSL（推荐，重复执行直到成功）
yum downgrade openssl
systemctl restart sshd

# 方案二：升级 SSH 服务
yum install openssh-server -y
systemctl restart sshd
```

最新版脚本安装过程中会自动检测此问题并尝试修复。

### 提示已安装 MySQL

脚本启动时会自动检测本机是否已装 MySQL：交互模式可确认继续，免交互模式（`-p`）会直接退出。重复安装前建议先执行 `./install.sh uninstall` 清理。

### 提示找不到 mysql-packages

把 `mysql-packages/` 目录（或 `mysql-packages.tar.gz`）放到 `install.sh` 同目录下再运行。

### 安装中途失败

执行 `./install.sh uninstall` 清理后重跑；同时检查磁盘空间（≥2GB）和网络。脚本会打印失败发生的阶段，便于定位。

### 网络拉取失败

确认服务器能访问 `api.github.com`；如仓库以后改为私有，可给 `netinstall.sh` 传 `-t <GitHub Token>`（需 repo 读取权限）或设置 `GH_TOKEN` 环境变量。
