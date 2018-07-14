#!/bin/bash
STARTURL=https://4qcnktspmb.execute-api.us-east-1.amazonaws.com/dev/activation
startchain=$1
finishchain=$2
start=0
rm start
acbase="TXSCLZ"

while [[ $start -eq 0 ]]; do
  curl --silent $STARTURL -o start
  sleep 30
  source start
  echo $start
done

for i in `seq $startchain $finishchain`;
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
