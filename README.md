# huanjing — 游戏服务器环境一键部署

CentOS / RHEL 系通杀：一条命令完成 **MySQL 8.0 + Redis + ODBC 驱动 + 三个业务数据库（tlbbdb_main / tlbbdb_world / web）+ SSL + ODBC 数据源** 的全自动安装配置。

## 目录结构

| 文件 | 说明 |
|---|---|
| `netinstall.sh` | 网络拉取版：稀疏下载环境脚本与 MySQL 包，不下载 `tlbb*` 服务端目录 |
| `install.sh` | 本地一键安装/卸载脚本（MySQL + Redis + 三个数据库） |
| `config.sh` | 一键修改服务端配置：写入数据库/Redis 密码与外网 IP |
| `menu.sh` | 交互式管理菜单：环境安装、解压服务端 tar 包、配置、启停、状态和备份 |
| `docker-env.sh` | Docker 多版本环境：环境1-4、镜像内置数据库初始化、服务端容器化启停 |
| `tlbb64/` | 天龙服务端（Server 端程序 + Public 脚本资源，GBK 编码原样保存） |
| `mysql-packages/` | MySQL 8.0.31 RPM 包（el9）+ 三个数据库的 SQL 备份 |
| `.gitignore` / `.gitattributes` | git 配置（忽略压缩包与运行时文件，tlbb64 不做换行转换） |

## 环境要求

- **支持的系统（RHEL 系通杀）**：CentOS 7 / 8 / Stream 8 / Stream 9、AlmaLinux、Rocky Linux、腾讯OS、阿里云Linux，root 权限
- **不支持**：Debian / Ubuntu（游戏服务端为 CentOS 编译，无法直接运行）
- 磁盘剩余空间 ≥ 2GB（低内存小硬盘时会自动建议创建 Swap）
- 网络：`mirrors.tencent.com`（系统镜像）、`repo.mysql.com`（MySQL 官方源，非 el9 系统在线安装用）、`github.com`（拉取安装包）

### 不同系统的安装差异（脚本自动处理）

| 系统 | MySQL 安装方式 | 说明 |
|---|---|---|
| CentOS Stream 9（含 Alma/Rocky 9） | 自带 el9 离线 RPM 包 | 全离线，速度最快 |
| CentOS 7（含腾讯OS2、阿里云Linux2） | MySQL 官方在线源 | 自动配置 vault 归档源 + EPEL（7 已停止维护） |
| CentOS 8 / Stream 8（含腾讯OS3、阿里云Linux3） | MySQL 官方在线源 | 自动禁用内置 mysql 模块 |
| 其余 RHEL 系 | MySQL 官方在线源 | 保留系统自带镜像源不覆盖 |

ODBC 驱动路径会在安装时自动探测并写入 `/etc/odbc.ini`，无需关心版本差异。

### 服务端版本通配

服务端目录名不限（`tlbb` / `tlbb64` / `tlbb757` / `tlbb980` 等任意 `tlbb*` 命名均可），脚本按 `Server/Config/ServerInfo.ini` 结构自动识别。一键部署时按目录名放入 `/home/`（如 `tlbb757 → /home/tlbb757`），启动/关闭脚本内置路径自动适配，`tlbb` 全局命令自动定位。`tlbb status` 会自动识别实际二进制名，例如 `CenterServer1`、`ShareMemory1`、`World1`、`Server1`、`Login1` 或对应的 `*64` 版本。

### 环境版本边界

当前仓库内置的是 **环境4：EL9 x86_64 + MySQL 8.0.31 + Redis**，适合源端 64 位服务端。一个原生 MySQL 实例不能同时作为 5.1、5.7 和 8.0 使用：数据库数据目录、认证方式和库兼容性都不同。

