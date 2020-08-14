- [Apache ZooKeeper - Centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services](https://zookeeper.apache.org/)
  - [Documentation](https://zookeeper.apache.org/doc/r3.5.5/)

- [Apache Kafka - Distributed Streaming Platform](https://kafka.apache.org/)
  - [Quick Start](https://kafka.apache.org/quickstart)
  - [Introduction](https://kafka.apache.org/intro)
  - [How To Install Apache Kafka on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-18-04)

- Installing `kafka` in `Ubuntu 18.04 x64`
  - [Download the binary](https://kafka.apache.org/downloads)

```bash
   $ tar xvzf kafka_2.12-2.3.0.tgz
   $ mv ~/Downloads/kafka_2.12-2.3.0 ~/Documents/_applications/
```

- Add these settings to `.bashrc` for personal preference

```bash
   export APPLICATIONS_HOME="${HOME}/Documents/_applications"
   export KAFKA_HOME="${APPLICATIONS_HOME}/kafka_2.12-2.3.0"
   export KAFKA_BIN="${KAFKA_HOME}/bin"
   export KAFKA_CONFIG="${KAFKA_HOME}/config"

   alias kafka-restart='sudo systemctl restart kafka'
   alias kafka-start='sudo systemctl start kafka'
   alias kafka-stop='sudo systemctl stop kafka'
   alias kafka-status='sudo systemctl status kafka'
   alias kafka-enable='sudo systemctl enable kafka'
   alias kafka-disable='sudo systemctl disable kafka'
```

- Configure to start `kafka` automatically with the server

```bash
   $ sudo cp kafka.service /etc/systemd/system
   $ sudo cp zookeepr.service /etc/systemd/system
```

- Update the `systemd` service after copying `kafka/zookeeper` services 

```bash
   $ sudo systemctl daemon-reload
```

- Enable to auto-start `kafka` service

```bash
   $ kafka-enable
```

- Start/Re-Start `kafka` service

```bash
   $ kafka-start
   $ kafka-restart
```

- Check `kafka` version (OR `sudo systemctl status kafka`)

```bash
   $ kafka-status
```

- Kafka UI Tools
  - [Kafka Tool](http://www.kafkatool.com/download.html)

  - [CMAK - Cluster Manager for Apache Kafka](https://github.com/yahoo/CMAK)

  - [KaDeck](https://www.xeotek.com/kadeck/)
    - [Docker Hub - KaDeck Web](https://hub.docker.com/r/xeotek/kadeckweb)
    - [Docker Hub - KaDeck All-In-One](https://hub.docker.com/r/xeotek/kadeck-allinone)

  - [KafDrop](https://github.com/obsidiandynamics/kafdrop)
    - [Docker Hub](https://hub.docker.com/r/obsidiandynamics/kafdrop)
    - [KafDrop in local Docker instance](http://localhost:9000/)
    
```shell script
docker run -d --rm -p 9000:9000 \
    -e KAFKA_BROKERCONNECT=localhost:9092 \
    -e JVM_OPTS="-Xms32M -Xmx64M" \
    -e SERVER_SERVLET_CONTEXTPATH="/" \
    obsidiandynamics/kafdrop:latest
```

- Kafka sample commands
```shell script
# create input/output topics
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic sample-input-topic

bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic sample-output-topic

# check/describe the topics created
bin/kafka-topics.sh --list --zookeeper localhost:2181 --topic sample-input-topic

bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic sample-input-topic

bin/kafka-topics.sh --delete --zookeeper localhost:2181 --topic sample-input-topic

# start kafka producer to manually enter some data
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic sample-input-topic

# enter
kafka hello world
kafka sample data processing
kafka the quick brown fox jumps over the lazy dog
# exit

# start kafka producer to pipe in some file
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic sample-input-topic < sampleTextFile.txt

# start kafka consumer
bin/kafka-console-consumer.sh --topic sample-input-topic --bootstrap-server localhost:9092 --from-beginning

bin/kafka-console-consumer.sh -bootstrap-server localhost:9092 \
    --topic sample-input-topic \
    --from-beginning \
    --formatter kafka.tools.DefaultMessageFormatter \
    --property print.key=true \
    --property print.value=true \
    --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --property value.deserializer=org.apache.kafka.common.serialization.IntegerDeserializer
```

- [Confluent Platform](https://www.confluent.io/)
  - [Download](https://www.confluent.io/download/)
    - [Apache Kafka using Confluent Platform (Docker)](https://docs.confluent.io/current/quickstart/ce-docker-quickstart.html)
    - [Apache Kafka using Confluent Platform (Local)](https://docs.confluent.io/current/quickstart/ce-quickstart.html)
  - [Documentation](https://docs.confluent.io/current/)
  - [Configuration Reference](https://docs.confluent.io/current/installation/configuration/index.html)
  - [Quick Start for Apache Kafka using Confluent Platform (Local)](https://docs.confluent.io/current/quickstart/ce-quickstart.html#quick-start-for-apache-kafka-using-cp-local)
  - [CLI Command Reference](https://docs.confluent.io/current/cli/command-reference/index.html#cli-command-reference)
  - [Confluent `local` commands for single node instance locally](https://docs.confluent.io/current/cli/command-reference/confluent-local/index.html#confluent-local)
  - [Confluent `localhost` Control Center](http://localhost:9021/clusters)
  
- [Confluent Connectors](https://www.confluent.io/hub/)
  - [MongoDB](https://www.confluent.io/hub/mongodb/kafka-connect-mongodb)
    - [Getting Started with the MongoDB Connector for Apache Kafka and MongoDB](https://www.confluent.io/blog/getting-started-mongodb-connector-for-apache-kafka-and-mongodb/)
  - [Elastic Search](https://www.confluent.io/hub/confluentinc/kafka-connect-elasticsearch)
    - [Kafka Connect Elasticsearch Connector in Action](https://www.confluent.io/blog/kafka-elasticsearch-connector-tutorial/)
  - [Redis](https://www.confluent.io/hub/jcustenborder/kafka-connect-redis)
  - [MySQL](https://www.confluent.io/hub/debezium/debezium-connector-mysql)
  - [RabbitMQ](https://www.confluent.io/hub/confluentinc/kafka-connect-rabbitmq) `(Commercial License)`

- [Confluent Platform Logs](https://docs.confluent.io/current/cli/command-reference/confluent-local/index.html#confluent-local) are in
```shell script
/tmp/confluent.0YtCGnLS/
```

- Kafka Blogs
  - [Kafka Architecture](https://dzone.com/articles/kafka-architecture)
  - [4 Key Benefits of Apache Kafka for Real-Time Data](https://business-staging.udemy.com/blog/4-key-benefits-of-apache-kafka-for-real-time-data/)
  - [Kafka Connectors Without Kafka](https://dzone.com/articles/kafka-connectors-without-kafka)
  - [Kafka Streams](https://dzone.com/articles/kafka-streams-1)
  - [Kafka Technical Overview](https://dzone.com/articles/kafka-technical-overview)
  - [Kafka Detailed Design and Ecosystem](https://dzone.com/articles/kafka-detailed-design-and-ecosystem)

- Kafka Diagrams
  - Multiple Integrations
    ![Multiple Integrations](images/multiple-integrations-before.jpg?raw=true)
  
  - Multiple Integrations with Kafka
    ![Multiple Integrations with Kafka](images/multiple-integrations-after.jpg?raw=true)  
  
  - Kafka Connect
    ![Kafka Connect](images/kafka-connect-image.png?raw=true)  
  
    ![Kafka Connect](images/kafka-connect-3.jpg?raw=true)  
  
    ![Kafka Connect](images/kafka-connect-2.jpg?raw=true)  
  
    ![Kafka Streaming ETL](images/kafka_streaming_etl.png?raw=true)  
  
- [ksql - Stream SQL Engine for Apache Kafka](https://github.com/confluentinc/ksql)
  - [ksqlDB and Kafka Streams](https://docs.confluent.io/current/streams-ksql.html)
  - [Introduction to ksqlDB](https://www.youtube.com/watch?v=7mGBxG2NhVQ)
  - [ksqlDB Tutorial](https://docs.ksqldb.io/en/latest/tutorials/)
  - [ksqlDB Quickstart](https://ksqldb.io/quickstart.html)
  - [Confluent local](https://docs.confluent.io/current/cli/command-reference/confluent-local/index.html#confluent-local)
  - [Starting the ksqlDB Server](https://docs.confluent.io/current/ksqldb/installing.html#start-ksql-server)
```shell script
$ confluent local list

$ confluent local start ksql-server
```
OR
```shell script
$ bin/ksql-server-start etc/ksqldb/ksql-server.properties

$ ksql
```

- [Confluent Connect](https://docs.confluent.io/current/connect/userguide.html#connect-userguide)
  - [Moving Data In and Out of Kafka](https://docs.confluent.io/current/connect/quickstart.html)
  - [From Zero to Hero with Kafka Connect](https://www.youtube.com/watch?v=Jkcp28ki82k)
```shell script
$ confluent local list

$ confluent local start connect
```

- [Confluent git repo](https://github.com/confluentinc)
  - [Kafka Stream Examples](https://github.com/confluentinc/kafka-streams-examples)
  - [Confluent Platform Examples](https://github.com/confluentinc/examples)  
  - [Demo Samples](https://github.com/confluentinc/demo-scene)  
  