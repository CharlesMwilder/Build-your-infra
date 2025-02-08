<details>
<summary><h1>🎯 Installation et configuration d'un serveur bastion GUACAMOLE<h1></summary>

# 📑 Installation d'Apache Guacamole sur Debian 12

## 📑 A. Installer les prérequis d'Apache Guacamole

- **Avant de commencer, mettez à jour la liste des paquets** :

```
apt-get update
```

- **Installez ensuite les dépendances nécessaires** :

```bash
apt-get install build-essential libcairo2-dev libjpeg62-turbo-dev libpng-dev libtool-bin uuid-dev libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev
```

---

### 📑 B. Compiler et installer Apache Guacamole "Server"

- **Téléchargez et extrayez les sources** :

```
cd /tmp
wget https://downloads.apache.org/guacamole/1.5.5/source/guacamole-server-1.5.5.tar.gz
tar -xzf guacamole-server-1.5.5.tar.gz
cd guacamole-server-1.5.5/
```

- **Préparez la compilation** :

```
./configure --with-systemd-dir=/etc/systemd/system/
```

- **En cas d'erreur liée à ``guacenc_video_alloc``** :

```
./configure --with-systemd-dir=/etc/systemd/system/ --disable-guacenc
```

- **Compilez et installez** :

```
make
make install
```

- **Mettez à jour les liens dynamiques et démarrez `guacd`** :

```
ldconfig
systemctl daemon-reload
systemctl enable --now guacd
systemctl status guacd
```

---

### 📑 C. Créer le répertoire de configuration

```
sudo mkdir -p /etc/guacamole/{extensions,lib}
```

---

### 📑 D. Installer Guacamole Client (Web App)

- **Ajoutez le dépôt de Debian 11 pour installer Tomcat 9** :

```
nano /etc/apt/sources.list.d/bullseye.list
```

- **Ajoutez cette ligne** :

```
deb http://deb.debian.org/debian/ bullseye main
```

- **Mettez à jour et installez Tomcat 9** :

```
apt-get update
apt-get install tomcat9 tomcat9-admin tomcat9-common tomcat9-user
```

- **Téléchargez et installez Guacamole Client** :

```
cd /tmp
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-1.5.5.war
mv guacamole-1.5.5.war /var/lib/tomcat9/webapps/guacamole.war
```

- **Redémarrez les services** :

```
systemctl restart tomcat9 guacd
```

---

### 📑 E. Base de données MariaDB pour l'authentification

- **Installez MariaDB** :

```
apt-get install mariadb-server
```

- **Sécurisez l'installation** :

```
mysql_secure_installation
```

- **Créez la base de données et un utilisateur** :

