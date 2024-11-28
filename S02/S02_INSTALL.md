# :dart: Configuration AD-DS sous serveur Windows 2022 / serveur Windows Core et Serveur Debian :dart:

### 1.1. **AD-DS - Création d'un domaine Active Directory (AD)**

  - **Serveur Windows Server 2022 GUI :**  
  - **Rôles installés :** AD-DS, DHCP, DNS
     
#### :pencil: **Installation de l'Active Directory (AD DS) :**  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/001.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/002.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/003.png?raw=true" alt="Pictures" width="800" ><br>
 
:pencil: **Une fois le rôle AD DS installé, il faut cliquer sur le drapeau jaune en haut, afin de créer un DC :**

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/004.png?raw=true" alt="Pictures" width="800" ><br>
<br>

:pencil: **Notre domaine va se nommer `billu.com`**  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/005.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/006.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/007.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/008.png?raw=true" alt="Pictures" width="800" ><br><br>

:pencil: **Après redémarrage, nous pouvons nous connecter en administrateur sur le domaine `billu`**  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/009.png?raw=true" alt="Pictures" width="800" >


#### :pencil: **Installation du DHCP**  
Toujours dans l'onglet Manage > Add rôles and features :  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/010.png?raw=true" alt="Pictures" width="800" ><br><br>

:pencil: **Nous avons donc 3 rôles d'installés : AD DC, DNS, DHCP<br>**  
Le serveur Windows 2022 GUI est donc bien sur le domaine `billu.com` et se nomme `SERVWIN01`.  
<br><br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/011.png?raw=true" alt="Pictures" width="800" >

#### :pencil: **Paramétrage des plages d'addressage DHCP**  

Nous avons décidé de paramétrer les plages de façon très serrée, en ne gardant que le nombre d'employés par département. Il sera facile d'agrandir la plage d'attribution des adresses si besoin. En ne gardant aucune adresse dispo en plus, nous évitons qu'une personne malintentionnée puisse rejoindre une des VLAN.  
Pour la gestion des adresses, se référer au plan d'adressage IPv4.<br><br> 

<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/012.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/013.png?raw=true" alt="Pictures" width="800" ><br>

 :pencil: **Les plages paramétrées sur le Windows Server GUI :**
<br><br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/014.png?raw=true" alt="Pictures" width="800" ><br>

:pencil: **Vérification de la réplication et des rôles sur ce serveur.**
  
- **Serveur Windows Server 2022 Core :**
  - **Rôle installé :** AD-DS<br>  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/015.png?raw=true" alt="Pictures" width="800" >

<br>:pencil: Nous ajoutons le Serveur-02-Core au domaine existant donc sur le Serveur-01-Gui :<br><br>


<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/016.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/017.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/018.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/019.png?raw=true" alt="Pictures" width="800" >


### :pencil: **Installation du DHCP sur le Serveur Windows Core**
L'installation se fait en PowerShell :  
<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/020.png?raw=true" alt="Pictures" width="800" ><br><br>
:pencil: Ajout su serveur Core<br>
<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/021.png?raw=true" alt="Pictures" width="800" >


### :pencil: **Création d'une réplication du DHCP de la version GUI vers la version Core :<br>**


<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/022.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/023.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/024.png?raw=true" alt="Pictures" width="800" ><br>

<br>:pencil:Paramétrage de la réplication. Le serveur Core est en standby tant que le serveur GUI est actif. En cas de panne du serveur GUI, après 5mn le serveur Core prend le relai après les mêmes paramétrages d'adresses.<br>  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/025.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/026.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/027.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/028.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/029.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/ADDS/030.png?raw=true" alt="Pictures" width="800" >


  - **Action à réaliser :**
    - Décrire la procédure d'installation du rôle AD-DS sur un serveur Core (capture d'écran ou commandes à utiliser).
    - Vérification de la réplication et des rôles sur ce serveur.

  
- **Les deux serveurs sont des contrôleurs de domaine (DC) :**
  - **Action à réaliser :**
    - Configurer les deux serveurs comme contrôleurs de domaine.
    - Tester la réplication complète gérée entre les deux serveurs DC.

---

### 1.2. **AD-DS - Gestion de l'arborescence AD**

- **Création des Unités Organisationnelles (OU) :**

:pencil: 1. **Ouvrir Server Manager** :  
   Depuis la barre des tâches ou le menu démarrer.

:pencil: 2. **Accéder à Active Directory Users and Computers** :  
   Allez dans **Tools** (Outils) en haut à droite et sélectionnez **Active Directory Users and Computers**.

:pencil: 3. **Naviguer jusqu’à votre domaine** :  
   Dans la fenêtre, localisez votre domaine (ex. : `billu.com`).

:pencil: 4. **Actions sur le domaine** :  
   Faites un clic droit sur le domaine, puis suivez les étapes nécessaires.

