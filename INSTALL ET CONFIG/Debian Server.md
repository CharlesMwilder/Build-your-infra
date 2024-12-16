# Documentation de l'Infrastructure Debian Server (serveur pour GLPI) 🖥️

## 1. Prérequis matériel/logiciel 📦
- **Matériel requis :**
  - Processeur : ``1 sockets, 1 cores``
  - Mémoire RAM : ``2 Go``
  - Espace disque : ``32 Go``
  - Carte réseau compatible Ethernet
- **Logiciels requis :**
  - **Système d'exploitation** : ``Debian 11 (ou version stable plus récente)``
  - **Serveur Web** : ``Apache 2``
  - **Base de données** : ``MariaDB``
  - **PHP** : ``PHP 7.4 ou supérieur``
  - **GLPI** : ``Dernière version stable de GLPI``
- **Version d'OS et logiciels :**
  - **OS** : ``Debian 12``
  - **GLPI** : ``glpi-10.0.10.tgz``
  - **PHP** : ``PHP 8.2``

## 2. Installation ⚙️

### Étapes d'installation 🚀
1. **Téléchargement de Debian :**  
   - Télécharger l'ISO de **Debian 11** depuis (https://drive.google.com/file/d/13ZibGJ5vX_446PvBADNQ_M4zILJtSIA8/view).
2. **Préparation de l'environnement :**  
   - Créer une machine virtuelle ou utiliser un serveur physique avec les spécifications matérielles recommandées.
   - Installer Debian avec une configuration de base sans interface graphique (serveur minimal).

---

<details>
<summary><h1>⚙️ Installation Debian Server</h1></summary>

- 📸 Cliquer sur ``Install`` puis suivre l'installation en fonction des screens 

