#!/bin/bash
# Maintainer helper: creates the online-install environment archive for a domestic site.
set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
OUTPUT_DIR="${1:-$SCRIPT_DIR/dist}"
ARCHIVE="$OUTPUT_DIR/huanjing-env.tar.gz"

mkdir -p "$OUTPUT_DIR"
rm -f "$ARCHIVE"
tar -czf "$ARCHIVE" -C "$SCRIPT_DIR" \
    install.sh config.sh menu.sh docker-env.sh README.md \
    mysql-packages/tlbbdb_main.sql \
    mysql-packages/tlbbdb_world.sql \
    mysql-packages/web.sql

echo "已生成: $ARCHIVE"
echo "发布文件: bootstrap.sh 和 $ARCHIVE"
echo "原生模式使用在线源安装；Docker 模式使用环境1-4镜像/内置数据库初始化"
echo "服务端 tlbb* 未包含在环境包中"

# 生成 SHA256 供 bootstrap.sh 下载后校验（校验方只读第一列哈希值）
ARCHIVE_SHA="${ARCHIVE}.sha256"
sha256sum "$ARCHIVE" > "$ARCHIVE_SHA"
echo "校验文件: $ARCHIVE_SHA"
