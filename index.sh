data=`./genData $2`
echo $1
echo $2
echo $data
curl -X POST -H "Content-Type: application/json" "http://localhost:8982/solr/${1}/update" --data-binary "${data}"
