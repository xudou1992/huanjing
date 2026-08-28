ulimit -n 65535
if ps aux | grep -i "./ShareMemory" | grep -v grep >/dev/null 2>&1;then
  echo " ShareMemory  is running !!!!!!"
else
  ###### start ShareMemory ######
  cd /home/tlbb/Server/ 
  ./shm clear >/dev/null 2>&1
  rm -rf exit.cmd quitserver.cmd
  #echo -e "\n"
  ./shm start >/dev/null 2>&1
  #echo -e "\n"
  echo " start ShareMemory ......"

  sleep 10
  echo " ShareMemory started completely !!!!!!"

  ###### start World ######
  cd /home/tlbb/Server/ 
  ./World >/dev/null 2>&1 &
  echo " start World ......"
  sleep 5
  echo " World started completely !!!!!!"

  ###### start Server ######
  ##内存异常捕获配置
  export ASAN_OPTIONS=halt_on_error=0:abort_on_error=0:log_path='/home/tlbb/Server/assert_core.log'
  
  cd /home/tlbb/Server/
    ./Server >/dev/null 2>&1 &
  echo " start Server ......"
	
  sleep 30
  echo " Server started completely !!!!!!"
  
  exit
fi
