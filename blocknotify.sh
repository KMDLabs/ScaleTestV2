#!/bin/bash
source chain
if [ "$chain" = "" ]
  then
    chain=$(ls ~/.komodo/)
    echo "chain=$chain" > chain
fi

HEIGHT=$(./getblockcount)

if [ "$HEIGHT" = "3" ]
  then
    ./importprivkey
    ./startMM
fi

if [ "$HEIGHT" = "5" ]
  then
    TXID=$(./sendfunds)
    echo "TXID=$TXID" > TXID
fi

if [ "$HEIGHT" = "8" ]
  then
   ./TxBlast
fi

