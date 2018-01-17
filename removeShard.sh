#curl "localhost:8983/solr/admin/collections?action=SPLITSHARD&collection=${1}&shard=${2}"
curl "localhost:8983/solr/admin/collections?action=DELETESHARD&shard=$2&collection=${1}"
