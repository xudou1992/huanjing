# huanjing — 游戏服务器环境一键部署

CentOS Stream 9 专用：一条命令完成 **MySQL 8.0.31 + ODBC 驱动 + 三个业务数据库（tlbbdb_main / tlbbdb_world / web）+ SSL + ODBC 数据源** 的全自动安装配置。

## 目录结构

| 文件 | 说明 |
|---|---|
| `netinstall.sh` | 网络拉取版：从 GitHub 下载整包并自动执行安装（新服务器只需一条命令） |
| `install.sh` | 本地一键安装/卸载脚本 |
| `mysql-packages/` | MySQL 8.0.31 RPM 包（el9）+ 三个数据库的 SQL 备份 |
| `.gitignore` / `.gitattributes` | git 配置（忽略压缩包，脚本强制 LF 换行） |

## 环境要求

- CentOS Stream 9，root 权限
- 磁盘剩余空间 ≥ 2GB
- 网络可访问 `mirrors.tencent.com`（YUM 镜像）和 `github.com`（拉取安装包）

## 方式一：网络拉取一键安装（推荐）

在全新服务器上以 root 执行一条命令：

```bash
bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh)
```

脚本会自动下载整个环境包到 `/root/huanjing` 并开始安装，过程中只需按提示输入一次 MySQL root 密码（需输入两次确认）。

**全自动免交互版**（直接带密码，适合脚本化批量部署）：

```bash
bash <(curl -sL https://raw.githubusercontent.com/xudou1992/huanjing/main/netinstall.sh) -p 你的MySQL密码
```

## 方式二：本地一键安装

把整个目录（`install.sh` + `mysql-packages/`）上传到服务器任意目录（如 `/root/huanjing`），然后：

```bash
cd /root/huanjing
chmod +x install.sh
./install.sh              # 交互式
./install.sh -p 你的密码   # 免交互
```

- 安装包查找顺序：脚本同目录 → 当前目录 → `/home` → `/root`；`mysql-packages/` 文件夹或 `mysql-packages.tar.gz` 压缩包均可识别。
- **密码规则**：至少 4 位；不能包含 `$` `` ` `` `"` `'` 空格、反斜杠（会破坏 SQL 配置写入）。

## 安装内容（12 步全自动）

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
12. 重启 MySQL 并验证登录

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
| SSL 证书 | `/etc/mysql/ssl/` |
| 数据目录 | `/var/lib/mysql` |
| 免密登录配置 | `/root/.my.cnf`（root 本机执行 mysql 不再需要输密码） |
| 日志 | `/var/log/mysqld.log` |

## 常用命令

```bash
systemctl status mysqld        # 查看状态
systemctl restart mysqld       # 重启
mysql -uroot -p                # 登录 MySQL
mysql -uroot -p -e "SHOW DATABASES;"
cat /etc/odbc.ini              # 查看 ODBC 配置
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
