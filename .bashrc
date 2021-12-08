# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# NVM 
# ubuntu nvm install
# https://github.com/nvm-sh/nvm
# https://tecadmin.net/how-to-install-nvm-on-ubuntu-20-04/
# https://asibin99.medium.com/how-to-use-node-version-manager-nvm-on-ubuntu-20-04-fa71c9929f51
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04
# https://hackernoon.com/how-to-install-node-js-on-ubuntu-16-04-18-04-using-nvm-node-version-manager-668a7166b854
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Applications
export APPLICATIONS_HOME="${HOME}/Documents/_applications"
alias vpn='/opt/cisco/anyconnect/bin/vpn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

# Java
export JDK8_HOME="${APPLICATIONS_HOME}/amazon-corretto-8.252.09.1-linux-x64"
export JDK17_HOME="${APPLICATIONS_HOME}/openjdk-17.0.1"

#export JAVA_HOME="${JDK17_HOME}"
#export JAVA_BIN="${JAVA_HOME}/bin"
export JVM_ARGS="-Xms512m -Xmx1024m -XX:MaxPermSize=512m"

# Scala
# https://www.scala-lang.org/download/
export SCALA_HOME="${APPLICATIONS_HOME}/scala-2.13.6"
export SCALA_BIN="${SCALA_HOME}/bin"

# SBT
# https://www.scala-sbt.org/download.html
export SBT_HOME="${APPLICATIONS_HOME}/sbt-1.3.10"
export SBT_BIN="${SBT_HOME}/bin"

# Stack Haskell
# https://docs.haskellstack.org/en/stable/install_and_upgrade/
export GHC_HOME="${APPLICATIONS_HOME}/ghc-8.0.2"
export STACK_HOME="${APPLICATIONS_HOME}/stack-1.9.3-linux-x86_64"
export STACK_BIN="${STACK_HOME}"

# Gradle
# https://gradle.org/install/
export GRADLE_HOME="${APPLICATIONS_HOME}/gradle-6.5"
export GRADLE_BIN="${GRADLE_HOME}/bin"

# Groovy
# http://groovy-lang.org/download.html
export GROOVY_HOME="${APPLICATIONS_HOME}/groovy-3.0.4"
export GROOVY_BIN="${GROOVY_HOME}/bin"

# Tomcat
# https://tomcat.apache.org/
# https://tomcat.apache.org/download-80.cgi
export TOMCAT_HOME="${APPLICATIONS_HOME}/apache-tomcat/apache-tomcat-8.0.8"
export TOMCAT_LIB="${TOMCAT_HOME}\bin"

# IntelliJ Idea
export INTELLIJ_HOME="${APPLICATIONS_HOME}/idea-IU-202.6948.69"
export INTELLIJ_LIB="${INTELLIJ_HOME}/bin"
export INTELLIJ_ARGS="-Xms1024m -Xmx2048m -XX:MaxPermSize=512m"
alias intellij='"${INTELLIJ_LIB}"/idea.sh;'

# IntelliJ Webstorm
export WEBSTORM_HOME="${APPLICATIONS_HOME}/WebStorm-193.6494.34"
export WEBSTORM_LIB="${WEBSTORM_HOME}/bin"
export WEBSTORM_ARGS="-Xms1024m -Xmx2048m -XX:MaxPermSize=512m"
alias webstorm='"${WEBSTORM_LIB}"/webstorm.sh;'

# IntelliJ PyCharm
export PYCHARM_HOME="${APPLICATIONS_HOME}/pycharm-2019.3.3"
export PYCHARM_LIB="${PYCHARM_HOME}/bin"
export PYCHARM_ARGS="-Xms1024m -Xmx2048m -XX:MaxPermSize=512m"
alias pycharm='"${PYCHARM_LIB}"/pycharm.sh;'

# NodeJS
# ubuntu nodejs install
# https://nodejs.org/en/download/package-manager/
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
export NODEJS_HOME="${APPLICATIONS_HOME}/node-v10.15.2-linux-x64"
export NODEJS_LIB="${NODEJS_HOME}/bin"
alias nodejs='"${NODEJS_LIB}"/node;'

