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

   alias kafka-restart='sudo systemctl restart confluentKafka'
   alias kafka-start='sudo systemctl start confluentKafka'
   alias kafka-stop='sudo systemctl stop confluentKafka'
   alias kafka-status='sudo systemctl status confluentKafka'
   alias kafka-enable='sudo systemctl enable confluentKafka'
   alias kafka-disable='sudo systemctl disable confluentKafka'
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

## [CMAK - Cluster Manager for Apache Kafka](https://github.com/yahoo/CMAK)
  - [Setting up Kafka management for kafka cluster](https://codeforgeek.com/setting-up-kafka-management-for-kafka-cluster/)
  - [kafka-manager-docker](https://github.com/hleb-albau/kafka-manager-docker)
  - [How to install Kafka Manager for Managing kafka cluster](http://manastri.blogspot.com/2020/03/how-to-install-kafka-manager-for.html)
  - [CMAK `http://localhost:9990`, instead of default port 9000](http://localhost:9990/)
```shell script
  $ $HOME/jdk14.sh
  $ $HOME/Documents/_applications/cmak-3.0.0.5/bin/cmak -Dhttp.port=9990 -Dconfig.file=$HOME/Documents/_applications/cmak-3.0.0.5/conf/application.conf -Dcmak.zkhosts="localhost:2181"
```

  - change the following in conf/application.conf
```properties
kafka-manager.zkhosts="localhost:2181"
basicAuthentication.username="admin"
basicAuthentication.password="password"
```
  - Adding new cluster in Kafka manager
```
:2181,:2181,:2181
```

## [Trifecta CLI](http://ldaniels528.github.io/trifecta/)
  - [Trifecta CLI tool that enables users to quickly and easily inspect, publish and verify messages in Kafka, Storm and Zookeeper](https://github.com/ldaniels528/trifecta/)
  - [Trifecta `http://localhost:9980`, instead of default port 8888](http://localhost:9980/)
```shell script
  $ . "$HOME/jdk8.sh"
  $ java -jar "$HOME/Documents/_applications/trifecta-bundle-0.18.13.bin.jar" --http-start -Dtrifecta.web.port=9980
```

## Kafka UI Tools
  - [Kafka Tool](http://www.kafkatool.com/download.html)

  - [KaDeck](https://www.xeotek.com/kadeck/)
    - [Docker Hub - KaDeck Web](https://hub.docker.com/r/xeotek/kadeckweb)
    - [Docker Hub - KaDeck All-In-One](https://hub.docker.com/r/xeotek/kadeck-allinone)

  - [KafDrop](https://github.com/obsidiandynamics/kafdrop)
    - [Docker Hub](https://hub.docker.com/r/obsidiandynamics/kafdrop)
    - [KafDrop in local Docker instance](http://localhost:9000/)
    
```shell script
  $ docker run -d --rm -p 9000:9000 \
      -e KAFKA_BROKERCONNECT=localhost:9092 \
      -e JVM_OPTS="-Xms32M -Xmx64M" \
      -e SERVER_SERVLET_CONTEXTPATH="/" \
      obsidiandynamics/kafdrop:latest
```

## [lensesIO - fast-data-dev](https://github.com/lensesio)
  - [fast-data-dev](https://github.com/lensesio/fast-data-dev)
  - [Docker Hub](https://hub.docker.com/r/landoop/fast-data-dev) - This includes `zookeeper` and `kafka`
  - [LensesIO Kafka Development Environment `http://localhost:3030`](http://localhost:3030/)
  - ***OR Run individual docker images (see next sections)***
    - [`schema-registry-ui` in `http://localhost:8710`](http://localhost:8710)
    - [`kafka-topics-ui` in `http://localhost:8720`](http://localhost:8720)
    - [`kafka-connect-ui` in `http://localhost:8730`](http://localhost:8730)
```shell script
  $ docker pull landoop/fast-data-dev
  $ docker run --rm --net=host lensesio/fast-data-dev
```

## [lensesIO - schema-registry-ui](https://github.com/lensesio)
  - [schema-registry-ui](https://github.com/lensesio/schema-registry-ui)
  - [Docker Hub](https://hub.docker.com/r/landoop/schema-registry-ui)
  - Running the docker image with overridden port 8710 e.g. [LensesIO schemaRegistryUI in `http://localhost:8710`](http://localhost:8710)
    - See [Docker run publish or expose port](https://docs.docker.com/engine/reference/commandline/run/#publish-or-expose-port--p---expose)
  - [Resolving lensesIO `schema-registry-ui` common issues](https://github.com/lensesio/schema-registry-ui#prerequisites)
    - [lensesIO `schema-registry-ui`](https://github.com/lensesio/schema-registry-ui)
    - [Confluent Schema Registry Configuration Options](https://docs.confluent.io/current/schema-registry/installation/config.html)
```shell script
  $ docker pull landoop/schema-registry-ui
```
```shell script
  alias confluentZookeeperStart='cd ${CONFLUENT_HOME}; bin/zookeeper-server-start etc/kafka/zookeeper.properties'
  alias confluentKafkaStart='cd ${CONFLUENT_HOME}; bin/kafka-server-start etc/kafka/server.properties'
  alias confluentSchemaStart='cd ${CONFLUENT_HOME}; bin/schema-registry-start etc/schema-registry/schema-registry.properties'
  alias dockerLensesIOSchemaUI='docker run --rm -it -p 127.0.0.1:8710:8000 -e "SCHEMAREGISTRY_URL=http://localhost:8081" landoop/schema-registry-ui'
```
```shell script
  $ confluentZookeeperStart
  $ confluentKafkaStart
  $ confluentSchemaStart
  $ dockerLensesIOSchemaUI
```

## [lensesIO - kafka-topics-ui](https://github.com/lensesio)
  - [kafka-topics-ui](https://github.com/lensesio/kafka-topics-ui)
  - [Docker Hub](https://hub.docker.com/r/landoop/kafka-topics-ui)
  - Running the docker image with overridden port 8720 e.g. [LensesIO kafkaTopicsUI in `http://localhost:8720`](http://localhost:8720)
    - See [Docker run publish or expose port](https://docs.docker.com/engine/reference/commandline/run/#publish-or-expose-port--p---expose)
  - [Resolving lensesIO `kafka-topics-ui` common issues](https://github.com/lensesio/kafka-topics-ui#common-issues)
    - [lensesIO `kafka-topics-ui`](https://github.com/lensesio/kafka-topics-ui)
    - [Confluent ReST Proxy Configuration Options](https://docs.confluent.io/current/kafka-rest/config.html)
```shell script
  $ docker pull landoop/kafka-topics-ui
```
```shell script
  alias confluentZookeeperStart='cd ${CONFLUENT_HOME}; bin/zookeeper-server-start etc/kafka/zookeeper.properties'
  alias confluentKafkaStart='cd ${CONFLUENT_HOME}; bin/kafka-server-start etc/kafka/server.properties'
  alias confluentRestStart='cd ${CONFLUENT_HOME}; bin/kafka-rest-start etc/kafka-rest/kafka-rest.properties'
  alias dockerLensesIOTopicsUI='docker run --rm -it -p 127.0.0.1:8720:8000 -e "KAFKA_REST_PROXY_URL=http://localhost:8082" -e "PROXY=false" landoop/kafka-topics-ui'
```
```shell script
  $ confluentZookeeperStart
  $ confluentKafkaStart
  $ confluentRestStart
  $ dockerLensesIOTopicsUI
```

## [lensesIO - kafka-connect-ui](https://github.com/lensesio)
  - [kafka-connect-ui](https://github.com/lensesio/kafka-connect-ui)
  - [Docker Hub](https://hub.docker.com/r/landoop/kafka-connect-ui)
  - Running the docker image with overridden port 8730 e.g. [LensesIO kafkaConnectUI in `http://localhost:8730`](http://localhost:8730)
    - See [Docker run publish or expose port](https://docs.docker.com/engine/reference/commandline/run/#publish-or-expose-port--p---expose)
  - [Resolving lensesIO `kafka-connect-ui` common issues](https://docs.confluent.io/current/kafka-rest/config.html)
    - [lensesIO `kafka-connect-ui`](https://github.com/lensesio/kafka-connect-ui)
    - [Confluent Connect Configuration Options](https://docs.confluent.io/current/connect/userguide.html)
```shell script
  $ docker pull landoop/kafka-connect-ui
```
```shell script
  alias confluentKafkaStart='cd ${CONFLUENT_HOME}; bin/kafka-server-start etc/kafka/server.properties'
  alias confluentZookeeperStart='cd ${CONFLUENT_HOME}; bin/zookeeper-server-start etc/kafka/zookeeper.properties'
  alias confluentConnectStart='cd ${CONFLUENT_HOME}; bin/connect-distributed etc/kafka/connect-distributed.properties'
  alias dockerLensesIOConnectUI='docker run --rm -it -p 127.0.0.1:8730:8000 -e "CONNECT_URL=http://localhost:8083" -e "PROXY=false" landoop/kafka-connect-ui'
```
```shell script
  $ confluentZookeeperStart
  $ confluentKafkaStart
  $ confluentConnectStart
  $ dockerLensesIOConnectUI
```

## Kafka sample commands
```shell script
# create topics
  $ kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic sample-input-topic
  $ kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic sample-output-topic

# check/describe/delete topics
  $ kafka-topics.sh --list --zookeeper localhost:2181
  $ kafka-topics.sh --list --zookeeper localhost:2181 --topic sample-input-topic
  $ kafka-topics.sh --describe --zookeeper localhost:2181 --topic sample-input-topic
  $ kafka-topics.sh --delete --zookeeper localhost:2181 --topic sample-input-topic

# start kafka producer to manually enter some data
  $ kafka-console-producer.sh --broker-list localhost:9092 --topic sample-input-topic

# enter
  > kafka hello world
  > kafka sample data processing
  > kafka the quick brown fox jumps over the lazy dog
# exit

# start kafka producer to pipe in some file
  $ kafka-console-producer.sh --broker-list localhost:9092 --topic sample-input-topic < sampleTextFile.txt

# start kafka consumer
  $ kafka-console-consumer.sh --topic sample-input-topic --bootstrap-server localhost:9092 --from-beginning

  $ kafka-console-consumer.sh -bootstrap-server localhost:9092 \
      --topic sample-input-topic \
      --from-beginning \
      --formatter kafka.tools.DefaultMessageFormatter \
      --property print.key=true \
      --property print.value=true \
      --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
      --property value.deserializer=org.apache.kafka.common.serialization.IntegerDeserializer
```

## [Confluent Platform](https://www.confluent.io/)
  - [Download](https://www.confluent.io/download/)
    - [Apache Kafka using Confluent Platform (Docker)](https://docs.confluent.io/current/quickstart/ce-docker-quickstart.html)
    - [Apache Kafka using Confluent Platform (Local)](https://docs.confluent.io/current/quickstart/ce-quickstart.html)
  - [Documentation](https://docs.confluent.io/current/)
  - [Configuration Reference](https://docs.confluent.io/current/installation/configuration/index.html)
  - [Quick Start for Apache Kafka using Confluent Platform (Local)](https://docs.confluent.io/current/quickstart/ce-quickstart.html#quick-start-for-apache-kafka-using-cp-local)
  - [CLI Command Reference](https://docs.confluent.io/current/cli/command-reference/index.html#cli-command-reference)
  - [Confluent `local` commands for single node instance locally](https://docs.confluent.io/current/cli/command-reference/confluent-local/index.html#confluent-local)
  - [Confluent `http://localhost:9021` Control Center](http://localhost:9021/clusters)
  
## [Confluent Connectors](https://www.confluent.io/hub/)
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

## Confluent Control Center and LensesIO UIs
  - [Control Center `http://localhost:9021`](http://localhost:9021/clusters)
  - [LensesIO schemaRegistryUI `http://localhost:8710`](http://localhost:8710)
  - [LensesIO kafkaTopicsUI `http://localhost:8720`](http://localhost:8720)
  - [LensesIO kafkaConnectUI `http://localhost:8730`](http://localhost:8730)
```shell script
  $ confluentControlCenterStart
  $ dockerLensesIOSchemaUI
  $ dockerLensesIOTopicsUI
  $ dockerLensesIOConnectUI
```

## Connecting Kafka to MongoDB Source
  - [How to connect Kafka to MongoDB Source](https://medium.com/tech-that-works/cloud-kafka-connector-for-mongodb-source-8b525b779772)
    - [Setting MongoDB Replica Set](https://www.youtube.com/watch?v=I6J9M0J66jo)
    - [MongoDB Kafka Connect Tutorial | Apache Kafka](https://www.youtube.com/watch?v=AF9WyW4npwY)
  - [Topic name must be in the form `logicalName.databaseName.collectionName`](https://debezium.io/documentation/reference/1.2/connectors/mongodb.html#mongodb-topic-names)
    - [Kafka Debezium Connector for MongoDB](https://debezium.io/documentation/reference/1.2/connectors/mongodb.html)
    - So in essence, create the topic name with `mongoConn.sampleGioDB.books`
      - mongodb.name = mongoConn (see connect-mongodb-source.properties)
      - db name is `sampleGioDB` (in Mongo)
      - collection name is `books` (in Mongo)
```shell script
  $ kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic mongoConn.sampleGioDB.books
  $ kafka-topics --list --zookeeper localhost:2181
  $ cd $CONFLUENT_HOME
  $ bin/connect-standalone  etc/schema-registry/connect-avro-standalone.properties  etc/kafka/connect-mongodb-source.properties  ### This worked so use this
  $ bin/connect-distributed etc/schema-registry/connect-avro-distributed.properties etc/kafka/connect-mongodb-source.properties  ### Doesn't work. Still needs to investigate why??? 
  $ kafka-console-consumer --bootstrap-server localhost:9092 --topic mongoConn.sampleGioDB.books  --from-beginning
```

## Setting up Confluent Kafka Connect Plugins such as Kafka Connector MongoDB Source
  - [Kafka connect plugin install](https://gquintana.github.io/2019/12/10/Kafka-connect-plugin-install.html)
  - [How to install connector plugins in Kafka Connect](https://rmoff.net/2020/06/19/how-to-install-connector-plugins-in-kafka-connect/)
  - Install the needed Kafka Connectors from [Confluent Kafka Connectors Hub](https://www.confluent.io/hub/). e.g.
```shell script
   $ confluent-hub install confluentinc/kafka-connect-elasticsearch:5.5.1
   $ confluent-hub install debezium/debezium-connector-mongodb:1.2.1
   $ confluent-hub install debezium/debezium-connector-mysql:1.2.1
   $ confluent-hub install mongodb/kafka-connect-mongodb:1.2.0
   $ confluent-hub install jcustenborder/kafka-connect-redis:0.0.2.11
   $ confluent-hub install hpgrahsl/kafka-connect-mongodb:1.4.0
```  
  - Create `plugins` directory under `$CONFLUENT_HOME`, then create `symlink` from `lib` directory where the `.jar` files are
```shell script
   $ cd $CONFLUENT_HOME
   $ mkdir plugins
   $ cd plugins
   $ ln -s ../share/confluent-hub-components/confluentinc-kafka-connect-elasticsearch/lib elasticsearch
   $ ln -s ../share/confluent-hub-components/debezium-debezium-connector-mongodb/lib debezium-mongodb
   $ ln -s ../share/confluent-hub-components/debezium-debezium-connector-mysql/lib debezium-mysql
   $ ln -s ../share/confluent-hub-components/mongodb-kafka-connect-mongodb/lib mongodb
   $ ln -s ../share/confluent-hub-components/jcustenborder-kafka-connect-redis/lib redis
```
  - Add the `plugins` path in the following files
    - $CONFLUENT_HOME/etc/kafka/connect-distributed.properties
    - $CONFLUENT_HOME/etc/kafka/connect-standalone.properties
    - $CONFLUENT_HOME/etc/schema-registry/connect-avro-distributed.properties
    - $CONFLUENT_HOME/etc/schema-registry/connect-avro-standalone.properties
```properties
plugin.path=$HOME/Documents/_applications/confluent-5.5.1/share/java,$HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components,$HOME/Documents/_applications/confluent-5.5.1/plugins
```
  - The above `plugins` .jar files should work but in case it didn't get added to classpath then manually add the `$CLASSPATH` to `.bashrc` e.g.
```shell script
   export CLASSPATH="$HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components/debezium-debezium-connector-mongodb/*"
```

  - To verify that Mongo is connected to Kafka flowing event stream
    - use [`Trifecta UI localhost`](http://localhost:8888/)
    - OR use [Confluent `KSql`](https://docs.ksqldb.io/en/latest/developer-guide/syntax-reference/)
      - [KSql Quick Reference](https://docs.ksqldb.io/en/latest/developer-guide/ksqldb-reference/quick-reference/)
      - [KSql Create Stream](https://docs.ksqldb.io/en/latest/developer-guide/ksqldb-reference/create-stream/)
      - [KSql Print Kafka Topic's Content](https://docs.ksqldb.io/en/latest/developer-guide/ksqldb-reference/print/)
      - alias confluentKSqlStart='cd ${CONFLUENT_HOME}; bin/ksql-server-start etc/ksqldb/ksql-server.properties'
```shell script
   $ trifectaStart
   $ confluentKSqlStart
   $ ksql
```   
```sql
   ksql> CREATE STREAM sampleGioBooks (id VARCHAR) WITH (kafka_topic='mongoConn.sampleGioDB.books', value_format='JSON');
   ksql> describe extended sampleGioBooks
   ksql> print 'mongoConn.sampleGioDB.books' from beginning;
```

## Kafka Blogs
  - [Kafka Architecture](https://dzone.com/articles/kafka-architecture)
  - [4 Key Benefits of Apache Kafka for Real-Time Data](https://business-staging.udemy.com/blog/4-key-benefits-of-apache-kafka-for-real-time-data/)
  - [Kafka Connectors Without Kafka](https://dzone.com/articles/kafka-connectors-without-kafka)
  - [Kafka Streams](https://dzone.com/articles/kafka-streams-1)
  - [Kafka Technical Overview](https://dzone.com/articles/kafka-technical-overview)
  - [Kafka Detailed Design and Ecosystem](https://dzone.com/articles/kafka-detailed-design-and-ecosystem)

## Kafka Diagrams
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
  $ confluent local start # to start `all` services
  $ confluent local start ksql-server # to start `ksql-server` service only
```
OR
```shell script
  alias confluentZookeeperStart='cd ${CONFLUENT_HOME}; bin/zookeeper-server-start etc/kafka/zookeeper.properties'
  alias confluentKafkaStart='cd ${CONFLUENT_HOME}; bin/kafka-server-start etc/kafka/server.properties'
  alias confluentKSqlStart='cd ${CONFLUENT_HOME}; bin/ksql-server-start etc/ksqldb/ksql-server.properties'
```
```shell script
  $ confluentKSqlStart
  $ ksql
```

## [Confluent Connect](https://docs.confluent.io/current/connect/userguide.html#connect-userguide)
  - [Moving Data In and Out of Kafka](https://docs.confluent.io/current/connect/quickstart.html)
  - [From Zero to Hero with Kafka Connect](https://www.youtube.com/watch?v=Jkcp28ki82k)
```shell script
  $ confluent local list
  $ confluent local start # to start `all` services
  $ confluent local start connect # to start `connect` service only
```

## [Confluent git repo](https://github.com/confluentinc)
  - [Kafka Stream Examples](https://github.com/confluentinc/kafka-streams-examples)
  - [Confluent Platform Examples](https://github.com/confluentinc/examples)  
  - [Demo Samples](https://github.com/confluentinc/demo-scene)  
  