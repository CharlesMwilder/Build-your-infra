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
127.0.0.1   mail.billu.com mail localhost localhost.localdomain
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
wget https://github.com/iredmail/iRedMail/archive/refs/tags/1.7.1.tar.gz -O /root/iRedMail-1.7.1.tar.gz
```

Remplacez x.y.z par la version téléchargée.

Décompressez l’archive :

```
tar zxf iRedMail-1.7.1.tar.gz
```

Installation d’iRedMail
Accédez au répertoire d’iRedMail :

```
cd iRedMail-1.7.1
```

Lancez l’installateur :

```
bash ./iRedMail.sh
```
---

## Captures d'écran de l'installation:

Installation :

![INSTALL IREDMAIL 1](https://github.com/user-attachments/assets/dd2430b8-ce52-4686-9322-dcee2ca0e5b3)

Spécifiez l'emplacement pour stocker toutes les boîtes aux lettres. Par défaut est ``/var/vmail/`` :

![INSTALL IREDMAIL 2](https://github.com/user-attachments/assets/6cbbeb06-a751-4e30-aacf-ca48bc05bfc4)

Choisissez le backend utilisé pour stocker les comptes de messagerie. Vous pouvez gérer les comptes de messagerie avec iRedAdmin, notre panneau d'administration iRedMail basé sur le Web :

![INSTALL IREDMAIL 4](https://github.com/user-attachments/assets/1446560a-482f-4bbf-bddb-f47b17641ea2)

Si vous choisissez de stocker des comptes de messagerie dans OpenLDAP, le programme d'installation iRedMail demander de définir le suffixe LDAP :

![INSTALL IREDMAIL 5](https://github.com/user-attachments/assets/d0162475-4459-41e7-a008-19d6a58246d4)

Ajoutez votre premier nom de domaine de messagerie :

![INSTALL IREDMAIL 7](https://github.com/user-attachments/assets/823485a6-f0a2-4c3d-b956-98944edcaa2f)

Définissez le mot de passe du compte administrateur de votre premier domaine de messagerie :

![INSTALL IREDMAIL 8](https://github.com/user-attachments/assets/e8fc6943-2f26-4ed8-8f8c-b6db3db29779)

Choisissez des composants optionnels :

![INSTALL IREDMAIL 9](https://github.com/user-attachments/assets/3b91d32c-1a7e-4912-9d6a-4413ca0ff2f9)<br>

Après avoir répondu aux questions ci-dessus, l'installateur iRedMail vous demandera de confirmer pour commencer l'installation. Il installera et configurera les paquets requis automatiquement. Rentre ``y`` ou ``Y`` et presse ``Enter`` pour commencer :

![INSTALL IREDMAIL 10](https://github.com/user-attachments/assets/cbff53f5-0778-4faa-bb71-44e5cd9109fe)<br>

![INSTALL IREDMAIL 11](https://github.com/user-attachments/assets/a2559935-34cd-47c7-9496-178c9c08983e)

Puis connectez-vous via ``http://<IP_OU_DNS_DU_SERVEUR/mail/ ``:

![INSTALL IREDMAIL 12](https://github.com/user-attachments/assets/2fc148b0-7271-4a57-ba51-e86fc69e92e4)<br>

![INSTALL IREDMAIL 13](https://github.com/user-attachments/assets/79544181-8cad-47b0-adc9-df712516a3cd)


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