#stylish-haskell
export STYLISH_HASKELL="${HOME}/.local/bin"

# ElasticSearch
# https://www.elastic.co/
export ELASTIC_SEARCH_HOME="${APPLICATIONS_HOME}/elasticsearch-6.4.3"
export ELASTIC_SEARCH_BIN="${ELASTIC_SEARCH_HOME}/bin"

alias elasticsearch-restart='sudo systemctl restart elasticsearch.service'
alias elasticsearch-start='sudo systemctl start elasticsearch.service'
alias elasticsearch-stop='sudo systemctl stop elasticsearch.service'
alias elasticsearch-status='sudo systemctl status elasticsearch.service'
alias elasticsearch-enable='sudo systemctl enable elasticsearch.service'
alias elasticsearch-disable='sudo systemctl disable elasticsearch.service'

# Kibana
# https://www.elastic.co/downloads/
export KIBANA_HOME="${APPLICATIONS_HOME}/kibana-6.4.3"
export KIBANA_BIN="${KIBANA_HOME}/bin"

alias kibana-restart='sudo systemctl restart kibana.service'
alias kibana-start='sudo systemctl start kibana.service'
alias kibana-stop='sudo systemctl stop kibana.service'
alias kibana-status='sudo systemctl status kibana.service'
alias kibana-enable='sudo systemctl enable kibana.service'
alias kibana-disable='sudo systemctl disable kibana.service'

# Logstash
# https://www.elastic.co/downloads/
export LOGSTASH_HOME="${APPLICATIONS_HOME}/logstash-6.4.3"
export LOGSTASH_BIN="${LOGSTASH_HOME}/bin"

alias logstash-restart='sudo systemctl restart logstash.service'
alias logstash-start='sudo systemctl start logstash.service'
alias logstash-stop='sudo systemctl stop logstash.service'
alias logstash-status='sudo systemctl status logstash.service'
alias logstash-enable='sudo systemctl enable logstash.service'
alias logstash-disable='sudo systemctl disable logstash.service'

# Confluent Kafka
# https://www.confluent.io/download/#
# https://docs.confluent.io/current/
# https://docs.confluent.io/current/quickstart/ce-quickstart.html
# https://docs.confluent.io/current/installation/cli-reference.html
# https://docs.confluent.io/current/cli/command-reference/confluent-local/index.html#confluent-local
# https://docs.confluent.io/current/cli/command-reference/confluent-local/confluent_local_start.html
export CONFLUENT_HOME="${APPLICATIONS_HOME}/confluent-5.5.1"
export CONFLUENT_BIN="${CONFLUENT_HOME}/bin"
alias confluentLocalStart='cd ${CONFLUENT_BIN}; ./confluent local start'
alias confluentLocalStop='cd ${CONFLUENT_BIN}; ./confluent local stop'
alias confluentLocalDestroy='cd ${CONFLUENT_BIN}; ./confluent local destroy'
alias confluentKafkaStart='cd ${CONFLUENT_HOME}; bin/kafka-server-start etc/kafka/server.properties'
alias confluentKafkaStop='cd ${CONFLUENT_HOME}; bin/kafka-server-stop etc/kafka/server.properties'
alias confluentZookeeperStart='cd ${CONFLUENT_HOME}; bin/zookeeper-server-start etc/kafka/zookeeper.properties'
alias confluentZookeeperStop='cd ${CONFLUENT_HOME}; bin/zookeeper-server-stop etc/kafka/zookeeper.properties'
alias confluentSchemaStart='cd ${CONFLUENT_HOME}; bin/schema-registry-start etc/schema-registry/schema-registry.properties'
alias confluentSchemaStop='cd ${CONFLUENT_HOME}; bin/schema-registry-stop etc/schema-registry/schema-registry.properties'
alias confluentKSqlStart='cd ${CONFLUENT_HOME}; bin/ksql-server-start etc/ksqldb/ksql-server.properties'
alias confluentKSqlStop='cd ${CONFLUENT_HOME}; bin/ksql-server-stop etc/ksqldb/ksql-server.properties'
alias confluentRestStart='cd ${CONFLUENT_HOME}; bin/kafka-rest-start etc/kafka-rest/kafka-rest.properties'
alias confluentRestStop='cd ${CONFLUENT_HOME}; bin/kafka-rest-stop etc/kafka-rest/kafka-rest.properties'
alias confluentControlCenterStart='cd ${CONFLUENT_HOME}; bin/control-center-start etc/confluent-control-center/control-center-dev.properties'
alias confluentControlCenterStop='cd ${CONFLUENT_HOME}; bin/control-center-stop etc/confluent-control-center/control-center-dev.properties'
alias confluentConnectStart='cd ${CONFLUENT_HOME}; bin/connect-distributed etc/kafka/connect-distributed.properties'
alias confluentConnectSAStart='cd ${CONFLUENT_HOME}; bin/connect-standalone etc/kafka/connect-standalone.properties'
alias confluentConnectMongoStart='cd ${CONFLUENT_HOME}; bin/connect-distributed etc/schema-registry/connect-avro-distributed-mongodb-source.properties etc/kafka/connect-mongodb-source.properties'
alias confluentConnectMongoSAStart='cd ${CONFLUENT_HOME}; bin/connect-standalone etc/schema-registry/connect-avro-standalone-mongodb-source.properties etc/kafka/connect-mongodb-source.properties'
alias confluentConnectElasticStart='cd ${CONFLUENT_HOME}; bin/connect-distributed etc/schema-registry/connect-avro-distributed-elasticsearch-sink.properties etc/kafka-connect-elasticsearch/connect-elasticsearch-sink.properties'
alias confluentConnectElasticSAStart='cd ${CONFLUENT_HOME}; bin/connect-standalone etc/schema-registry/connect-avro-standalone-elasticsearch-sink.properties etc/kafka-connect-elasticsearch/connect-elasticsearch-sink.properties'

