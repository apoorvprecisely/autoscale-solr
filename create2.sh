for x in `seq 11 15`
do
i=coll$x
echo "\nCreating Collection : $i"
echo "-------------------------------------"
curl "localhost:8983/solr/admin/collections?action=CREATE&name=${i}&numShards=2&replicationFactor=1&collection.configName=_default&wt=json"
done
