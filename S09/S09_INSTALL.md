<details>
<summary><h1>🎯 Mise en place d'un serveur de téléphonie sur IP avec FREEPBX (Debian 12)<h1></summary>

## 📑 Installation de FREEPBX via script : 

```bash
#!/bin/bash

# Mise à jour et installation des dépendances
apt-get update
apt-get upgrade -y
apt-get -y install build-essential git curl wget libnewt-dev libssl-dev libncurses5-dev subversion libsqlite3-dev libjansson-dev libxml2-dev uuid-dev default-libmysqlclient-dev htop sngrep lame ffmpeg mpg123
apt-get -y install git vim curl wget libnewt-dev libssl-dev libncurses5-dev subversion libsqlite3-dev build-essential libjansson-dev libxml2-dev uuid-dev expect

# Installation PHP 8.2
apt-get install -y build-essential linux-headers-`uname -r` openssh-server apache2 mariadb-server mariadb-client bison flex php8.2 php8.2-curl php8.2-cli php8.2-common php8.2-mysql php8.2-gd php8.2-mbstring php8.2-intl php8.2-xml php-pear curl sox libncurses5-dev libssl-dev mpg123 libxml2-dev libnewt-dev sqlite3 libsqlite3-dev pkg-config automake libtool autoconf git unixodbc-dev uuid uuid-dev libasound2-dev libogg-dev libvorbis-dev libicu-dev libcurl4-openssl-dev odbc-mariadb libical-dev libneon27-dev libsrtp2-dev libspandsp-dev sudo subversion libtool-bin python-dev-is-python3 unixodbc vim wget libjansson-dev software-properties-common nodejs npm ipset iptables fail2ban php-soap

# Suppression de l'ancienne version PHP si nécessaire
apt-get purge -y phpX.*  # Remplacer X par la version de PHP à supprimer

# Installation Asterisk
cd /usr/src
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-21-current.tar.gz
tar xvf asterisk-21-current.tar.gz
cd asterisk-21*/
contrib/scripts/get_mp3_source.sh
contrib/scripts/install_prereq install
./configure --libdir=/usr/lib64 --with-pjproject-bundled --with-jansson-bundled

# Automatisation du choix dans 'make menuselect'
expect << EOF
spawn make menuselect
expect "Press 1 for Asterisk"  # Exemple de texte que le menu peut afficher
send "1\r"  # Choisir l'option 1, par exemple
expect "Press 2 for another option"
send "2\r"  # Choisir l'option 2, si nécessaire
expect eof  # Fin du processus interactif
EOF

# Compilation d'Asterisk
make
make install
make samples
make config
ldconfig

# Création d'un utilisateur Asterisk et affectation des permissions
groupadd asterisk
useradd -r -d /var/lib/asterisk -g asterisk asterisk
usermod -aG audio,dialout asterisk
chown -R asterisk:asterisk /etc/asterisk
chown -R asterisk:asterisk /var/{lib,log,spool}/asterisk
chown -R asterisk:asterisk /usr/lib64/asterisk

# Modification des fichiers de configuration Asterisk
sed -i 's|#AST_USER|AST_USER|' /etc/default/asterisk
sed -i 's|#AST_GROUP|AST_GROUP|' /etc/default/asterisk
sed -i 's|;runuser|runuser|' /etc/asterisk/asterisk.conf
sed -i 's|;rungroup|rungroup|' /etc/asterisk/asterisk.conf
echo "/usr/lib64" >> /etc/ld.so.conf.d/x86_64-linux-gnu.conf
ldconfig

# Configuration du serveur Apache
sed -i 's/\(^upload_max_filesize = \).*/\120M/' /etc/php/8.2/apache2/php.ini
sed -i 's/\(^memory_limit = \).*/\1256M/' /etc/php/8.2/apache2/php.ini
sed -i 's/^\(User\|Group\).*/\1 asterisk/' /etc/apache2/apache2.conf
sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
a2enmod rewrite
systemctl restart apache2
rm /var/www/html/index.html

# Configuration ODBC
cat <<EOF > /etc/odbcinst.ini
[MySQL]
Description = ODBC for MySQL (MariaDB)
Driver = /usr/lib/x86_64-linux-gnu/odbc/libmaodbc.so
FileUsage = 1
EOF

cat <<EOF > /etc/odbc.ini
[MySQL-asteriskcdrdb]
Description = MySQL connection to 'asteriskcdrdb' database
Driver = MySQL
Server = localhost
Database = asteriskcdrdb
Port = 3306
Socket = /var/run/mysqld/mysqld.sock
Option = 3
EOF

# Installation FreePBX
cd /usr/local/src
wget http://mirror.freepbx.org/modules/packages/freepbx/freepbx-17.0-latest-EDGE.tgz
tar zxvf freepbx-17.0-latest-EDGE.tgz
cd /usr/local/src/freepbx/
./start_asterisk start
./install -n

# Installation de tous les modules
fwconsole ma installall
fwconsole reload
fwconsole restart

# Configuration systemd
cat <<EOF > /etc/systemd/system/freepbx.service
[Unit]
Description=FreePBX VoIP Server
After=mariadb.service

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/sbin/fwconsole start -q
ExecStop=/usr/sbin/fwconsole stop -q

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable freepbx

# Automatisation des réponses avec Expect pour les menus interactifs
# Cette partie permet d'automatiser "make menuselect"
expect << EOF
spawn make menuselect
expect "Press 1 for Asterisk"  # Exemple de texte que le menu peut afficher
send "1\r"  # Choisir l'option 1, par exemple
expect "Press 2 for another option"
send "2\r"  # Choisir l'option 2, si nécessaire
expect eof  # Fin du processus interactif
EOF

# Sauvegarder et quitter automatiquement dans 'make menuselect'
expect << EOF
spawn make
expect "Save and Quit"
send "y\r"
expect eof
EOF

# Optionnel: Redémarrage du système si nécessaire
# systemctl reboot
```
---