![DEBIAN1](https://github.com/user-attachments/assets/9a6bd875-a12a-448e-92ed-d0570af5d208)<br>

![DEBIAN2](https://github.com/user-attachments/assets/b3fb1183-ffdd-4947-aba8-2098b8682170)<br>

![DEBIAN3](https://github.com/user-attachments/assets/978bae33-f439-4f62-a970-08b9b3491002)<br>

![DEBIAN4](https://github.com/user-attachments/assets/2e6268e5-c33f-4f26-8d21-a35f906d4611)<br>

![DEBIAN5](https://github.com/user-attachments/assets/0a9ec1ff-a4f7-4b54-9907-03ae7e00ce7a)<br>

- 📸 Choisissez un mot de passe pour le compte Administrateur et cliquer sur ``Continuer``

![DEBIAN6](https://github.com/user-attachments/assets/a413f1ca-f2ed-499e-8518-6c1394df8d3a)<br>

![DEBIAN7](https://github.com/user-attachments/assets/1c6e024c-76a9-42c0-9824-d82a2f7eb4ca)<br>

![DEBIAN8](https://github.com/user-attachments/assets/54da7a81-96dc-4008-8392-5d4f0a743ae7)<br>

- 📸 Choisissez un mot de passe pour le compte ``Utilisateur`` et cliquer sur ``Continuer``

![DEBIAN9](https://github.com/user-attachments/assets/c9f9a2c9-9c1f-4997-b31c-831ddd260609)<br>

![DEBIAN10](https://github.com/user-attachments/assets/ba6a5a4d-5102-4e00-b473-a0e6fc13f8ca)<br>

![DEBIAN11](https://github.com/user-attachments/assets/4ff12fe9-53e6-4aec-9c71-400040e0ebd5)<br>

![DEBIAN12](https://github.com/user-attachments/assets/61370b17-f00f-4a16-b0a9-ea6f27ee9118)<br>

![DEBIAN13](https://github.com/user-attachments/assets/027f6a68-13b5-473c-b90a-e4f94ee6aa49)<br>

![DEBIAN14](https://github.com/user-attachments/assets/febc00de-748f-46e5-a880-87aa9fc6c86b)<br>

![DEBIAN15](https://github.com/user-attachments/assets/20dd3d09-3b62-481f-bf1f-0fdb3c606747)<br>

![DEBIAN16](https://github.com/user-attachments/assets/00d6c650-25ff-44f8-9ad6-2d765854b2dd)<br>

![DEBIAN17](https://github.com/user-attachments/assets/9af1e23f-f5e4-4912-8d02-4896906f6375)<br>

![DEBIAN18](https://github.com/user-attachments/assets/1a3f1976-0b77-4286-9ead-f81b7fe630d3)<br>

![DEBIAN19](https://github.com/user-attachments/assets/70c19a80-dcce-4339-95f3-619ec543e508)<br>

- 📸 Cocher seulement ``Serveur SSH et les utilitaires`` puis cliquer sur ``Continuer``

![DEBIAN20](https://github.com/user-attachments/assets/d71c2bbb-da84-4b82-9588-457a6e8fe727)<br>

![DEBIAN21](https://github.com/user-attachments/assets/82d7833f-c298-4f30-83e0-02545c971d52)<br>

![DEBIAN22](https://github.com/user-attachments/assets/86dd475a-9779-4849-ad3e-960882f5bad9)<br>

![DEBIAN23](https://github.com/user-attachments/assets/b8280f79-e3b5-4c96-9f09-dfffffb9d4e9)<br>

- 📸 Une fois que le serveur à redémarrer, connecter vous et tout est bon 👍

![DEBIAN24](https://github.com/user-attachments/assets/5b69ce07-6922-4ca3-b34d-3e9e9586551b)

</details>

---


<details>
<summary><h1>⚙️ Installation et Configuration de GLPI via script</h1></summary>

- 📸 Configurer le fichier de config.txt puis lancer l'installation et la configuration de façon autonome grâce au script

# Configuration pour script install GLPI

```
## Variables modifiables en fonction de votre configuration
DB_NAME=glpi
DB_USER=billu
DB_PASSWORD=Azerty1*
DB_HOST=localhost
```

- 📸 Puis lancer l'installation et la configuration de façon autonome grâce au script

```
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
```

</details>

---

#### 3.4. Finalisation de l'installation via l'interface Web 🌐
1. **Accéder à l'interface web de GLPI :**
   - Ouvrez un navigateur et accédez à `http://<ip-du-serveur-GLPI>ou<nom-du-serveur-si-DNS>/glpi`.

2. **Vérification du résultat :**

![392963490-99c60c91-80e5-4bce-a74d-69b85e29e6be](https://github.com/user-attachments/assets/0ba0b1eb-a36f-4670-9df3-081111f22f50)<br>
![392963512-3ff82d21-aeb8-4909-9ed3-524b1166acbd](https://github.com/user-attachments/assets/c3b0ff78-24e0-4f29-aee9-636a081574af)

---

## 4. FAQ ❓
- **Problème : GLPI n'arrive pas à se connecter à la base de données.**
  - **Solution :** Vérifiez que les paramètres de connexion à la base de données dans le fichier de configuration de GLPI sont corrects et que le service MariaDB fonctionne correctement.
  
- **Problème : Apache ne démarre pas après la configuration.**
  - **Solution :** Vérifiez les erreurs dans les fichiers journaux d'Apache et assurez-vous que la syntaxe du fichier de configuration est correcte.

- **Problème : Les pages de GLPI sont lentes à charger.**
  - **Solution :** Vérifiez les logs d'Apache et activez le cache dans la configuration de PHP pour améliorer les performances.

## 5. Optimisation 🏎️

### Choix du hardware 💻
- Pour un serveur **Debian avec GLPI** :
  - Processeur : 2 cœurs ou plus.
  - RAM : 4 Go minimum.
  - Disque : SSD de 50 Go ou plus pour de meilleures performances.

### Mise à jour régulière du système 🔄
- **Recommandations :**  
  - Configurer **apt** pour effectuer des mises à jour automatiques des paquets de sécurité.
  - Vérifier les mises à jour de GLPI chaque mois et les installer dès qu'une nouvelle version est disponible.

## 6. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾
1. **Créer un clone miroir avec `rsync` :**
   - Utiliser `rsync` pour sauvegarder les fichiers de GLPI et la base de données MariaDB.

 `` rsync -avz /var/www/html/glpi /path/to/backup/``<br>
 ``mysqldump -u root -p glpi > /path/to/backup/glpi_db_backup.sql``


2. **Sauvegarde et restauration des fichiers de GLPI :**
   - Utiliser `rsync` pour restaurer les fichiers de GLPI et la base de données à partir du clone miroir.
   
 ``rsync -avz /path/to/backup/glpi /var/www/html/``<br>
 ``mysql -u root -p glpi < /path/to/backup/glpi_db_backup.sql``
