#!/bin/bash
cd $1
num=0
num_finished=0
for i in *
do
  cd $i
  for j in *
  do
    cd $j
    let num++
    if [ -f "OUTCAR" ] ; then
        let num_finished++
    fi
    cd ..
  done
  cd ..
done
echo "There is total $num calculations in $1 folder"
echo "The finished ratio is $num_finished/$num"
