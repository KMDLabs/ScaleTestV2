BLOCKNOTIFYURL=https://3q5g302swj.execute-api.us-east-1.amazonaws.com/v0/blocknotify
CHAIN=$1
height=1
size=1586

while true
do
  sleep $(( ( RANDOM % 90 )  + 30 ))
  time=`date +%s`
  ttl=$(( $time +600 ))
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
  -d "{ \"size\": ${size}, \"height\": ${height}, \"time\": ${time}, \"tx\": 1, \"ac\": \"${CHAIN}\", \"ttl\": ${ttl} }" \
  ${BLOCKNOTIFYURL} )
  echo $resultJSON
  if [[ $height -eq 20 ]]; then
    exit
  fi
  height=$(( $height +1 ))
done
