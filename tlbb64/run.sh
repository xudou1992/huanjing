ulimit -n 65535
if ps aux | grep -i "./ShareMemory1" | grep -v grep >/dev/null 2>&1;then
  echo " ShareMemory  is running !!!!!!"
else
  ###### start ShareMemory ######
  cd /home/tlbb64/Server/ 
  ./shm clear >/dev/null 2>&1
  rm -rf exit.cmd quitserver.cmd
  #echo -e "\n"
  unset LD_PRELORD
  export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
  export LD_PRELOAD="/home/tlbb64/Server/libNewShareMemory.so"
  ./shm start >/dev/null 2>&1
  #echo -e "\n"
  echo " start ShareMemory ......"

  #until  [ "$STATUS" ]
  #FILE=`ls -l -lt /home/tlbb/Server/Log/ShareMemory* | head -n 1 | awk '{print$9}' `
  #do
  #  STATUS=`tail -1 $FILE | grep "Loop...Start" | egrep -vi 'grep|tail' ` 
  #done
  
  sleep 10
  echo " ShareMemory started completely !!!!!!"
  
  unset LD_PRELORD
  export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
  export LD_PRELOAD="/home/tlbb64/Server/libNewWorld.so"
  ###### start World ###### 
  cd /home/tlbb64/Server/ 
  ./World64 >/dev/null 2>&1 &
  echo " start World ......"
  sleep 5
  echo " World started completely !!!!!!"
  unset LD_PRELORD
  ###### start Server ######
  ##内存异常捕获配置
  export ASAN_OPTIONS=halt_on_error=0:abort_on_error=0:log_path='/home/tlbb64/Server/assert_core.log'
  
  unset LD_PRELORD
  export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
  export LD_PRELOAD="/home/tlbb64/Server/libNewServer.so"
  cd /home/tlbb64/Server/
    ./Server64 >/dev/null 2>&1 &
  echo " start Server1 ......"
	
  sleep 30
  echo " Server1 started completely !!!!!!"
  #until
  #[ "$?" = "1" ]
  #do
  #  ps aux | grep -i "./Server1 -loadscriptonce" | grep -v grep >/dev/null 2>&1
  #done
  
  
  unset LD_PRELORD
  export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
  export LD_PRELOAD="/home/tlbb64/Server/libNewLogin.so" 
  ###### start Login ###### 
  ./Login64 >/dev/null 2>&1 &
  echo " start Login ......"
  sleep 1
  echo " Login1 started completely !!!!!!"

  
  exit
fi
