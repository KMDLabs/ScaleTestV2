#!/bin/bash
start=$1
finish=$2
acbase="TXSCLZ"

for i in `seq $start $finish`;
do
  CHAIN=`echo "obase=16;  ${i}" | bc`
  if [ ${i} -lt 16 ]; then
    ac="${acbase}00"
  elif [[ ${i} -lt  256 ]]; then
    ac="${acbase}0"
  else
    ac="${acbase}"
  fi
  CHAIN=${ac}${CHAIN}
  echo $CHAIN
  ./chainsimulator.sh $CHAIN &
done
