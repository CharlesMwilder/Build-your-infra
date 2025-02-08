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
