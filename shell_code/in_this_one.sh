#!/bin/bash
echo "hello shell world!"
my_name="hu"
echo "hello $my_name"
echo "hello ${my_name}"

#常量
readonly name="hu cheng jian"

#删除变量
unset name

#特殊变量(重要)
echo "脚本名:$0"#$0是什么意思?
echo "第一个参数:$1"
echo "参数个数:$#"
echo "所有参数:$@"
echo "上条命令退出状态:$?"#0表示成功,非常0表示失败.

#条件判断:
if [$age -gt 18];then
	echo "成年人"
elif [$age -gt 12];then
	echo "青少年"
else
    echo "儿童"
fi


# 数字比较
[ $a -eq $b ]  # 等于 equal
[ $a -ne $b ]  # 不等于 not equal
[ $a -gt $b ]  # 大于 greater than
[ $a -lt $b ]  # 小于 less than

# 字符串比较
[ "$str1" = "$str2" ]
[ "$str1" != "$str2" ]
[ -z "$str" ]    # 字符串为空
[ -n "$str" ]    # 字符串非空

# 文件测试
[ -f "file.txt" ]  # 是普通文件
[ -d "dir" ]       # 是目录
[ -e "file" ]      # 文件存在

# for循环
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

for file in *.txt; do
    echo "Processing: $file"
done

# while循环
count=1
while [ $count -le 5 ]; do
    echo "Count: $count"
    count=$((count + 1))
done


# 执行命令并获取输出
current_time=$(date)        # 推荐写法
current_time=`date`         # 传统写法

# 检查命令是否执行成功
if grep "pattern" file.txt; then
    echo "找到匹配内容"
else
    echo "未找到匹配内容"
fi



# 定义函数
greet() {
    local name=$1    # 局部变量
    echo "Hello, $name"
    return 0
}

# 调用函数
greet "Alice"



#!/bin/bash

set -euo pipefail  # 严格模式：错误退出、未定义变量报错、管道错误

usage() {
    echo "用法: $0 [选项] 参数"
    exit 1
}

main() {
    local input_file=""

    # 参数解析
    while [[ $# -gt 0 ]]; do
        case $1 in
            -f|--file)
                input_file="$2"
                shift 2
                ;;
            -h|--help)
                usage
                ;;
            *)
                echo "未知参数: $1"
                usage
                ;;
        esac
    done

    # 参数检查
    if [[ -z "$input_file" ]]; then
        echo "错误: 必须指定输入文件"
        usage
    fi

    if [[ ! -f "$input_file" ]]; then
        echo "错误: 文件不存在: $input_file"
        exit 1
    fi

    # 主逻辑
    process_file "$input_file"
}

process_file() {
    local file="$1"
    echo "处理文件: $file"
    # 你的处理逻辑
}

# 脚本入口
main "$@"



man bash          # Bash手册
help test         # 测试命令帮助
