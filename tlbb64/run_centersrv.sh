ulimit -n 65535
if ps aux | grep -i "./CenterServer1" | grep -v grep >/dev/null 2>&1;then
  echo " CenterServer  is running !!!!!!"
else
	###### start CenterServer ######
	unset LD_PRELORD
  export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
  export LD_PRELOAD="/home/tlbb64/Server/libNewCenterServer.so" 
	cd /home/tlbb64/Server/ 
	rm -rf exit_center.cmd
	cd /home/tlbb64/Server/ 
	
	./CenterServer64 >/dev/null 2>&1 &
	echo " start CenterServer ......"
	sleep 5
	echo " CenterServer started completely !!!!!!"

	exit
fi