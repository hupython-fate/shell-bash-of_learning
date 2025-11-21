#!/bin/bash
a=10
b=20
as=`expr $a + $b`  #expr要求运算符两边必须有空格.
echo "a+b:$as"

as1=`expr $a - $b` #等号后面不能有空格.
echo "a-b:$as1"

as2=`expr $a \* $b` #乘法符号需要转义,因为在shell中,*是通配符.
echo "a * b :$as2"

as3=`expr $a / $b`
echo "a / b:$as3"

as4=`expr $a % $b`
echo "a % b:$as4"
 