alias dockerLensesIOFastDataDev='docker run --rm --net=host lensesio/fast-data-dev'
alias dockerLensesIOSchemaUI='docker run --rm -it -p 127.0.0.1:8710:8000 -e "SCHEMAREGISTRY_URL=http://localhost:8081" landoop/schema-registry-ui'
alias dockerLensesIOTopicsUI='docker run --rm -it -p 127.0.0.1:8720:8000 -e "KAFKA_REST_PROXY_URL=http://localhost:8082" -e "PROXY=false" landoop/kafka-topics-ui'
alias dockerLensesIOConnectUI='docker run --rm -it -p 127.0.0.1:8730:8000 -e "CONNECT_URL=http://localhost:8083" -e "PROXY=false" landoop/kafka-connect-ui'

# Kafka
# ubuntu kafka install
# https://kafka.apache.org/
# https://kafka.apache.org/quickstart
# https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-18-04
export KAFKA_HOME="${APPLICATIONS_HOME}/kafka_2.12-2.5.0"
export KAFKA_BIN="${KAFKA_HOME}/bin"
export KAFKA_CONFIG="${KAFKA_HOME}/config"

alias zooKeeperStart='cd ${KAFKA_HOME}; bin/zookeeper-server-start.sh config/zookeeper.properties'
alias zooKeeperStop='cd ${KAFKA_HOME}; bin/zookeeper-server-stop.sh config/zookeeper.properties'

alias kafkaStart='cd ${KAFKA_HOME}; bin/kafka-server-start.sh config/server.properties'
alias kafkaStop='cd ${KAFKA_HOME}; bin/kafka-server-stop.sh config/server.properties'

# Configure to start automatically with the server
# cp kafka.service to /etc/systemd/system
# cp zookeeper.service to /etc/systemd/system
alias kafka-restart='sudo systemctl restart zookeeper.service confluentKafka.service'
alias kafka-start='sudo systemctl start zookeeper.service confluentKafka.service'
alias kafka-stop='sudo systemctl stop zookeeper.service confluentKafka.service'
alias kafka-status='sudo systemctl status zookeeper.service confluentKafka.service'
alias kafka-enable='sudo systemctl enable zookeeper.service confluentKafka.service'
alias kafka-disable='sudo systemctl disable zookeeper.service confluentKafka.service'

