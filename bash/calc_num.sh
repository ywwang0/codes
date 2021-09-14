#!/bin/bash

# $1代表脚本名称之后第一个输入的变量，如bash calc_num.sh test，其中$1=test
cd $1
# 定义2个变量
num=0
num_finished=0
for i in *
do
  cd $i
  for j in *
  do
    cd $j
#     变量自增1的写法
    let num++
#     判断文件夹中是否有OUTCAR文件
    if [ -f "OUTCAR" ] ; then
        let num_finished++
    fi
    cd ..
  done
  cd ..
done
# 调用变量的过程中要加$符号
echo "There is total $num calculations in $1 folder"
echo "The finished ratio is $num_finished/$num"
