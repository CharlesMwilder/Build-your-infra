
<details>
<summary><h1>🎯 Journalisation des scripts PowerShell dans Event Viewer<h1></summary>

## ▶️ 1) Création du journal d'évènements sur la machine locale  

**Lorsque l'on va dans "Event viewer" ou `eventvwr` dans PowerShell, nous accédons aux journaux par défaut.**  

![Capture d'écran 2025-01-08 164224](https://github.com/user-attachments/assets/8c7f8dff-fe88-4631-88fc-28fdfe5c8592)  

**Création d'un Journal d'évènements et ajout des sources, qui seront les scripts qui vont générer des logs**  

![Capture d'écran 2025-01-08 181013](https://github.com/user-attachments/assets/155c2d9c-5638-4779-98ab-886273150476)  

**Après exécution de la commande nous voyons que le journal a été créé. Il est pour le moment vierge.**  

![Capture d'écran 2025-01-08 164430](https://github.com/user-attachments/assets/28b1bf64-e297-433a-8235-58fe4c32bbf4)  

![Capture d'écran 2025-01-08 164658](https://github.com/user-attachments/assets/699f1cf5-b4db-460a-a2bc-474cacdab74a)  

**Si on veut supprimer le journal d'évènements, voici la commande.**  
![Capture d'écran 2025-01-09 090527](https://github.com/user-attachments/assets/5d59607a-046c-4f5a-9b34-79ffcb51d682)  

---
## ▶️ 2) Génération de logs depuis différentes sources.  

**Depuis une source (un script), paramétrage d'un évènement.**  

![Capture d'écran 2025-01-08 171257](https://github.com/user-attachments/assets/ca503be5-6c25-4887-9754-d7d3bfe7919f)  
Il existe 4 valeurs acceptées pour les "-EntryType" : Error, Information, FailureAudit, SuccessAudit, Warning.  

![Capture d'écran 2025-01-08 171341](https://github.com/user-attachments/assets/7510d066-1298-4bc2-b61c-6142c486550c)  

**Il est possible de récupérer un journal d'évènement directement dans la console.**  
![Capture d'écran 2025-01-08 171626](https://github.com/user-attachments/assets/dceac9b5-1a33-4be3-80fe-7b4a0fab74ac)  

---
## ▶️ 3) Exportation des évènements aux formats ``.csv`` et ``.xml``.  
* ### **Format `.csv`**  
![Capture d'écran 2025-01-09 092752](https://github.com/user-attachments/assets/e101d296-0116-46c2-a099-8194e8ede3f6)  
![Capture d'écran 2025-01-09 093141](https://github.com/user-attachments/assets/e9a5c8fa-dab0-479a-ae79-081bcd2c4206)  

* ### **Format `.xml`**  
![Capture d'écran 2025-01-09 092759](https://github.com/user-attachments/assets/fedb5186-9842-42b5-8828-20e6a0dee08f)  
![Capture d'écran 2025-01-09 093243](https://github.com/user-attachments/assets/df3391ed-fd97-498a-b8d0-11abba18a1f7)  

---
</details>

---

<details>
<summary><h1>🎯 Installation et configuration de ZABBIX<h1></summary>

---

## Étape 1 - 🛠️ Installation du serveur Zabbix
**Installation du dépôt de Zabbix dans le système :**

 ```
 wget https://repo.zabbix.com/zabbix/7.2/release/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.2+debian12_all.deb
 dpkg -i zabbix-release_latest_7.2+debian12_all.deb
 ```
   
Mise à jour de la liste des paquets et upgrade éventuel :
 ```
apt update && apt upgrade -y
 ```
Installation de Zabbix server, du frontend, et de l'agent :
 ```
apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent
 ```
---

## Étape 2 - 🔧 Configuration de Zabbix
Installation du SGBD :
 ```
apt install mariadb-server
 ```
Vérification du SGBD :
 ```
systemctl status mysql
 ```
Création et configuration de la base de données :<br>

Connecte-toi à MySQL en tant que root :
 ```
mysql -uroot -p
 ```
Entre le mot de passe quand il est demandé.<br>

Crée la base de données et l'utilisateur avec les privilèges nécessaires :
sql
 ```
mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;
mysql> create user zabbix@localhost identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> set global log_bin_trust_function_creators = 1;
mysql> quit;
 ```
Importation du schéma et des données :
 ```
zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix
 ```
Désactivation de la possibilité de modifier la configuration de la BD par des acteurs malveillants :<br>
Reconnecte-toi à MySQL :
 ```
mysql -uroot -p
Entre le mot de passe quand il est demandé.
mysql> set global log_bin_trust_function_creators = 0;
mysql> quit;
 ```
Édition du fichier de configuration de la BD du serveur Zabbix :<br>

Modifie le fichier ``/etc/zabbix/zabbix_server.conf`` pour y ajouter :
```
DBPassword=password
```
Configuration de PHP pour accéder au frontend :<br>

Modifie le fichier ``/etc/zabbix/nginx.conf`` pour ajouter :
```
listen 8080;
server_name <ici tu rentreras l'adresse IPv4 de ta machine>;
```
Démarrage du serveur et des processus de l'agent :
```
systemctl restart zabbix-server zabbix-agent nginx php8.2-fpm
```
Activation du démarrage automatique des services :
```
systemctl enable zabbix-server zabbix-agent nginx php8.2-fpm
```
---

## Étape 3 - 📑 Configuration de ZABBIX via l'interface web

Connexion à ZABBIX depuis un site web via son nom de DNS ``(zabbix.billu.com:8080)``:

![CONNEXION ZABBIX](https://github.com/user-attachments/assets/50a47582-2e63-4373-9cf8-9d267077f40b)<br>

Création de groupes d'hôtes (suivre les étapes) :

![CONFIG ZABBIX 1](https://github.com/user-attachments/assets/43a3bbed-6544-43c7-a4bf-613a887c9142)<br>

![CONFIG ZABBIX 2](https://github.com/user-attachments/assets/9f07bddc-7ae0-4917-84da-08a8ca323188)<br>

Ajout des hôtes (suivre les étapes) :

![CONFIG ZABBIX 3](https://github.com/user-attachments/assets/882914fe-62d1-4ea6-a74f-ca69d0745d74)<br>

![CONFIG ZABBIX 4](https://github.com/user-attachments/assets/32c5bbbb-31f6-4d6c-8c82-74638e8b9ed1)<br>

![CONFIG ZABBIX 5](https://github.com/user-attachments/assets/537679a7-14c3-44a6-84fd-6d6c70b3035f)<br>


Activer les rapports des problèmes :

![CONFIG ZABBIX 6](https://github.com/user-attachments/assets/22fd961a-3ed9-4e43-bb3b-9b3d1d3fb597)<br>


Créer et configurer le "media type" (suivre les étapes) :

![CONFIG ZABBIX 7](https://github.com/user-attachments/assets/cb514acb-37dd-48a2-b611-6f9aa18ad5c6)<br>

![CONFIG ZABBIX 8](https://github.com/user-attachments/assets/868c4636-4dca-45d5-9651-6326d8b34676)<br>

![CONFIG ZABBIX 9](https://github.com/user-attachments/assets/5bdbbdb4-60b4-4de0-898a-c5aa4ded604a)<br>


Ajouter au compte admin (billu) le media créer juste avant pour les rapports de problèmes (suivre les étapes) :

![CONFIG ZABBIX 10](https://github.com/user-attachments/assets/9164f71a-cf73-4022-a210-e2ea3da8a948)<br>

![CONFIG ZABBIX 11](https://github.com/user-attachments/assets/dc963dd5-86ff-43cf-b951-5dcefe845fcf)<br>


Création de notification pour rapport d'alerte sur l'utilisation de la mémoire de la machine cliente (suivre les étapes) :

![CONFIG ZABBIX 12](https://github.com/user-attachments/assets/89ffb3b4-c7c3-4cea-827b-4bbe79d98e9b)<br>

![CONFIG ZABBIX 13](https://github.com/user-attachments/assets/f8cbb2ca-888a-4266-add5-02de58c0b72e)<br>

![CONFIG ZABBIX 14](https://github.com/user-attachments/assets/0cbeaacf-2d91-4290-98b7-4b71c00d9812)<br>

![CONFIG ZABBIX 15](https://github.com/user-attachments/assets/6331d076-90fa-4639-a401-db198014247c)<br>

![CONFIG ZABBIX 16](https://github.com/user-attachments/assets/f04ad2b9-db80-40b9-9aab-cb35d1511beb)<br>

![CONFIG ZABBIX 17](https://github.com/user-attachments/assets/1d66bc69-5263-4488-b0e3-8a5cda3fb9ee)<br>

![CONFIG ZABBIX 18](https://github.com/user-attachments/assets/8ea2d24e-bc68-477c-b22c-261469206d04)<br>



</details>

---

<details>
<summary><h1>🎯 Installation de GRAYLOG<h1></summary>

# 🛠️ III. Installation pas à pas de Graylog

## 🚀 Préparation initiale
Mettez à jour le cache des paquets et installez les outils nécessaires :

```
sudo apt-get update
sudo apt-get install curl lsb-release ca-certificates gnupg2 pwgen
```

🍃 A. Installation de MongoDB
Ajout de la clé GPG pour MongoDB :

```
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor
```

Ajout du dépôt MongoDB 6 :

```
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/8.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
```

Mise à jour et installation de MongoDB :

```
sudo apt-get update
sudo apt-get install -y mongodb-org
```

⚠️ Si l’installation échoue pour cause de dépendance manquante (libssl1.1), téléchargez et installez ce paquet manuellement :

```
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb
```

Relancez l'installation et configurez MongoDB :

```
sudo apt-get install -y mongodb-org
sudo systemctl daemon-reload
sudo systemctl enable mongod.service
sudo systemctl restart mongod.service
sudo systemctl --type=service --state=active | grep mongod
```

🔍 B. Installation d'OpenSearch
Ajout de la clé et du dépôt OpenSearch :

```
curl -o- https://artifacts.opensearch.org/publickeys/opensearch.pgp | sudo gpg --dearmor --batch --yes -o /usr/share/keyrings/opensearch-keyring
echo "deb [signed-by=/usr/share/keyrings/opensearch-keyring] https://artifacts.opensearch.org/releases/bundle/opensearch/2.x/apt stable main" | sudo tee /etc/apt/sources.list.d/opensearch-2.x.list
```

Mise à jour et installation avec mot de passe admin :

```
sudo apt-get update
sudo env OPENSEARCH_INITIAL_ADMIN_PASSWORD=IT-Connect2024! apt-get install opensearch
```

Configuration de base dans opensearch.yml :

```
cluster.name: graylog
node.name: ${HOSTNAME}
path.data: /var/lib/opensearch
path.logs: /var/log/opensearch
discovery.type: single-node
network.host: 127.0.0.1
action.auto_create_index: false
plugins.security.disabled: true
```

Configuration de Java et des paramètres système :

```
sudo nano /etc/opensearch/jvm.options
```

Changez -Xms1g et -Xmx1g par :

```
-Xms4g
-Xmx4g
```

```
sudo sysctl -w vm.max_map_count=262144
sudo systemctl daemon-reload
sudo systemctl enable opensearch
sudo systemctl restart opensearch
```

🌟 C. Installation de Graylog
Téléchargement et installation de Graylog :

```
wget https://packages.graylog2.org/repo/packages/graylog-6.1-repository_latest.deb
sudo dpkg -i graylog-6.1-repository_latest.deb
sudo apt-get update
sudo apt-get install graylog-server
```

Configuration initiale :

Générez une clé pour password_secret :

```
pwgen -N 1 -s 96
```

Définissez le mot de passe admin (hashé) :

```
echo -n "PuitsDeLogs@" | shasum -a 256
```

Modifiez le fichier ``/etc/graylog/server/server.conf`` :

```
password_secret=<votre_clé_générée>
root_password_sha2=<votre_hash>
http_bind_address=0.0.0.0:9000
elasticsearch_hosts=http://127.0.0.1:9200
```

Lancez Graylog :


```
sudo systemctl enable --now graylog-server
```

Connexion :

Accédez à Graylog via le navigateur à l'adresse : http://<IP_du_serveur>:9000.<br>
Identifiant : admin<br>
Mot de passe : configuré dans server.conf.<br>

🎉 Bienvenue dans Graylog !

![GRAYLOG CONNEXION 1](https://github.com/user-attachments/assets/118bd11f-1416-4820-ac10-c727be528c4f)<br>

![GRAYLOG CONNEXION 2](https://github.com/user-attachments/assets/b5916004-90b1-4d27-ad44-ae73e4d90622)



</details>
