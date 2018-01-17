## Params

Preference :
```
{"<sort_order>":"<sort_param>", "precision":"<precision_val>"}
```

```
{
  "set-cluster-preferences": [
    {
      "minimize": "cores",
      "precision": 2
    },
    {
      "maximize": "freedisk",
      "precision": 100
    },
    {
      "minimize": "sysLoadAvg",
      "precision": 10
    }
  ]
}
```
sort_order = minimize,maximize
sort_param = freedisk,cores,load,heapUsage
precison = if 10 : 10gb of diffrence in free disk space is considered 0

- Array of precisions in order of priority


##Policy :
If a policy is unsatisfied, it is considered as a violation


Place Replicas Based on Node Role
Do not place any replica on a node which has the overseer role. Note that the role is added by the addRole collection API. It is not automatically the node which is currently the overseer.
```
{"replica": 0, "nodeRole": "overseer"}
```


### Steps:
1. Split all collections in the cluster, based on no of docs
2. Add replicas to all collection in the cluster, based on load expected
3. Based on indexing load on nodes, make a note of heap value and load avg
4. Set cluster preferences and cluster polices
    - 10 nodes in the solr-cloud
    - n collections on them, split based on no of docs and replicas based on load
    - policies
        - 0 replicas for 2 nodes in solr-cloud, reserved for indexing
        - 0 replicas for 1 node in solr-cloud, overseer
        - all node rules
            - place replicas on free disks
            - limit cores per nodes (differs with node quality)
5. Execute cluster suggestions to rebalance the cluster    

















