## All Preferences

## All Policy Trials
- create 10 collections 1 shard 2 replica, 5 collections 2 shards, 1 replica

### Trial 1 : Per node core limit
- 6 machines 10 collections
- set <10 per node policy
```
	curl http://localhost:8983/api/cluster/autoscaling -H 'Content-type:application/json' -d '{
	"set-cluster-policy": [
  	{"cores": "<7", "node": "#ANY"}
  	]
	}'
```

- `curl http://localhost:8983/api/cluster/autoscaling/suggestions`
- Execute Suggestions from admin panel

### Trial 2 : Same node Same shard, replica limit


### Trial 3 : Overseer node shouldn't have any cores

- `curl "localhost:8983/solr/admin/collections?action=ADDROLE&role=overseer&node=solr6:8983_solr"`

- Set policy
```
curl http://localhost:8983/api/cluster/autoscaling -H 'Content-type:application/json' -d '{
	"set-cluster-policy": [
  	{"cores": "<10", "node": "#ANY"},{"replica": 0, "nodeRole": "overseer"}
  	]
	}'
```

 - Execute Suggestions from admin panel


### Trial 4 : Storage

### Trial 5 : CPU


#### Resetting cluster policy
	curl http://localhost:8983/api/cluster/autoscaling -H 'Content-type:application/json' -d '{
	"set-cluster-policy": [
  	]
	}'


#### Tools
`curl localhost:8983/api/cluster/autoscaling`
`curl "localhost:8983/api/cluster/autoscaling/diagnostics"`



