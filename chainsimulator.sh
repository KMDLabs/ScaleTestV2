BLOCKNOTIFYURL=https://3q5g302swj.execute-api.us-east-1.amazonaws.com/v0/blocknotify
CHAIN=$1
height=1
size=1999029
source start

now=$(( $(date +%s) -$(( $RANDOM % 60 + 1 )) ))
sleep $(( $start -$now ))

while true
do
  time=`date +%s`
  ttl=$(( $time +300 ))
  curl \
  --silent \
  --request OPTIONS \
  ${BLOCKNOTIFYURL} \
  --header 'Origin: http://localhost:8000' \
  --header 'Access-Control-Request-Headers: Origin, Accept, Content-Type' \
  --header 'Access-Control-Request-Method: POST'
  sleep 1
  resultJSON=$(curl \
  --silent \
  --header "Origin: http://localhost:8000" \
  --request POST \
  -d "{ \"size\": ${size}, \"height\": ${height}, \"time\": ${time}, \"tx\": 8859, \"ac\": \"${CHAIN}\", \"ttl\": ${ttl} }" \
  ${BLOCKNOTIFYURL} )
  echo $resultJSON
  if [[ $height -eq 60 ]]; then
    exit
  fi
  height=$(( $height +1 ))
  sleep $(( ( RANDOM % 60 )  + 30 ))
done
