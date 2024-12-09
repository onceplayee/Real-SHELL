#!/bin/bash

if [ -z "$1" ];then
    echo "帮助信息：请键入I0或者SQL"
    exit 99
fi

case "$1" in
    IO)
STATE=$(mysql -uroot -pMqt3090786752! -e "show slave status\G" 2> /dev/null | grep -w "Slave_IO_Running:" | awk '{print $2}')

if [ "${STATE}" == "Yes" ];then
     echo "正常"
else
     echo "错误"
fi
;;
     SQL)
STATE=$(mysql -uroot -pMqt3090786752! -e "show slave status\G" 2> /dev/null | grep -w "Slave_SQL_Running:" | awk '{print $2}')

if [ "${STATE}" == "Yes" ];then
    echo "正常"
else
    echo "错误"
fi
;;
esac