# kafka trifecta UI
# http://ldaniels528.github.io/trifecta/
alias trifectaStart="java -jar "$APPLICATIONS_HOME/trifecta-bundle-0.18.13.bin.jar" --http-start"

# kafka yahoo CMAK (Cluster Manager for Kafka)
# https://github.com/yahoo/CMAK
export KAFKA_CMAK_HOME="${APPLICATIONS_HOME}/cmak-3.0.0.5"
export KAFKA_CMAK_BIN="${KAFKA_CMAK_HOME}/bin"
alias cmakStart="$HOME/cmak.sh"

# kafka ui console
# http://www.kafkatool.com/download.html
export KAFKA_TOOL_HOME="${APPLICATIONS_HOME}/kafkatool2"
export KAFKA_TOOL_BIN="${KAFKA_TOOL_HOME}"

# Zookeeper
# ubuntu zookeeper install
# https://zookeeper.apache.org/
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-an-apache-zookeeper-cluster-on-ubuntu-18-04
# https://linuxconfig.org/how-to-install-and-configure-zookeeper-in-ubuntu-18-04
export ZOOKEEPER_HOME="${APPLICATIONS_HOME}/apache-zookeeper-3.5.5"
export ZOOKEEPER_BIN="${ZOOKEEPER_HOME}/bin"

# Redis
# ubuntu redis install
# https://redis.io/
# https://redis.io/download (follow the instructions to build using `make`)
export REDIS_HOME="${APPLICATIONS_HOME}/redis-6.0.6"
export REDIS_BIN="${REDIS_HOME}/src"

alias redis-server='cd ${REDIS_BIN}; ./redis-server'
alias redis-cli='cd ${REDIS_BIN}; ./redis-cli'

# https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-18-04 (follow the instructions)
# sudo apt update
# sudo apt install -y redis-server
# sudo gedit /etc/redis/redis.conf
# sudo systemctl restart redis.service

# Configure to start automatically with the server
# cp redis.service to /etc/systemd/system
alias redis-restart='sudo systemctl restart redis.service'
alias redis-start='sudo systemctl start redis.service'
alias redis-stop='sudo systemctl stop redis.service'
alias redis-status='sudo systemctl status redis.service'
alias redis-enable='sudo systemctl enable redis.service'
alias redis-disable='sudo systemctl disable redis.service'

# ubuntu redis UI
# https://redisdesktop.com/
# http://docs.redisdesktop.com/en/latest/install/
# https://www.npmjs.com/package/redis-commander
# sudo snap install redis-desktop-manager

# MongoDB
# ubuntu mongodb install
# https://www.mongodb.com/download-center/community
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
# https://tecadmin.net/install-mongodb-on-ubuntu/
export MONGODB_HOME="${APPLICATIONS_HOME}/mongodb-linux-x86_64-ubuntu1804-4.2.0"
export MONGODB_BIN="${MONGODB_HOME}/bin"

# https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-18-04
# sudo apt update
# sudo apt install -y mongodb

# Configure to start automatically with the server
# cp mongo.service to /etc/systemd/system
alias mongodb-restart='sudo systemctl restart replicated_mongodb1.service replicated_mongodb2.service replicated_mongodb3.service'
alias mongodb-start='sudo systemctl start replicated_mongodb1.service replicated_mongodb2.service replicated_mongodb3.service'
alias mongodb-stop='sudo systemctl stop replicated_mongodb1.service replicated_mongodb2.service replicated_mongodb3.service'
alias mongodb-status='sudo systemctl status replicated_mongodb1.service replicated_mongodb2.service replicated_mongodb3.service'
alias mongodb-enable='sudo systemctl enable replicated_mongodb1.service replicated_mongodb2.service replicated_mongodb3.service'
alias mongodb-disable='sudo systemctl disable replicated_mongodb1.service replicated_mongodb2.service replicated_mongodb3.service'

# GCosmiano Original mongod commands - 2020-07-25
# Configure to start automatically with the server
# cp mongo.service to /etc/systemd/system
#alias mongodb-restart='sudo systemctl restart mongodb'
#alias mongodb-start='sudo systemctl start mongodb'
#alias mongodb-stop='sudo systemctl stop mongodb'
#alias mongodb-status='sudo systemctl status mongodb'
#alias mongodb-enable='sudo systemctl enable mongodb'
#alias mongodb-disable='sudo systemctl disable mongodb'

