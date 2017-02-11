sudo apt-get update
sudo apt-get install openjdk-7-jdk -y
sudo apt-get install systemd -y

cd /opt

echo "Downloading Kafka, please wait..."
wget -q http://apache.mirrors.hoobly.com/kafka/0.10.1.1/kafka_2.11-0.10.1.1.tgz
echo "Download complete, finishing install"
tar -zxvf kafka_2.11-0.10.1.1.tgz
ln -s kafka_2.11-0.10.1.1 kafka
cd kafka
#echo "host.name=10.2.0.10" >> config/server.properties
echo "advertised.listeners=PLAINTEXT://127.0.0.1:9092" >> config/server.properties
cp /vagrant/zookeeper.service /etc/systemd/system
cp /vagrant/kafka.service /etc/systemd/system
chmod +x /etc/systemd/system/zookeeper.service
chmod +x /etc/systemd/system/kafka.service
systemctl enable zookeeper
systemctl enable kafka
systemctl start zookeeper
systemctl start kafka
echo "Installation complete!"
