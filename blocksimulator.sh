#!/bin/bash
chains=$1
acbase="TXSCLZ"

for i in `seq 1 $chains`;
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
