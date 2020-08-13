# https://askubuntu.com/questions/740757/switch-between-multiple-java-versions
# https://stackoverflow.com/questions/49507160/how-to-install-jdk-10-under-ubuntu
# https://askubuntu.com/questions/534658/undo-update-alternatives

# https://askubuntu.com/questions/740757/switch-between-multiple-java-versions
# https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-oracle-java-jdk-10-8-on-ubuntu-18-04-ubuntu-17-10.html
# https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-oracle-java-jdk-10-8-on-ubuntu-18-04-ubuntu-17-10.html#ppa
# https://aboullaite.me/switching-between-java-versions-on-ubuntu-linux/

# Java 11
# sudo update-java-alternatives -s java-11
export JAVA_HOME="${APPLICATIONS_HOME}/amazon-corretto-8.252.09.1-linux-x64"
export JAVA_BIN="${JAVA_HOME}/bin"

# Path
export PATH="${JAVA_BIN}:$PATH"

# displaying java version
java -version
