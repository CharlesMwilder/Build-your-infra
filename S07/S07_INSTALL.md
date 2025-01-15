<details>
<summary><h1>🎯 Installation du serveur de messagerie iRedMail<h1></summary>


### Configuration du FQDN (Fully Qualified Domain Name)
1. Vérifiez le FQDN actuel :
   
```
hostname -f
```
   
Si le FQDN n’est pas configuré correctement :

Modifiez  ``/etc/hostname `` et ajoutez le nom d’hôte court (ex. mail).<br>
Modifiez  ``/etc/hosts `` pour inclure le FQDN. Exemple :

 ```
127.0.0.1   mail.example.com mail localhost localhost.localdomain
 ```

Redémarrez le serveur si nécessaire, puis vérifiez de nouveau :

 ```
hostname -f
 ```

Préparation du système<br>
Assurez-vous que les dépôts Debian officiels sont activés :<br>
Modifiez ``/etc/apt/sources.list`` si nécessaire.<br>
Installez les dépendances nécessaires :

 ```
apt update
apt install -y gzip dialog
 ```
Téléchargement et extraction d’iRedMail<br>
Téléchargez la dernière version stable d’iRedMail depuis la page officielle. Exemple avec wget :

```
wget https://github.com/iredmail/iRedMail/archive/refs/tags/x.y.z.tar.gz -O /root/iRedMail-x.y.z.tar.gz
```

Remplacez x.y.z par la version téléchargée.

Décompressez l’archive :

```
tar zxf iRedMail-x.y.z.tar.gz
```

Installation d’iRedMail
Accédez au répertoire d’iRedMail :

```
cd iRedMail-x.y.z
```

Lancez l’installateur :

```
bash ./iRedMail.sh
```

Suivez les étapes de l’assistant :

Spécifiez l’emplacement des boîtes mail ``(par défaut : /var/vmail/)``.

Choisissez le backend pour les comptes utilisateurs :

OpenLDAP, MariaDB/MySQL ou PostgreSQL.

Si vous sélectionnez ``MariaDB/MySQL/PostgreSQL``, un mot de passe fort sera généré pour vous et sera disponible dans le fichier ``/root/iRedMail.tips``.

Ajoutez le domaine de messagerie principal.

Configurez le mot de passe pour l’administrateur du domaine.

Sélectionnez les composants optionnels :

Roundcube (webmail rapide et léger) ou SOGo (webmail avec gestion des calendriers et contacts).

Il est possible d’installer les deux, mais notez que les filtres mail entre les deux ne sont pas compatibles.

Validez et démarrez l’installation en tapant y ou Y.

Configuration post-installation

Lire les informations importantes :

Le fichier ``/root/iRedMail-x.y.z/iRedMail.tips``contient :

Les URLs, identifiants et mots de passe des applications web.

Les emplacements des fichiers de configuration principaux.

Configurer les enregistrements DNS :

Ajoutez les enregistrements nécessaires (MX, SPF, DKIM, DMARC).

Installer un certificat SSL :

Installez Certbot :

```
apt install certbot python3-certbot-nginx -y
```

Obtenez un certificat avec Let's Encrypt :

```
certbot --nginx -d mail.example.com
```

Redémarrez Nginx :

```
nginx -t && systemctl reload nginx
```

Accès aux applications web

Roundcube : ``https://your_server/mail/``

SOGo Groupware : ``https://your_server/SOGo``

Panneau d’administration iRedAdmin : ``https://<IP_ou_nom_du_serveur>/iredadmin/``

# Bonnes pratiques

Forcez l’utilisation de mots de passe forts.

Sauvegardez régulièrement :

Sauvegardez ``/etc/iredmail/`` et les bases de données.

Mettez à jour le système régulièrement :

```
apt update && sudo apt upgrade -y
```

</details>

---


<details>
<summary><h1>🎯 Installation du serveur de gestion de mot de passe Passbolt<h1></summary>

