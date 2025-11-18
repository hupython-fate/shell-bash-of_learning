#!/bin/bash

echo 开始猜数字!
shu=$(shuf -i 1-10 -n 1)
# while [[ $guess -ne $shu ]]
while true
do
read -p "请输入一个1～10之间的数" guess
if [[ $guess -eq $shu ]];then
	echo 猜对了，恭喜你!
	echo "请问是否继续?(y/n)"
	read kkk
	if [[ $kkk = 'y' ]] || [[ $kkk = 'Y' ]];then
		shu=$((RANDOM %10 +1))
		continue
	else 
		break
	fi
elif [[ $guess -lt $shu ]];then #-lt是小于号
	echo 小了。
else
	echo 大了。
fi
done

