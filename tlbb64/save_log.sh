###### transfer logs ######
DIR=`date +%Y%m%d-%H%M`
# 使用 mkdir -p 命令创建一个新目录，路径为 /home/tlbb/logbak/$DIR
# -p 选项确保在目标目录不存在时自动创建所有上级目录
mkdir -p /home/tlbb/logbak/$DIR
# 将 /home/tlbb/Server/Log/ 目录下的所有文件移动到刚创建的目录中
mv /home/tlbb/Server/Log/* /home/tlbb/logbak/$DIR
# 进入备份目录
cd /home/tlbb/logbak
# 将刚创建的目录打包为 gz 压缩包
tar -czf $DIR.tar.gz $DIR
# 删除未压缩的目录
rm -rf $DIR
# echo log
echo "Log transfer and compression to /home/tlbb/logbak/ completely !!!!!!"