## 📑 Une fois l'installation finie se connecter directement via : ``http://freepbx.billu.com``

- Première utilisation (création d'un compte admin avec mot de passe).
  
- Puis choisir une des trois options selon les tâches à effectuer.

![FREEPBX1](https://github.com/user-attachments/assets/3620a205-9864-48ca-8a42-a571a498134e)


</details>

---

<details>
<summary><h1>🎯 Mise en place d'un serveur web avec APACHE (Debian 12)<h1></summary>
  
# 📑 Installation et Configuration :

## 📑 Étape 1 : Préparation de la VM webserver

- **Mettre à jour le système et installer Apache** :
   
   ```bash
   apt update && apt upgrade -y
   apt install apache2 -y
  ```
   
- **Vérifier le statut du service Apache** :

``systemctl status apache2``

- **Trouver l’adresse IP de la carte réseau "Accès par pont"** :

- **Utiliser la commande suivante** :

``ip a``

- **Tester l’accès à Apache depuis la machine hôte** :

- **Ouvrir un navigateur et se connecter via ``http://Adresse_IP_privée``**.

## 📑 Étape 2 : Configuration de la Page d’Accueil

- **Modifier la page d’accueil par défaut** :

- **Édite le fichier ``/var/www/html/index.html``** :

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to BILLU !</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        .button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to BILLU !</h1>
        <a href="next.html" class="button">ENTER</a>
    </div>
</body>
</html>
```
---

- **Ajouter un fichier ``next.html`` dans le dossier ``/var/www/html/``** :

---

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make your choice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        .button {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Choose a Site to Visit</h1>
        <a href="https://www.google.com" class="button">Google</a>
        <a href="https://www.wikipedia.org" class="button">Wikipedia</a>
        <a href="https://www.wildcodeschool.com" class="button">WCS</a>
        <a href="https://doompdf.pages.dev/doom.pdf" class="button">DOOM</a>
        <a href="index.html" class="button">Home</a>
    </div>
</body>
</html>
```
---

- **Redémarrer Apache** :

``systemctl restart apache2``

## 📑Étape 3 : Configuration de la Box Internet

- **Configurer la redirection de port** :

- **Rediriger le port externe ``80`` de la box vers le port interne ``80`` de la VM**.

- **Tester l’accès depuis un appareil connecté en 4G** :

- **Utiliser l’adresse IP publique de la box : ``http://Adresse_IP_Publique``**.
  
- **Sécuriser la connexion** :

- **Modifier la règle NAT/PAT pour rediriger un autre port externe, comme ``22545``, vers le port interne ``80``**.
  
- **Tester avec le port personnalisé** :

``Exemple : http://Adresse_IP_Publique:22545``

## 📑Étape 4 : Enregistrement d’un Nom de Domaine

- **Créer un nom de domaine dynamique sur ``no-ip``** :

- **Connecte-toi sur ``no-ip`` et créer un hostname** :

``Hostname : BilluServer``
``Domain : Sélectionne un domaine, ex. tssr.net``
``Record Type : A``
``IPV4 Address : Ton adresse IP publique``.

- ** Accèder à votre site via le domaine** :

``Exemple : http://BilluServer.tssr.net:22545``.

## 📑 Étape 5 : Mise en Place d’un Reverse Proxy

- **Installer Apache sur la VM proxy** :

```bash
apt install apache2 -y
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_balancer
a2enmod lbmethod_byrequests
```

``systemctl restart apache2``

- **Configure le fichier ``VirtualHost``** :

- **Sauvegarde ``/etc/apache2/sites-available/000-default.conf``** :

``cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak``

- **Édite ``/etc/apache2/sites-available/000-default.conf``** :

```bash
<VirtualHost *:22545>
    ServerName BilluServer.tssr.net

    ProxyPreserveHost On
    ProxyPass / http://<Adresse_IP_Du_Serveur>:80/
    ProxyPassReverse / http://<Adresse_IP_Du_Serveur>:80/

    <Location />
        Order allow,deny
        Allow from all
    </Location>
</VirtualHost>
```

- **Configurer le port d’écoute** :

- **Éditer ``/etc/apache2/ports.conf`` et ajouter** :

``Listen 22545``

- **Activer la configuration et redémarrer Apache** :

```bash
a2ensite 000-default.conf
systemctl restart apache2
```

- **Configurer la box pour rediriger le port externe ``22545`` vers la VM proxy**.

- **Tester l’accès via le reverse proxy** :

``Exemple : http://HomeHomeWCS.webhop.me:22545``.

- **Basculer vers le port ``80``** :

- **Modifie le VirtualHost pour écouter sur le port ``80``**.

``Exemple : http://HomeHomeWCS.webhop.me``.

Le serveur web est maintenant fonctionnel, sécurisé et accessible depuis l’extérieur grâce à un reverse proxy. 🎉

</details>
