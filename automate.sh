## install necessary softwares
sudo yum install -y vim java-1.8.0-openjdk java-1.8.0-openjdk-devel wget git git-core

## Allow password based authentication to the machine
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart

## Download necessary softwares
wget http://www-us.apache.org/dist/hadoop/common/hadoop-2.7.4/hadoop-2.7.4.tar.gz
wget https://www.apache.org/dyn/closer.lua/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz


## Create the rsa keys and allow passwordless login into the localhost
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh-add
ssh localhost

export JAVA_HOME=/home/bigdata/jdk1.8.141
export HADOOP_PREFIX=/home/bigdata/hadoop-2.7.4
export HADOOP_HOME=${HADOOP_PREFIX}
export HADOOP_CONF_DIR=${HADOOP_PREFIX}/etc/hadoop
export PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH
