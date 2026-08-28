###### stop CenterServer ######
cd /home/tlbb64/Server/ && touch exit_center.cmd
echo " CenterServer is saving data ......"

until
[ "$?" = "1" ]
do
  ps aux | grep -i "./CenterServer64" | grep -v grep >/dev/null 2>&1 
done
echo " CenterServer stoped completely !!!!!!"
