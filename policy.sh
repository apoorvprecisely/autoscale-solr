curl http://localhost:8983/api/cluster/autoscaling -H 'Content-type:application/json' -d '{
"set-cluster-policy": [
  {"replica": "0", "node": "172.18.0.2:8983_solr"}
  ]
}'