```
CREATE DATABASE guacadb;
CREATE USER 'guaca_billu'@'localhost' IDENTIFIED BY 'Azerty1*';
GRANT SELECT,INSERT,UPDATE,DELETE ON guacadb.* TO 'guaca_billu'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

- **Téléchargez et installez l'extension JDBC** :

```
cd /tmp
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-auth-jdbc-1.5.5.tar.gz
tar -xzf guacamole-auth-jdbc-1.5.5.tar.gz
mv guacamole-auth-jdbc-1.5.5/mysql/guacamole-auth-jdbc-mysql-1.5.5.jar /etc/guacamole/extensions/
```

- **Téléchargez et installez le connecteur MySQL** :

```
cd /tmp
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-9.1.0.tar.gz
tar -xzf mysql-connector-j-9.1.0.tar.gz
cp mysql-connector-j-9.1.0/mysql-connector-j-9.1.0.jar /etc/guacamole/lib/
```

- **Importez la structure de la base de données** :

```
cd guacamole-auth-jdbc-1.5.5/mysql/schema/
cat *.sql | mysql -u root -p guacadb
```

- **Configurez `guacamole.properties`** :

```
nano /etc/guacamole/guacamole.properties
```

- **Ajoutez ceci** :

```
mysql-hostname: 127.0.0.1
mysql-port: 3306
mysql-database: guacadb
mysql-username: guaca_billu
mysql-password: Azerty1*
```

- **Configurez `guacd.conf`** :

```
nano /etc/guacamole/guacd.conf
```

- **Ajoutez ceci** :

```
[server]
bind_host = 0.0.0.0
bind_port = 4822
```

- **Redémarrez les services** :

```
systemctl restart tomcat9 guacd mariadb
```

---

## 📑 IV. Premiers pas avec Apache Guacamole

- **Accédez à l'interface** :

```
http://<Adresse IP>:8080/guacamole/
```

- **Utilisez les identifiants par défaut** :

- **Utilisateur** : guacadmin
- **Mot de passe** : guacadmin

![BASTION](https://github.com/user-attachments/assets/bbc94cdf-1061-468d-b1a1-a73a12f4bbdc)

---

### 📑 A. Créer un nouveau compte admin

**1. Accédez aux paramètres > Utilisateurs > Nouvel utilisateur**.<br>
**2. Créez un nouvel administrateur avec un mot de passe sécurisé**.<br>
**3. Supprimez ou désactivez `guacadmin`**.

![BASTION2](https://github.com/user-attachments/assets/14d9c876-2f39-48d1-80b0-c164ebefce64)

![BASTION3](https://github.com/user-attachments/assets/6544612e-0806-452a-91cb-6aa47f69936d)

![BASTION1](https://github.com/user-attachments/assets/8fb58477-3873-4446-95dd-ff8d72f4a4a8)

---

### 📑 B. Ajouter une connexion RDP

**1. Créez un groupe de connexions : **Paramètres > Connexion > Nouveau groupe****.<br>
**2. Ajoutez une nouvelle connexion RDP avec l'IP et les identifiants**.<br>
**3. Activez `Ignorer le certificat du serveur` si nécessaire**.

![BASTION4](https://github.com/user-attachments/assets/8c18369d-ac8b-4a53-933b-3cb0986affa3)

![BASTION5](https://github.com/user-attachments/assets/28d1679b-cd06-4ecd-90b0-94444c02eac1)

![BASTION6](https://github.com/user-attachments/assets/35b46dd4-0b5c-4f83-a4ae-2a28f2a75ba4)

![BASTION7](https://github.com/user-attachments/assets/30d8825e-d0f6-4e13-915f-ab1b0325e873)

![BASTION8](https://github.com/user-attachments/assets/2ed31fd0-bf4e-48ca-8b97-6277d64538b8)

![BASTION9](https://github.com/user-attachments/assets/03eb45d0-cf46-4dec-a7dc-97b2da5e4443)

---

## 📑 C. Apache Guacamole : erreur de connexion en RDP

- **Que faire si la connexion RDP ne se lance pas ou qu'elle affiche une erreur ?**

- **Retournez sur la ligne de commande de votre serveur et vérifiez les dernières lignes de logs qui s'affichent lorsque l'on regarde le statut du service ``guacd``** :

```
systemctl status guacd
```

- **Par exemple, on peut trouver ceci** :

```
juin 14 20:15:29 srv-guacamole guacd[31120]: Certificate validation failed
juin 14 20:15:29 srv-guacamole guacd[31120]: RDP server closed/refused connection: SSL/TLS connection failed (untrusted/self-signed certificate?)
```

- **Si le certificat RDP ne peut pas être vérifié (auto-signé par exemple) et que l'option ``Ignorer le certificat du serveur`` n'est pas cochée dans les paramètres de la connexion Guacamole, alors cette erreur se produira.**

- **Une autre erreur que vous pourriez rencontrer si vous avez besoin d'établir des connexions en RDP, c'est celle-ci** :

```
RDP server closed/refused connection: Security negotiation failed (wrong security type?)
```

- **Ce problème est lié au compte utilisateur ``daemon`` utilisé par défaut pour exécuter le service ``guacd``. Vous pouvez le vérifier avec cette commande** :

```
ps aux | grep -v grep | grep guacd
```

- **Résultat** :

```
daemon     31513  0.0  0.7 247928 15400 ?        Ss   16:03   0:00 /usr/local/sbin/guacd -f
```

- **Nous devons créer un nouvel utilisateur, lui associer les permissions nécessaires sur les données d'Apache Guacamole, puis mettre à jour le service et enfin le relancer**.

- **Voici la série de commandes à exécuter, dans l'ordre** :

```
useradd -M -d /var/lib/guacd/ -r -s /sbin/nologin -c "Guacd User" guacd
mkdir /var/lib/guacd
chown -R guacd: /var/lib/guacd
sed -i 's/daemon/guacd/' /etc/systemd/system/guacd.service
systemctl daemon-reload
systemctl restart guacd
```

- **Puis, vérifiez l'état du service** :

```
systemctl status guacd
```

*Si c'est bon, vous pouvez tenter une nouvelle connexion RDP*.

</details>
