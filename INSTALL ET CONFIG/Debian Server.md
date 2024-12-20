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

<br>
<details>
<summary><h1>⚙️ Installation et Configuration de GLPI via script</h1></summary>

- 📸 Configurer le fichier de config.txt puis lancer l'installation et la configuration de façon autonome grâce au script

## Configuration pour script install GLPI

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
<br>
<details>
<summary><h1>⚙️ Connexion GLPI</h1></summary>

- 📸 Connexion à GLPI via un navigateur web en rentrant soit l'ip du serveur ou alors le nom de domaine via ``DNS``

![392963490-99c60c91-80e5-4bce-a74d-69b85e29e6be](https://github.com/user-attachments/assets/0ba0b1eb-a36f-4670-9df3-081111f22f50)<br>

- 📸 Après avoir rentré vos identifiants vous voilà connecté 👍

![392963512-3ff82d21-aeb8-4909-9ed3-524b1166acbd](https://github.com/user-attachments/assets/c3b0ff78-24e0-4f29-aee9-636a081574af)

</details>

---

<br>
<details>
<summary><h1>⚙️ Configuration LDAP</h1></summary>

- 📸 Récupération de l'annuaire LDAP (domaine billu.com)

![ADDS 1](https://github.com/user-attachments/assets/52c67a29-deff-4821-9a78-84050113913e)<br>

![ADDS 2](https://github.com/user-attachments/assets/d0f486cd-041b-41b4-b08c-5aea5de252ee)<br>

![ADDS 3](https://github.com/user-attachments/assets/0fe41fd6-4e53-4391-932d-88ee466d322d)<br>

![ADDS 4](https://github.com/user-attachments/assets/273f4cd9-16da-4118-926d-f8984484ffa1)<br>


- 📸 Ajouts des utilisateurs sur GLPI via LDAP (domaine billu.com)

![ADDUSER1](https://github.com/user-attachments/assets/5bf17ac1-1652-4218-9380-0876c00efd41)<br>

![ADDUSER2](https://github.com/user-attachments/assets/cd516ff8-858a-4a08-a7be-c275e6015c6a)<br>

![ADDUSER3](https://github.com/user-attachments/assets/be6d4337-b690-456e-b69c-e0b89f98eeed)<br>

![ADDUSER4](https://github.com/user-attachments/assets/9f369c7f-9376-4bc0-9d6f-9634b1da6c74)<br>

![ADDUSER5](https://github.com/user-attachments/assets/03fa50c5-a7bd-4e9a-80e2-5c9d651d66e8)<br>

![ADDUSER6](https://github.com/user-attachments/assets/dd9fa51d-65af-4e04-aa23-a25e898d10f7)<br>

![ADDUSER7](https://github.com/user-attachments/assets/4a08e289-3ab3-442b-9e62-d435efa08120)<br>

![ADDUSER8](https://github.com/user-attachments/assets/fc7ca479-47b3-4b84-ac75-1b0ba7f4d258)<br>


- 📸 Ajouts des groupes sur GLPI via LDAP (domaine billu.com)


![ADDGROUP1](https://github.com/user-attachments/assets/2d5e1690-c20f-4ddc-b9f7-04f41e492236)<br>

![ADDGROUP2](https://github.com/user-attachments/assets/41ddb9ca-16d5-4f08-9d86-8204c5093339)<br>

![ADDGROUP3](https://github.com/user-attachments/assets/7310e0f8-e455-4554-a972-e8da90764d43)<br>

![ADDGROUP4](https://github.com/user-attachments/assets/e12da41c-9566-4454-be53-2e6e6381875c)<br>

![ADDGROUP5](https://github.com/user-attachments/assets/636e4a1a-85f6-4ba8-8b3e-92b0f0a48d93)<br>

![ADDGROUP6](https://github.com/user-attachments/assets/14d8aa27-dc5a-4dfe-b11a-9eb3702aa819)<br>


- 📸 Synchronisation des utilisateurs à leurs groupes sur GLPI via LDAP (domaine billu.com)

![SYNC1](https://github.com/user-attachments/assets/d0ba0ebe-9bb5-4a48-8269-8834531e703f)<br>

![SYNC2](https://github.com/user-attachments/assets/9025a3cf-8349-4b6c-8a4c-2acbdcbf82ce)<br>

![SYNC3](https://github.com/user-attachments/assets/b286473a-6cf0-463d-b171-91ec3f26438e)<br>

![SYNC4](https://github.com/user-attachments/assets/eae73747-65df-4ea6-8026-98d6a9c798dd)<br>

![SYNC5](https://github.com/user-attachments/assets/b2e64cd4-841c-4d7b-af4c-beb7be70a3a0)<br>

</details>

---

<br>
<details>
<summary><h1>⚙️ Ticketing GLPI</h1></summary>
  
- 📸 Réception, traitement et clos du ticket d'un utilisateur sur le compte admin (billu.com)


![009](https://github.com/user-attachments/assets/9fec810e-85d2-4e94-b099-19908a7b579c)<br>

![010](https://github.com/user-attachments/assets/eb27abf3-6b5d-4608-9b8b-0369c4681e33)<br>

![011](https://github.com/user-attachments/assets/3cabd561-ddf2-43c5-ae6a-6eb0fa62efd5)<br>

![012](https://github.com/user-attachments/assets/51a97bd4-2a3a-4d45-b36b-838ce8c23e73)<br>

![013](https://github.com/user-attachments/assets/bad969c0-ecac-4268-8cac-0955cf0bb0c0)<br>

</details>

---

## 3. FAQ ❓
- **Problème : GLPI n'arrive pas à se connecter à la base de données.**
  - **Solution :** Vérifiez que les paramètres de connexion à la base de données dans le fichier de configuration de GLPI sont corrects et que le service MariaDB fonctionne correctement.
  
- **Problème : Apache ne démarre pas après la configuration.**
  - **Solution :** Vérifiez les erreurs dans les fichiers journaux d'Apache et assurez-vous que la syntaxe du fichier de configuration est correcte.

- **Problème : Les pages de GLPI sont lentes à charger.**
  - **Solution :** Vérifiez les logs d'Apache et activez le cache dans la configuration de PHP pour améliorer les performances.

## 4. Optimisation 🏎️

### Choix du hardware 💻
- Pour un serveur **Debian avec GLPI** :
  - Processeur : 2 cœurs ou plus.
  - RAM : 4 Go minimum.
  - Disque : SSD de 50 Go ou plus pour de meilleures performances.

### Mise à jour régulière du système 🔄
- **Recommandations :**  
  - Configurer **apt** pour effectuer des mises à jour automatiques des paquets de sécurité.
  - Vérifier les mises à jour de GLPI chaque mois et les installer dès qu'une nouvelle version est disponible.

## 5. Restauration rapide en cas de défaillance 🔄

EN COURS...
