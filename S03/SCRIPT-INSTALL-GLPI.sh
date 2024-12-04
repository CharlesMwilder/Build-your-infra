#!/bin/bash

# Charger le fichier de configuration
source /root/config.txt

# Mise a jour des paquets Debian
apt update && apt upgrade -y

# Installation du serveur LAMP (Linux Apache MariaDB PHP)
echo "Installation d'Apache2..."
apt install -y apache2

echo "Installation de PHP et des modules necessaires..."
apt install -y php libapache2-mod-php

# Redémarrage d'Apache pour appliquer les changements
systemctl restart apache2

# Installation de MariaDB (serveur MySQL)
echo "Installation de MariaDB..."
apt install -y mariadb-server

# Sécurisation de MariaDB - automatisée avec expect
echo "Securisation de MariaDB..."
export DEBIAN_FRONTEND=noninteractive
expect -c "
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"\r\"
expect \"Set root password?\"
send \"y\r\"
expect \"New password:\"
send \"rootpassword\r\"
expect \"Re-enter new password:\"
send \"rootpassword\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
"

# Connexion à MySQL pour configurer la base de données GLPI
echo "Creation de la base de donnees GLPI et utilisateur..."
mysql -u root -prootpassword <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_HOST' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
EOF

# Téléchargement et installation de GLPI
echo "Telechargement de GLPI..."
wget https://github.com/glpi-project/glpi/releases/download/10.0.10/glpi-10.0.10.tgz

# Extraction de l'archive
echo "Extraction de GLPI..."
tar xvf glpi-10.0.10.tgz

# Déplacement de GLPI dans le répertoire web
echo "Deplacement de GLPI dans /var/www/html/"
mv glpi /var/www/html/glpi

# Installation des modules PHP nécessaires pour GLPI
echo "Installation des modules PHP requis pour GLPI..."
apt install -y php8.2-curl php8.2-gd php8.2-mbstring php8.2-zip php8.2-xml php8.2-ldap php8.2-intl php8.2-mysql php8.2-dom php8.2-simplexml php-json php8.2-phpdbg php8.2-cgi

# Changement des permissions pour Apache
echo "Changement des permissions pour Apache..."
chown -R www-data:www-data /var/www/html/glpi/
chmod -R 755 /var/www/html/glpi/

# Redémarrage d'Apache pour appliquer tous les changements
systemctl restart apache2

echo "L'installation du serveur LAMP et de GLPI est terminee."

# Connexion à GLPI (via navigateur web)
echo "Accedez a GLPI via un navigateur : http://localhost/glpi"
