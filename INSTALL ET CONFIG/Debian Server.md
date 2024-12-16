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
3. **Installation pas-à-pas :**
   - 📸 **Étape 1 :** Démarrer à partir du support d'installation de Debian.
   - 📸 **Étape 2 :** Sélectionner l'option d'installation minimale (serveur sans interface graphique).
   - 📸 **Étape 3 :** Configurer les paramètres de base comme la langue, le partitionnement du disque et les paramètres réseau.
4. **Vérification du résultat :**
   - 📸 **Résultat attendu :** Serveur Debian installé et accessible via SSH (si configuré) ou directement à la console.

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

### Documentation à jour 📜
- La documentation doit être mise à jour après chaque mise à jour majeure de GLPI, de la base de données, ou de Debian pour s'assurer qu'elle reflète correctement la configuration actuelle.
  - **Exemple de mise à jour :** Après une mise à jour de GLPI ou de PHP, mettez à jour les instructions d'installation et de configuration pour inclure les nouvelles options.

---

Merci de maintenir cette documentation à jour pour garantir une gestion efficace de l'infrastructure. 📅
