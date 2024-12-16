# Documentation de l'Infrastructure Debian Server (serveur pour GLPI) 🖥️

## 1. Prérequis matériel/logiciel 📦
- **Matériel requis :**
  - Processeur : [min 1.4 GHz 64-bit]
  - Mémoire RAM : [min 2 Go]
  - Espace disque : [min 20 Go]
  - Carte réseau compatible Ethernet
- **Logiciels requis :**
  - **Système d'exploitation** : Debian 11 (ou version stable plus récente)
  - **Serveur Web** : Apache 2.x
  - **Base de données** : MySQL 5.7 ou MariaDB
  - **PHP** : PHP 7.4 ou supérieur
  - **GLPI** : Dernière version stable de GLPI
- **Version d'OS et logiciels :**
  - **OS** : Debian 11 (Bullseye) (version [x.x.x])
  - **GLPI** : Version [x.x.x] (dernière version stable)
  - **PHP** : Version [7.4/8.0]

## 2. Installation ⚙️

### Étapes d'installation 🚀
1. **Téléchargement de Debian :**  
   - Télécharger l'ISO de **Debian 11** depuis [Debian officiel](https://www.debian.org/distrib/).
2. **Préparation de l'environnement :**  
   - Créer une machine virtuelle ou utiliser un serveur physique avec les spécifications matérielles recommandées.
   - Installer Debian avec une configuration de base sans interface graphique (serveur minimal).

---

<details>
<summary><h1>⚙️ Installation Debian Server</h1></summary>

- 📸 ** Cliquer sur ``Install`` puis suivre en fonction des screens** 

![DEBIAN1](https://github.com/user-attachments/assets/9a6bd875-a12a-448e-92ed-d0570af5d208)<br>

![DEBIAN2](https://github.com/user-attachments/assets/b3fb1183-ffdd-4947-aba8-2098b8682170)<br>

![DEBIAN3](https://github.com/user-attachments/assets/978bae33-f439-4f62-a970-08b9b3491002)<br>

![DEBIAN4](https://github.com/user-attachments/assets/2e6268e5-c33f-4f26-8d21-a35f906d4611)<br>

![DEBIAN5](https://github.com/user-attachments/assets/0a9ec1ff-a4f7-4b54-9907-03ae7e00ce7a)<br>

![DEBIAN6](https://github.com/user-attachments/assets/a413f1ca-f2ed-499e-8518-6c1394df8d3a)<br>

![DEBIAN7](https://github.com/user-attachments/assets/1c6e024c-76a9-42c0-9824-d82a2f7eb4ca)<br>

![DEBIAN8](https://github.com/user-attachments/assets/54da7a81-96dc-4008-8392-5d4f0a743ae7)<br>

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

![DEBIAN20](https://github.com/user-attachments/assets/d71c2bbb-da84-4b82-9588-457a6e8fe727)<br>

![DEBIAN21](https://github.com/user-attachments/assets/82d7833f-c298-4f30-83e0-02545c971d52)<br>

![DEBIAN22](https://github.com/user-attachments/assets/86dd475a-9779-4849-ad3e-960882f5bad9)<br>

![DEBIAN23](https://github.com/user-attachments/assets/b8280f79-e3b5-4c96-9f09-dfffffb9d4e9)<br>

![DEBIAN24](https://github.com/user-attachments/assets/5b69ce07-6922-4ca3-b34d-3e9e9586551b)

</details>

---

## 3. Installation et Configuration de GLPI ⚙️

### Cible 🎯
- Serveur Debian avec GLPI installé pour la gestion du parc informatique.

### Étapes de configuration/utilisation 🔧

#### 3.1. Installation des dépendances nécessaires 🔄
1. **Mettre à jour les paquets Debian :**
   - Connectez-vous en tant que root ou avec un utilisateur ayant des privilèges sudo et mettez à jour les paquets de votre serveur :
     ```bash
     apt update && apt upgrade -y
     ```

2. **Installer Apache, PHP et les modules nécessaires :**
   - Installez le serveur web Apache et PHP avec les modules nécessaires pour GLPI :
     ```bash
     apt install apache2 mariadb-server php php-cli php-mysql php-xml php-curl php-mbstring php-json php-ldap php-zip unzip -y
     ```

3. **Installer GLPI :**
   - Télécharger la dernière version stable de GLPI depuis [le site officiel de GLPI](https://glpi-project.org/download/).
     ```bash
     cd /tmp
     wget https://github.com/glpi-project/glpi/releases/download/$(curl -s https://api.github.com/repos/glpi-project/glpi/releases/latest | jq -r .tag_name)/glpi-$(curl -s https://api.github.com/repos/glpi-project/glpi/releases/latest | jq -r .tag_name).tgz
     tar -xvzf glpi-*.tgz
     mv glpi /var/www/html/
     chown -R www-data:www-data /var/www/html/glpi
     ```

#### 3.2. Configuration de la base de données MariaDB 🔑
1. **Sécuriser MariaDB :**
   - Exécuter la commande suivante pour sécuriser l'installation de MariaDB :
     ```bash
     mysql_secure_installation
     ```

2. **Créer une base de données pour GLPI :**
   - Connectez-vous à MariaDB et créez la base de données et l'utilisateur pour GLPI :
     ```bash
     mysql -u root -p
     CREATE DATABASE glpi;
     CREATE USER 'glpiuser'@'localhost' IDENTIFIED BY 'password';
     GRANT ALL PRIVILEGES ON glpi.* TO 'glpiuser'@'localhost';
     FLUSH PRIVILEGES;
     EXIT;
     ```

#### 3.3. Configuration d'Apache pour GLPI 🖥️
1. **Configurer le fichier de configuration Apache :**
   - Créez un fichier de configuration pour GLPI dans `/etc/apache2/sites-available/glpi.conf` :
     ```bash
     nano /etc/apache2/sites-available/glpi.conf
     ```
   - Ajoutez la configuration suivante :
     ```apache
     <VirtualHost *:80>
         ServerAdmin webmaster@localhost
         DocumentRoot /var/www/html/glpi
         ServerName glpi.example.com
         ErrorLog ${APACHE_LOG_DIR}/error.log
         CustomLog ${APACHE_LOG_DIR}/access.log combined

         <Directory /var/www/html/glpi>
             AllowOverride All
             Require all granted
         </Directory>
     </VirtualHost>
     ```
2. **Activer le site GLPI et redémarrer Apache :**
   - Activer le site et le module de réécriture :
     ```bash
     a2ensite glpi.conf
     a2enmod rewrite
     systemctl restart apache2
     ```

#### 3.4. Finalisation de l'installation via l'interface Web 🌐
1. **Accéder à l'interface web de GLPI :**
   - Ouvrez un navigateur et accédez à `http://glpi.example.com`.
   - Suivez les étapes de l'assistant d'installation en sélectionnant la base de données MariaDB que vous avez configurée et en créant un compte administrateur pour GLPI.

2. **Vérification du résultat :**
   - 📸 **Résultat attendu :** L'interface web de GLPI doit être accessible et vous pouvez vous connecter avec le compte administrateur créé.

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
     ```bash
     rsync -avz /var/www/html/glpi /path/to/backup/
     mysqldump -u root -p glpi > /path/to/backup/glpi_db_backup.sql
     ```

2. **Sauvegarde et restauration des fichiers de GLPI :**
   - Utiliser `rsync` pour restaurer les fichiers de GLPI et la base de données à partir du clone miroir.
     ```bash
     rsync -avz /path/to/backup/glpi /var/www/html/
     mysql -u root -p glpi < /path/to/backup/glpi_db_backup.sql
     ```
