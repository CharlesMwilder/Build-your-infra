<details>
<summary><h1>🎯 Mise en place d'un serveur de téléphonie sur IP avec FREEPBX<h1></summary>

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
<summary><h1>🎯 Mise en place d'un serveur web avec APACHE<h1></summary>
  
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
    <title>BILLU</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://images6.alphacoders.com/120/1201406.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }
        .container {
            text-align: center;
            background: rgba(0, 0, 0, 0.6);
            padding: 40px 60px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.5);
            animation: fadeIn 2s ease-in-out;
        }
        h1 {
            font-size: 4rem;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.5rem;
            margin-top: 0;
        }
        .button {
            margin-top: 20px;
            padding: 15px 30px;
            font-size: 1.2rem;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }
        .button:hover {
            background-color: #218838;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bienvenue chez BILLU !</h1>
        <p>L'avenir de la facturation</p>
        <a href="next.html" class="button">Enter</a>
    </div>
</body>
</html>
```
---

- **Ajouter un fichier ``next.html`` dans le dossier ``/var/www/html/``** :

---

```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Présentation de BillU</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://images8.alphacoders.com/120/1201407.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            flex-direction: column;
        }

        .container {
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            animation: fadeIn 2s ease-in-out;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
        }

        p {
            font-size: 1.2rem;
            line-height: 1.6;
            margin: 10px 0;
            text-shadow: 1px 1px 6px rgba(0, 0, 0, 0.4);
        }

        .highlight {
            color: #ffd700;
            font-weight: bold;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .wave {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 200px;
            background: url('https://svgshare.com/i/tHx.svg') repeat-x;
            animation: waveAnimation 10s linear infinite;
        }

        @keyframes waveAnimation {
            from {
                transform: translateX(0);
            }
            to {
                transform: translateX(-1600px);
            }
        }

        /* Style du bouton */
        .back-button {
            margin-top: 20px;
            padding: 15px 30px;
            font-size: 1.2rem;
            background-color: #ffd700;
            color: black;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .back-button:hover {
            background-color: #ffa500;
            transform: scale(1.1);
        }

        .back-button:active {
            transform: scale(1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bienvenue chez BillU</h1>
        <p>BillU, filiale du groupe international <span class="highlight">RemindMe</span>,
            est spécialisée dans le développement de logiciels innovants, notamment de facturation.</p>
        <p>Avec <span class="highlight">167 collaborateurs</span> et un siège situé dans le 20e arrondissement de Paris,
            notre mission est de simplifier les processus financiers et d'augmenter l'efficacité opérationnelle de nos clients.</p>
        <p>Répartie en <span class="highlight">9 départements</span>, notre équipe talentueuse mêle expertise en finance et en développement
            logiciel pour fournir des solutions de pointe.</p>

        <!-- Bouton pour retourner à la page index.html -->
        <button class="back-button" onclick="window.location.href='index.html';">Retour à l'index</button>
    </div>
    <div class="wave"></div>
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

- **Connectez-vous sur ``no-ip`` et créer un hostname** :

``Hostname : BilluServer``<br>
``Domain : Sélectionne un domaine, ex. tssr.net``<br>
``Record Type : A``<br>
``IPV4 Address : Ton adresse IP publique``.

- **Accèder à votre site via le domaine** :

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

- **Éditer ``/etc/apache2/sites-available/000-default.conf``** :

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

---

## **Le serveur web est maintenant fonctionnel, sécurisé et accessible depuis l’extérieur grâce à un reverse proxy**. 🎉

![WEB1](https://github.com/user-attachments/assets/ad358a8b-7293-42da-afeb-3af5321688d7)<br>

![WEB2](https://github.com/user-attachments/assets/3d7c1f6c-9069-4272-b4f8-5d204067fc89)


</details>
