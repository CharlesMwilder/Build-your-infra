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
