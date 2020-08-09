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