# ubuntu mongodb UI
# https://nosqlbooster.com/downloads
# https://www.mongodb.com/download-center/compass

# MongoDB Zip Installation Failed in Ubuntu 18.04
# https://stackoverflow.com/questions/51006934/mongodb-zip-installation-failed-in-ubuntu-18-04
#export LD_LIBRARY_PATH=~/LD_LIBRARY/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH="${HOME}/LD_LIBRARY"

# ubuntu rabbitmq install
# https://www.rabbitmq.com/
# https://www.rabbitmq.com/download.html
alias rabbitmq-restart='sudo systemctl restart rabbitmq-server'
alias rabbitmq-start='sudo systemctl start rabbitmq-server'
alias rabbitmq-stop='sudo systemctl stop rabbitmq-server'
alias rabbitmq-status='sudo systemctl status rabbitmq-server'
alias rabbitmq-enable='sudo systemctl enable rabbitmq-server'
alias rabbitmq-disable='sudo systemctl disable rabbitmq-server'

# ubuntu cassandra install
# http://cassandra.apache.org/
# Configure to start automatically with the server
# cp cassandra.service to /etc/systemd/system
export CASSANDRA_HOME="${APPLICATIONS_HOME}/apache-cassandra-3.11.4"
export CASSANDRA_BIN="${CASSANDRA_HOME}/bin"

alias cassandra-restart='sudo systemctl restart cassandra.service'
alias cassandra-start='sudo systemctl start cassandra.service'
alias cassandra-stop='sudo systemctl stop cassandra.service'
alias cassandra-status='sudo systemctl status cassandra.service'
alias cassandra-enable='sudo systemctl enable cassandra.service'
alias cassandra-disable='sudo systemctl disable cassandra.service'

# Docker
# https://docs.docker.com/engine/install/ubuntu/
alias docker-restart='sudo systemctl restart docker'
alias docker-start='sudo systemctl start docker'
alias docker-stop='sudo systemctl stop docker'
alias docker-status='sudo systemctl status docker'
alias docker-enable='sudo systemctl enable docker'
alias docker-disable='sudo systemctl disable docker'

# ubuntu postgreSQL install
# https://tecadmin.net/how-to-install-postgresql-in-ubuntu-20-04/
# https://www.postgresqltutorial.com/install-postgresql-linux/
# https://www.postgresql.org/docs/current/index.html
alias postgres-restart='sudo systemctl restart postgresql'
alias postgres-start='sudo systemctl start postgresql'
alias postgres-stop='sudo systemctl stop postgresql'
alias postgres-status='sudo systemctl status postgresql'
alias postgres-enable='sudo systemctl enable postgresql'
alias postgres-disable='sudo systemctl disable postgresql'
alias postgres-disable='sudo systemctl is-active postgresql'
alias postgres-disable='sudo systemctl is-enabled postgresql'

# Maven
export MAVEN_HOME="${APPLICATIONS_HOME}/apache-maven-3.6.3"
export MAVEN_BIN="${MAVEN_HOME}/bin"

