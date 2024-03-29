netsh interface portproxy add v4tov4 listenport=9092 listenaddress=0.0.0.0 connectport=9092 connectaddress=192.168.8.180

confluent local services start

kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic avro-pos-invoice-topic
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic loyalty-topic

kafka-console-consumer --bootstrap-server localhost:9092 --topic avro-pos-invoice-topic  --from-beginning --property print.key=true --property key.separator=":"
kafka-console-consumer --bootstrap-server localhost:9092 --topic loyalty-topic --from-beginning --property print.key=true --property key.separator=":"

confluent local services stop
confluent local destroy