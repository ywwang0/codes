#!/bin/bash

# 循环嵌套条件判断
# 首先，判断文件夹中是否存在OUTCAR文件，若不存在直接提交任务
# 其次，如果OUTCAR收敛，直接跳回上层文件夹
# 最后，若存在OUTCAR，但是未收敛，同样提交任务

cd $1
for i in *
do
  cd $i
  for j in *
  do
    cd $j
    cp /lustre/home/acct-msewhw/msewhw-tc4/xkn/vasp_arm.slurms ./
    if [ ! -f "OUTCAR" ]; then
        sbatch vasp_arm.slurms; cd ..
    elif grep -q "reached required accuracy - stopping structural energy minimisation" OUTCAR; then
        cd ..
    else
        cp POSCAR_ori POSCAR
        sbatch vasp_arm.slurms; cd ..
    fi
  done
  cd ..
done
