for x in `seq 1 10`
do
i=coll$x
echo "\nCreating Collection : $i"
echo "-------------------------------------"
curl "localhost:8983/solr/admin/collections?action=CREATE&name=${i}&numShards=1&replicationFactor=2&collection.configName=_default&wt=json"
done