- **Créer les OU selon vos besoins :**<br><br>

<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/OU/001.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/OU/002.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/OU/003.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/OU/004.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/OU/005.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/OU/006.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/OU/007.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/OU/008.png?raw=true" alt="Pictures" width="800" ><br><br>



    

- **Création des groupes :**

:pencil: 1. **Ouvrir Server Manager** :  
   Depuis la barre des tâches ou le menu démarrer.

:pencil: 2. **Accéder à Active Directory Users and Computers** :  
   Allez dans **Tools** (Outils) en haut à droite et sélectionnez **Active Directory Users and Computers**.

:pencil: 3. **Naviguer jusqu’à votre domaine** :  
   Dans la fenêtre, localisez votre domaine (ex. :`billu.com`).

:pencil: 4. **Actions sur le domaine** :  
   Faites dérouler le domaine, puis suivez les étapes nécessaires.

- **Choisissez votre OU puis créer les groups selon vos besoins :**<br><br>

<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/GROUP/001.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES//GROUP/002.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES//GROUP/003.png?raw=true" alt="Pictures" width="800" ><br><br>


---

### 1.3. **AD-DS - Intégration des utilisateurs**

- **Création des comptes utilisateurs selon un fichier :**
  - **Action à réaliser :**
    - Utiliser un fichier (CSV) pour créer les comptes utilisateurs en masse.
    - Placer les utilisateurs dans les groupes et OU correspondants.


- **Méthodes :**
  - **Gestion manuelle :** Ajouter les utilisateurs via l'interface.
  - **Gestion automatisée :** Ajouter les utilisateurs via script PowerShell.
  

---

### 1.4. **Création d'une VM Serveur Linux Debian**

- **VM ou CT en CLI :**
  - **Action à réaliser :**
    - Créer une machine virtuelle (VM) ou un conteneur (CT) sous Debian via Proxmox.
      - Nom  : `G1-SRVLX-01-CLI`
      - ID   : `945`
      - IP   : `172.18.255.252`
    - Installer Debian et les configurations de base.
      - `apt update && apt upgrade -y`
  
- **Sur le domaine AD-DS :**
  - **Action à réaliser :**
    - Joindre la machine Debian au domaine Active Directory (AD).
      :pencil: 1 - `apt install packagekit samba-common-bin sssd-tools sssd libnss-sss libpam-sss policykit-1 sssd ntpdate ntp realmd`  
        <br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/Debian_AD/001.PNG?raw=true" alt="Pictures" width="800" ><br>  
      :pencil: 2 - Modifier le fichier `resolv.conf` avec `nameserver 172.18.255.254`, `nameserver 1.1.1.1 (opt)` et `search billu.com`  
        <br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/Debian_AD/002.PNG?raw=true" alt="Pictures" width="800" ><br>  
      :pencil: 3 - Modifier le fichier `interfaces` avec `iface ens18 inet static`, `address 172.18.255.252/24` et `gateway 172.18.255.254`  
        <br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/Debian_AD/003.PNG?raw=true" alt="Pictures" width="800" ><br>  
      :pencil: 4 - Modifier le fichier `hostname` avec `SRVLX-01-CLI.billu.com`  
        <br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/Debian_AD/004.PNG?raw=true" alt="Pictures" width="800" ><br>  

      **Configurer l'authentification via AD.<br><br>**
      :pencil: 1 - Se connecter au domaine avec `realm join --user=administrator billu.com`  
     <br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/Debian_AD/005.PNG?raw=true" alt="Pictures" width="800" ><br>  
      :pencil: 2 - Renseigner le mot de passe  
      <br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/Debian_AD/006.PNG?raw=true" alt="Pictures" width="800" ><br>  
      :pencil: 3 - Afficher le résumé avec `realm list`  
      <br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/Debian_AD/007.PNG?raw=true" alt="Pictures" width="800" ><br>  
    

- **Accès SSH :**
  - **Action à réaliser :**
    - Configurer l'accès SSH à la machine Debian pour les administrateurs du domaine.
    - Assurer que seuls les administrateurs du domaine peuvent se connecter en SSH.
    - Créer un script Bash pour la gestion manuelle / automatique.


- **Gestion manuelle / automatique par script shell Bash :**
  - **Action à réaliser :**
    - Créer un script Bash pour automatiser certaines configurations.
  - **Tests à effectuer :**
    - Vérifier que le script fonctionne correctement et exécute les actions attendues.

---

## 2. Réseau (sous Proxmox)

### 2.1. **Plage d'adresses IP**

- **Plage d'adresses réseau :**
  - **Adresse IP de réseau :** 172.18.0.0/16
  - **Adresse de passerelle :** 172.18.255.254
  - **Adresse IP DNS :** 172.18.255.254

  **Action à réaliser :**
  - Configurer le réseau sur Proxmox avec ces paramètres.
