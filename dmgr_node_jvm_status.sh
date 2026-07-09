#!/bin/bash

dmgr_path=$(find /opt/IBM/ -name AboutThisProfile.txt | grep -i dmgr)

if [ -e $dmgr_path ]; then
    echo ">>>>>>>> DMGR is present and status is below."
    $(find /opt/IBM/ -name serverStatus.sh | grep -i dmgr) -all | grep -e ADMU0508I -e ADMU0509I -e stopped
else
    echo "The DMGR is not present"
fi

echo ">>>>>>>> Nodeagent and JVM status"
$(find /opt/IBM/ -name serverStatus.sh | grep -i appsrv) -all | grep -e ADMU0508I -e ADMU0509I -e stopped
