<details>
<summary><h1>🎯 Installation de GRAYLOG<h1></summary>

# 🛠️ I. Installation pas à pas de Graylog

## 🚀 Préparation initiale
. Mettez à jour le cache des paquets et installez les outils nécessaires :

```
apt update
apt install curl lsb-release ca-certificates gnupg2 pwgen -y
```

🛠️ II. Installation de Java (OpenJDK17)
1. Installez OpenJDK 17 :

```
apt install openjdk-17-jre-headless -y
```

2. Vérifiez que Java est installé correctement :

```
java -version
```

🛠️ III. Installation de MongoDB
1. Ajouter la clé GPG du dépôt MongoDB :

```
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc |  gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor
```

2. Ajouter le dépôt MongoDB :

```
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" > /etc/apt/sources.list.d/mongodb-org-6.0.list
```

3. Installer MongoDB :
. Mettez à jour la liste des paquets et installez MongoDB :

```
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb
dpkg -i libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb
apt update
apt install -y mongodb-org
```

4. Activer et démarrer MongoDB :

```
systemctl daemon-reload
systemctl enable mongod.service
systemctl start mongod.service
systemctl --type=service --state=active | grep mongod
systemctl status mongod.service
```

MongoDB est maintenant installé et fonctionnel.

III. Installation d’Elasticsearch
1. Ajouter la clé GPG d'Elasticsearch :

```
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
```

2. Ajouter le dépôt Elasticsearch :

```
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elasticsearch-7.x.list
```

3. Installer Elasticsearch :

```
apt update
apt install -y elasticsearch
```

4. Configurer Elasticsearch :
. Modifiez le fichier de configuration :

```
nano /etc/elasticsearch/elasticsearch.yml
```

. Ajoutez ou modifiez les lignes suivantes :

```
cluster.name: graylog
node.name: ${HOSTNAME}
discovery.type: single-node
network.host: 127.0.0.1
```

5. Configurer la JVM :
. Modifiez le fichier de configuration :

```
nano /etc/elasticsearch/jvm.options
```

. Adaptez les paramètres mémoire selon votre machine (exemple : 4 Go de RAM) :

```
-Xms4g
-Xmx4g
```

6. Démarrer Elasticsearch :

```
systemctl enable elasticsearch
systemctl start elasticsearch
```

🛠️ IV. Installation de Graylog
1. Ajouter le dépôt Graylog :

```
wget https://packages.graylog2.org/repo/packages/graylog-6.1-repository_latest.deb
apt install ./graylog-6.1-repository_latest.deb
apt update
```

2. Installer Graylog :

```
apt install -y graylog-server
```

3. Configurer Graylog :
. Générez une clé secrète pour le stockage des mots de passe :

```
pwgen -N 1 -s 96
```

. Copiez la clé générée, puis modifiez le fichier de configuration :


```
nano /etc/graylog/server/server.conf
```

. Configurez les options suivantes :

```
password_secret = VOTRE_CLÉ_GÉNÉRÉE
```

. Pour générer le hash du mot de passe admin :

```
echo -n "VotreMotDePasse" | shasum -a 256
```

. Copiez le hash obtenu dans root_password_sha2 et compléter:

```
nano /etc/graylog/server/server.conf
```

. Configurez les options suivantes :

```
root_password_sha2 = HASH_SHA256_DE_VOTRE_MOT_DE_PASSE
http_bind_address = 0.0.0.0:9000
elasticsearch_hosts = http://127.0.0.1:9200
```

4. Démarrer Graylog :

```
systemctl enable graylog-server
systemctl start graylog-server
```

V. Vérifications Finales
. Assurez-vous que tous les services fonctionnent correctement :

```
systemctl status mongod
systemctl status elasticsearch
systemctl status graylog-server
```

. Consultez les journaux pour déboguer si nécessaire :

```
tail -f /var/log/graylog-server/server.log
```

. Graylog est maintenant installé et fonctionnel sur votre serveur Debian 12 avec Elasticsearch !


🌟 Connexion :

Accédez à Graylog via le navigateur à l'adresse : ``http://<IP_du_serveur_ou_nom_DNS>:9000.``<br>
Identifiant : ``Admin (dans notre cas Billu)``<br> 
Mot de passe : ``configuré dans server.conf. (dans notre cas mot de passe créer avec le compte Billu sur Graylog)``<br>

🎉 Bienvenue dans Graylog !

![GRAYLOG CONNEXION 1](https://github.com/user-attachments/assets/118bd11f-1416-4820-ac10-c727be528c4f)<br>

![GRAYLOG CONNEXION 2](https://github.com/user-attachments/assets/b5916004-90b1-4d27-ad44-ae73e4d90622)



</details>
