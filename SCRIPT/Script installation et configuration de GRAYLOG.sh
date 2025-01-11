#!/bin/bash

# Mise à jour des paquets et installation des outils nécessaires
apt update
apt install -y curl lsb-release ca-certificates gnupg2 pwgen

# Installation de Java (OpenJDK 17)
apt install -y openjdk-17-jre-headless

# Installation de MongoDB
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" > /etc/apt/sources.list.d/mongodb-org-6.0.list
apt update
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb
dpkg -i libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb
apt install -y mongodb-org
systemctl daemon-reload
systemctl enable mongod.service
systemctl start mongod.service

# Installation d'Elasticsearch
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elasticsearch-7.x.list
apt update
apt install -y elasticsearch
sed -i 's|^#cluster.name:.*|cluster.name: graylog|' /etc/elasticsearch/elasticsearch.yml
sed -i 's|^#network.host:.*|network.host: 127.0.0.1|' /etc/elasticsearch/elasticsearch.yml
sed -i 's|^-Xms1g.*|-Xms4g|' /etc/elasticsearch/jvm.options
sed -i 's|^-Xmx1g.*|-Xmx4g|' /etc/elasticsearch/jvm.options
systemctl enable elasticsearch
systemctl start elasticsearch

# Installation de Graylog
wget https://packages.graylog2.org/repo/packages/graylog-6.1-repository_latest.deb
apt install -y ./graylog-6.1-repository_latest.deb
apt update
apt install -y graylog-server

# Configuration de Graylog
PASSWORD_SECRET=$(pwgen -N 1 -s 96)
ROOT_PASSWORD_SHA2=$(echo -n "Admin-Billu123!" | sha256sum | awk '{print $1}')
sed -i "s|^password_secret =.*|password_secret = $PASSWORD_SECRET|" /etc/graylog/server/server.conf
sed -i "s|^root_password_sha2 =.*|root_password_sha2 = $ROOT_PASSWORD_SHA2|" /etc/graylog/server/server.conf
sed -i "s|^#http_bind_address =.*|http_bind_address = 0.0.0.0:9000|" /etc/graylog/server/server.conf
sed -i "s|^#elasticsearch_hosts =.*|elasticsearch_hosts = http://127.0.0.1:9200|" /etc/graylog/server/server.conf

# Démarrage de Graylog
systemctl enable graylog-server
systemctl start graylog-server

# Fin
echo "Installation terminée. Accédez à l'interface Web via http://<IP-DU-SERVEUR>:9000"
echo "Nom d'utilisateur : admin"
echo "Mot de passe : Admin-Billu123!"
