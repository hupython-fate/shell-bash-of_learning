#!/bin/bash

#生成随机数的命令
shu=$(shuf -i 1-10 -n 1)
#这是命令替换的语法.
#也许可以用bash把c语言的编程题再做一遍.
#-i后面的是生成随机数的范围,-n后面的是生成随机数的个数
echo "欢迎来到猜数字游戏."
while true
do
echo 请输入一个在1~10内的数:
read guess
if [[ $shu -eq $guess ]]; then  #-eq是等于号.
	echo "恭喜你,猜对了,是否继续?(y/n)"
	read kk
	if [[ $kk = "y" ]] || [[ $kk = "Y" ]]; then #=号是字符串比较符,而-eq是数值比较运算符.$kk和n都是字符串,所以要用=
		shu=$((RANDOM % 10 +1))
		continue
	else
		break
	fi
elif [[ $shu -lt $guess ]]; then
	echo "大了!" #-lt是小于号,-gt是大于号;
else
	echo "小了!"
fi
done 
#do表示wheil循环的开始,done表示while循环的结束.