# Installation de Passbolt CE sur Debian

## Configuration du dépôt de paquets Passbolt

Pour simplifier l'installation et les mises à jour, Passbolt fournit un dépôt de paquets à configurer avant de télécharger et d’installer Passbolt CE.

## Étape 1 : Téléchargez le script d'installation des dépendances

```
curl -LO https://download.passbolt.com/ce/installer/passbolt-repo-setup.ce.sh
```

## Étape 2 : Téléchargez le fichier SHA512SUM pour le script

```
curl -LO https://github.com/passbolt/passbolt-dep-scripts/releases/latest/download/passbolt-ce-SHA512SUM.txt
```

## Étape 3 : Vérifiez et exécutez le script

```
sha512sum -c passbolt-ce-SHA512SUM.txt && sudo bash ./passbolt-repo-setup.ce.sh || echo "Bad checksum. Aborting" && rm -f passbolt-repo-setup.ce.sh
```

Installation de Passbolt
Installez le paquet officiel :

```
apt install passbolt-ce-server
```

Configuration de MariaDB
Passbolt configure MariaDB localement par défaut. Voici les étapes pour créer une base de données dédiée :

Configuration des utilisateurs et de la base :

Fournissez les informations d’identification de l’administrateur MariaDB (généralement root sans mot de passe).

Créez un utilisateur avec des permissions réduites pour Passbolt.

Définissez un nom pour la base de données.

Gardez les identifiants en mémoire, ils seront requis lors de la configuration.

Configuration de Nginx pour HTTPS

Deux options sont disponibles pour configurer Nginx et SSL :

Automatique : Utilisation de Let's Encrypt.

Manuelle : Fournissez vos propres certificats SSL.

Configuration de Passbolt

Accédez au nom d'hôte ou à l'adresse IP du serveur dans un navigateur pour commencer la configuration.

## Étape 1 : Vérification de l’environnement
Résolvez les problèmes signalés par le diagnostic, puis cliquez sur "Start configuration".

## Étape 2 : Configuration de la base de données
Fournissez les informations suivantes :

```
Hôte
Port
Nom de la base
```

Identifiants utilisateur (nom d'utilisateur et mot de passe).

## Étape 3 : Configuration de la clé GPG

Générez ou importez une paire de clés GPG utilisée par l’API Passbolt pour l’authentification.

Génération automatique :

```
gpg --batch --no-tty --gen-key <<EOF
  Key-Type: default
  Key-Length: 2048
  Subkey-Type: default
  Subkey-Length: 2048
  Name-Real: John Doe
  Name-Email: email@domain.tld
  Expire-Date: 0
  %no-protection
  %commit
EOF
```

Remplacez John Doe et email@domain.tld par vos informations.

## Étape 4 : Configuration du serveur SMTP
Entrez les informations de votre serveur SMTP (hôte, port, utilisateur, mot de passe) et testez la configuration avec l’option "Send test email".

## Étape 5 : Préférences
Ajustez les préférences par défaut si nécessaire.

## Étape 6 : Création du premier utilisateur
Créez le premier compte administrateur en fournissant vos informations personnelles.

Finalisation de l'installation
Attendez la fin de la configuration automatique.
Vous serez redirigé vers la configuration de votre compte utilisateur.

## Étape 1 : Téléchargez le plugin navigateur
Installez l'extension Passbolt pour votre navigateur.

## Étape 2 : Générez ou importez une clé
Cette clé servira à identifier et chiffrer vos mots de passe. Protégez-la avec un mot de passe fort.

## Étape 3 : Téléchargez le kit de récupération
Conservez une copie sécurisée de votre clé et de son kit de récupération.

## Étape 4 : Définissez un jeton de sécurité
Choisissez un code couleur et un jeton à trois caractères pour prévenir les attaques de phishing.

Votre compte administrateur est prêt !
Connectez-vous à l’interface de Passbolt pour commencer à l’utiliser.


</details>
