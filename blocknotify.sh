#!/bin/bash
#echo $1 > /home/meshbits/scaletest/blocknotify.log
#KOMODOCLI=$(which komodo-cli)
RESULT=$(cat sample.txt)
#echo ${RESULT}
#echo "curl -X POST -d '${RESULT}' https://913ra6plrf.execute-api.ap-southeast-2.amazonaws.com/v0/"> blocknotify.log
#echo "">>blocknotify.log
#echo ${RESULT}>> blocknotify.log
sleep 1
curl \
--verbose \
--request OPTIONS \
https://913ra6plrf.execute-api.ap-southeast-2.amazonaws.com/v0/blocknotify \
--header 'Origin: http://localhost:8000' \
--header 'Access-Control-Request-Headers: Origin, Accept, Content-Type' \
--header 'Access-Control-Request-Method: POST'
sleep 2
curl \
--verbose \
--header "Origin: http://localhost:8000" \
--request POST \
--data "${RESULT}" \
https://913ra6plrf.execute-api.ap-southeast-2.amazonaws.com/v0/blocknotify

#-d "{ \"hash\": \"000f8e62ce2cbb1c644fb298e08d27fcb02c3f85d45ce439c03e0be2d707108c\", \"confirmations\": 1, \"size\": 1588, \"height\": 11334, \"version\": 4, \"merkleroot\": \"ba42b1928ce2b394d2bd65f69e4b74acec55f3d36693545c46c5375f307937ab\", \"tx\": [ \"ba42b1928ce2b394d2bd65f69e4b74acec55f3d36693545c46c5375f307937ab\" ], \"time\": 1526634118, \"nonce\": \"0000a68114987c9870857a2b8e60175d84ddaa516aa61e7be8a761ef79640009\"}" \


----------------------------------------------------

what happens on creation of the record is in https://github.com/imylomylo/scaletest-blocknotify/blob/master/blocknotify/create.js (edited)
data is the block in json ${RESULT} from that script above.
so to get txcount from your cli output of komodo-cli getblock <theblockhash> you just save data.txcount
ditto for data.blockhash
once i get some psuedo-explorer code written, the next step is another script on blocknotify to query all the tx in that block to post in one go.  so if there's 557 tx, query each of those tx within 20-30 seconds if possible as late as 50s.
reckon komodo-cli -ac_name=TXSCL gettransaction <txhash> can do 10 per second to populate the psuedo-explorer?
if not, can use a non-mining node that syncs, and just use that as the interrogation->postingInfo node to make the psuedo explorer work.data can be stored in blockchain for examination after the fact with scripts to reproduce psuedo explorer i guess....
