#!/bin/bash

# description:
# log and filter the pid of the input package
#

#1.exec ps and grep yourpackage
yourpackage=$1
echo $yourpackage
psresult=`adb shell ps |grep $yourpackage`


# the output will be like below
#u0_a46 22954 1157 484320 25496 ffffffff 40067ee4 S your.package
echo $psresult


#2.parse the pid 22954
pid=`echo $psresult|awk -F ' ' '{print $2}' `
echo $pid 

#3.log and filter the pid
adb logcat -v process -v time |grep -E $pid

