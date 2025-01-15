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

</details>