参考 [gstlenv](https://github.com/yulinzhihou/gstlenv) 的做法，真正的“环境1-4 通杀”应使用 Docker 为每个服务端隔离 MySQL 与 Redis。其组合为：环境1 `gs_server + gs_mysql51`、环境2 `gs_server7 + gs_mysql51`、环境3 `gs_server7 + gs_mysql57`、环境4 `gs_server9 + gs_mysql80`。因此部署时先按服务端包选择环境，不能让旧库直接接到本仓库的 MySQL 8。

Docker 菜单已经集成到 `menu.sh` 的选项 `9`。环境1-3启动后执行镜像内置的 `/usr/local/bin/init_db.sh`，无需另传 SQL；环境4导入本仓库提供的 MySQL 8 三份 SQL。Docker 文件与数据单独放在 `/opt/huanjing-docker`，不会覆盖原生 MySQL 环境。服务端包先上传到 `/home`，在 Docker 菜单选择 `2 → 3 → 5` 完成解压、配置和启动。

### 源站故障容错（YUM 源挂了还能用吗）

- **系统镜像源**：安装时先探测 **腾讯 → 阿里 → 中科大 → 华为** 四个国内镜像，任一存活即自动选用；全部失联则回退服务器系统原有源
- **MySQL 三级兜底**：el9 优先自带**离线 RPM**（不依赖任何源）→ 系统 AppStream → MySQL 官方源；el8/9 优先系统 AppStream → 官方源；仅 el7 依赖 MySQL 官方源（repo.mysql.com，唯一外网强依赖）
- **Redis**：el7 用 EPEL（随镜像探测自动切换），el8/9 用系统 AppStream
- **ODBC 驱动路径**：安装后动态探测写入配置，任何安装来源都能正确识别

## 方式一：网络拉取一键部署（推荐）

在全新服务器上以 root 执行**一条命令**，自动完成：**显示下载地址与范围 → 稀疏下载环境脚本和 MySQL 包 → 安装 MySQL、Redis、ODBC 与三个数据库**。`tlbb*` 服务端目录不会下载。

```bash
bash <(curl --progress-bar -fL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh)
```

过程中只需按提示输入 MySQL root 密码（两次确认）与 Redis 密码（回车自动生成）。下载阶段会显示 GitHub 仓库地址、分支和下载范围。

**全自动免交互版**（Redis 密码自动生成，适合脚本化批量部署）：

```bash
bash <(curl --progress-bar -fL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh) -p 你的MySQL密码
```

可选参数：`-t <Token>` 仓库转私有时使用。

环境安装完成后，将服务端压缩包（`.tar` / `.tar.gz` / `.tgz` / `.tar.xz`）上传到 `/home/`，再启动交互菜单：

```bash
sh /root/huanjing/menu.sh
```

菜单选择 `2` 后会列出 `/home` 下的服务端压缩包。选中后输入部署目录名（默认识别为 `tlbb*` 目录），脚本会解压、检查 `Server/Config/ServerInfo.ini`，并询问是否立即写入数据库、Redis 与外网 IP 配置。之后在菜单选择 `4` 启动服务端。

服务端管理也可使用短命令：

```bash
tlbb menu      # 打开交互菜单
tlbb untar     # 直接进入服务端解压流程
tlbb config    # 写入配置
tlbb start     # 启动
tlbb stop      # 停止
tlbb status    # 查看状态
tlbb backup    # 备份数据库
tlbb help      # 查看全部命令
```

解压时若目标 `/home/tlbb*` 已存在，菜单会先安全停服并打包原服务端到 `/home/tlbb_backup/`，再替换为新版本。

### 国内镜像部署

默认命令使用 GitHub。国内服务器访问 GitHub 不稳定时，将完整仓库镜像到 Gitee 或自建 Git 服务，并把 `netinstall.sh` 放到同一国内站点。启动时通过 `HUANJING_REPO_URL` 指定镜像 Git 地址：

```bash
HUANJING_REPO_URL=https://gitee.com/你的命名空间/huanjing.git \
bash <(curl --progress-bar -fL https://gitee.com/你的命名空间/huanjing/raw/main/netinstall.sh)
```

脚本会显示实际镜像地址，并从该地址稀疏下载环境文件；服务端 tar 仍由你手动上传到 `/home/`，不会从镜像检出。

### 自有域名一键部署

不想维护 Git 镜像时，使用单个环境压缩包发布。维护端执行：

```bash
./pack-release.sh
```

将生成的 `dist/huanjing-env.tar.gz` 与 `bootstrap.sh` 上传到你的站点同一路径，例如 `https://dl.example.com/huanjing/`。上传前把 `bootstrap.sh` 的 `SOURCE_BASE` 改为：

```bash
SOURCE_BASE="https://dl.example.com/huanjing"
```

用户随后只需执行一条命令：

```bash
bash <(curl --progress-bar -fL https://dl.example.com/huanjing/bootstrap.sh)
```

启动脚本会显示实际下载链接，下载并解压单个环境包，然后直接进入 MySQL 与 Redis 在线安装流程。`huanjing-env.tar.gz` 仅包含安装脚本和三份数据库 SQL，不包含 MySQL RPM 或 `tlbb*` 服务端；服务端压缩包仍上传至目标机器 `/home/` 后通过 `menu.sh` 解压。

需要环境1-4时，在 `menu.sh` 选择 `9` 进入 Docker 菜单；也可以直接执行：

```bash
bash /root/huanjing/docker-env.sh install 1   # 环境1：MySQL 5.1
bash /root/huanjing/docker-env.sh install 2   # 环境2：MySQL 5.1
bash /root/huanjing/docker-env.sh install 3   # 环境3：MySQL 5.7
bash /root/huanjing/docker-env.sh install 4   # 环境4：MySQL 8.0 + 当前 SQL
# 或安装后执行
tlbb docker
```

环境1-3的数据库文件来自对应 Docker MySQL 镜像内置的 `init_db.sh`；环境4使用 `mysql-packages/` 下的三份 SQL。首次启动 Docker 菜单会询问是否安装 Docker，之后执行 `pull → up → 数据库初始化`。服务端仍需上传到 `/home`，再选择 Docker 菜单 `2 → 3 → 5`。

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
| MySQL 密码 | `LoginInfo.ini` / `CenterServerInfo.ini` / `ShareMemInfo.ini` | 所有 `*DBPassword=` 字段写入新密码 |
| Redis 密码 | `CenterServerInfo.ini` / `ServerInfo.ini` | 仅 `[Redis]` 段的 `Password=` |
| 外网 IP | `ServerInfo.ini` | `[Billing]` 的 `192.168.*` 占位替换为公网 IP（自动检测，可手输或跳过） |

全自动免交互版：

```bash
./config.sh -d /root/tlbb64 -m MySQL密码 -r Redis密码 -i 外网IP -y
```

说明：

- **按字段名定位**替换，不依赖旧密码值；`DBName`（tlbbdb_main / tlbbdb_world）与 `DBUser=root` 与本环境一致，无需修改
- 服务端配置为 **GBK + CRLF 编码**，脚本用 perl 按字节安全替换，已做字节级校验：除目标字段外全部内容原样保留
- 修改前自动备份 `Server/Config` 目录与全部启动脚本到 `tlbb64/ConfigBackup_时间.tar.gz`，回滚命令在执行结束时打印
- 服务端不在标准位置 `/home/tlbb64` 时，自动改写 `run.sh`/`stop.sh` 等脚本内置路径
- 改完重启服务端生效（`./install.sh restart`）

## 服务端日常管理

装完后**任意目录**执行全局命令 `tlbb`（等效于到安装目录跑 `./install.sh`）：

```bash
tlbb start         # 启动（ShareMemory → World → Server → Login，约1分钟）
tlbb stop          # 关闭（安全停服，各进程退出后自动打包日志到 tlbb64/logbak/）
tlbb status        # 查看四个组件进程状态
tlbb restart       # 重启
tlbb backup        # 备份三个数据库到 /root/tlbb_backup/（自动保留最近5份）
tlbb autostart on  # 开机自启（systemd，重启服务器自动拉起；off 关闭）
tlbb config        # 重新执行服务端配置向导
tlbb uninstall     # 卸载环境与全局命令
```

等价于直接执行服务端自带的 `run.sh` / `stop.sh`，但会自动定位服务端目录并统一输出格式。

> **安全组端口**：安装会监听 `0.0.0.0:3306`（MySQL）和 `0.0.0.0:6379`（Redis），云服务器还需在安全组/防火墙放行；请仅向需要连接的来源 IP 放行这两个端口。

## 安装内容（13 步全自动）

1. 配置腾讯云 YUM 镜像源（原配置自动备份到 `/etc/yum.repos.d/backup/`）
2. 安装系统依赖：perl、net-tools、libaio、zip、openssl、libnuma
3. 定位 / 解压 MySQL 安装包
4. 按依赖顺序安装 7 个 RPM（含 MySQL ODBC 驱动）
5. 启动 mysqld 并设置开机自启
6. 获取 MySQL 初始临时密码
7. 配置 root 密码、`root@%` 远程访问、`mysql_native_password` 认证插件与 MySQL TCP 监听
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
| Redis | `0.0.0.0:6379`，独立 `requirepass` 密码，已开启远程访问 |
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

## 参考的开源项目

- [yulinzhihou/gstlenv](https://github.com/yulinzhihou/gstlenv) — 天龙服务端 Docker 化自动部署（多发行版/多版本）。本项目借鉴了它的全局命令（`tlbb`）、数据库备份、Swap 自动创建与端口提示设计；本项目采用原生 RPM 部署，无 Docker 依赖。
- [GavinTan/tlbb](https://github.com/GavinTan/tlbb) — 天龙服务端环境部署（离线包方案）。
