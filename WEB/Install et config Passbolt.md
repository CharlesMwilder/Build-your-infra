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
  Name-Real: billu
  Name-Email: wcs.wilder@mailo.com
  Expire-Date: 0
  %no-protection
  %commit
EOF
```

Remplacez Billu et wcs.wilder@mailo.com par vos informations.

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