# Path
#PATH="${JAVA_HOME}:$PATH"
#PATH="${JAVA_BIN}:$PATH"
#PATH="${JAVA_BIN}:${NODEJS_LIB}:${SCALA_BIN}:${SBT_BIN}:${STACK_BIN}:${INTELLIJ_LIB}:${WEBSTORM_LIB}:${TOMCAT_LIB}:${STYLISH_HASKELL}:$PATH"
#PATH="${JAVA_BIN}:${NODEJS_LIB}:${SCALA_BIN}:${SBT_BIN}:${GHC_HOME}:${STACK_BIN}:${GRADLE_BIN}:${INTELLIJ_LIB}:${WEBSTORM_LIB}:${TOMCAT_LIB}:$PATH"
#PATH="${NODEJS_LIB}:${SCALA_BIN}:${SBT_BIN}:${GHC_HOME}:${STACK_BIN}:${GRADLE_BIN}:${GROOVY_BIN}:${INTELLIJ_LIB}:${WEBSTORM_LIB}:${TOMCAT_LIB}:${KAFKA_BIN}:${KAFKA_CONFIG}:$PATH"
PATH="${SCALA_BIN}:$PATH"
PATH="${SBT_BIN}:$PATH"
PATH="${GHC_HOME}:$PATH"
PATH="${STACK_BIN}:$PATH"
PATH="${GRADLE_BIN}:$PATH"
PATH="${GROOVY_BIN}:$PATH"
PATH="${INTELLIJ_LIB}:$PATH"
PATH="${WEBSTORM_LIB}:$PATH"
PATH="${PYCHARM_LIB}:$PATH"
PATH="${TOMCAT_LIB}:$PATH"
PATH="${KAFKA_BIN}:$PATH"
PATH="${KAFKA_CONFIG}:$PATH"
PATH="${ZOOKEEPER_BIN}:$PATH"
PATH="${MONGODB_BIN}:$PATH"
PATH="${LD_LIBRARY_PATH}:$PATH"
PATH="${REDIS_BIN}:$PATH"
PATH="${CASSANDRA_BIN}:$PATH"
PATH="${MAVEN_BIN}:$PATH"
PATH="${ELASTIC_SEARCH_BIN}:$PATH"
PATH="${KIBANA_BIN}:$PATH"
PATH="${LOGSTASH_BIN}:$PATH"
PATH="${KAFKA_TOOL_BIN}:$PATH"
PATH="${CONFLUENT_BIN}:$PATH"
PATH="${KAFKA_CMAK_BIN}:$PATH"

export PATH

alias jdk8='cd ~; . jdk8.sh'
alias jdk14='cd ~; . jdk14.sh'
alias jdk15='cd ~; . jdk15.sh'
alias jdk16='cd ~; . jdk16.sh'
alias jdk17='cd ~; . jdk17.sh'
alias openjdk8='cd ~; . openjdk8.sh'
alias openjdk14='cd ~; . openjdk14.sh'
alias openjdk15='cd ~; . openjdk15.sh'
alias openjdk16='cd ~; . openjdk16.sh'
alias openjdk17='cd ~; . openjdk17.sh'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# sdkman
# ubuntu sdkman install
# https://sdkman.io/
# https://sdkman.io/install
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/gio/.sdkman"
[[ -s "/home/gio/.sdkman/bin/sdkman-init.sh" ]] && source "/home/gio/.sdkman/bin/sdkman-init.sh"

# Confluent Kafka Connect Mongo Source
# How to connect Kafka to MongoDB Source - https://medium.com/tech-that-works/cloud-kafka-connector-for-mongodb-source-8b525b779772
# Setting MongoDB Replica Set - https://www.youtube.com/watch?v=I6J9M0J66jo
# MongoDB Kafka Connect Tutorial | Apache Kafka - https://www.youtube.com/watch?v=AF9WyW4npwY
# NOT needed if `plugins` path is setup correctly. See readme.md on Setting up Confluent Kafka Connect Plugins such as Kafka Connector MongoDB Source
#    - $CONFLUENT_HOME/etc/kafka/connect-distributed.properties
#    - $CONFLUENT_HOME/etc/kafka/connect-standalone.properties
#    - $CONFLUENT_HOME/etc/schema-registry/connect-avro-distributed.properties
#    - $CONFLUENT_HOME/etc/schema-registry/connect-avro-standalone.properties
# e.g.
# plugin.path=$HOME/Documents/_applications/confluent-5.5.1/share/java,$HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components,$HOME/Documents/_applications/confluent-5.5.1/plugins
# export CLASSPATH="$HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components/debezium-debezium-connector-mongodb/*"
# export CONFLUENT_CONNECT_CLASSPATH="$HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-elasticsearch/*
# $HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components/debezium-debezium-connector-mongodb/*
# $HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components/debezium-debezium-connector-mysql/*
# $HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components/jcustenborder-kafka-connect-redis/*
# $HOME/Documents/_applications/confluent-5.5.1/share/confluent-hub-components/mongodb-kafka-connect-mongodb/*"
source "$HOME/.cargo/env"
