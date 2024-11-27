# Configuration AD-DS sous serveur Windows 2022/core et Serveur Linux (🚨🚨🚨 A REMPLIR ! 🚨🚨🚨)
---

### 1.1. **AD-DS - Création d'un domaine Active Directory (AD)**

- **Serveur Windows Server 2022 GUI :**  
  - **Rôles installés :** AD-DS, DHCP, DNS  
  - **Actions à réaliser :**  
    #### Installation de l'Active Directory (AD DS)  

<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/001.png?raw=true" alt="Pictures" width="800" >
<br>

<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/002.png?raw=true" alt="Pictures" width="800" >
<br>

<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/003.png?raw=true" alt="Pictures" width="800" >
<br> 

:arrow_right: Une fois le rôle AD DS installé, il faut cliquer sur le drapeau jaune en haut, afin de créer un DC :  
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/004.png?raw=true" alt="Pictures" width="800" >
<br>

:arrow_right: Notre domaine va se nommer **`billu.com`**  
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/005.png?raw=true" alt="Pictures" width="800" >
<br> 
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/006.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/007.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/008.png?raw=true" alt="Pictures" width="800" >
<br>

Après redémarrage, nous pouvons nous connecter en administrateur sur le domaine `billu`  
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/009.png?raw=true" alt="Pictures" width="800" >
<br> 
:arrow_right: **Nous avons donc 3 rôles d'installés : AD DC, DNS, DHCP**  
Le serveur Windows 2022 GUI est donc bien sur le domaine `billu.com` et se nomme `SERVWIN01`.  

#### Installation du DHCP  
Toujours dans l'onglet Manage > Add rôles and features :  
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/010.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/011.png?raw=true" alt="Pictures" width="800" >
<br>

#### Paramétrage des plages d'addressage DHCP  

:arrow_right: Nous avons décidé de paramétrer les plages de façon très serrée, en ne gardant que le nombre d'employés par département. Il sera facile d'agrandir la plage d'attribution des adresses si besoin. En ne gardant aucune adresse dispo en plus, nous évitons qu'une personne malintentionnée puisse rejoindre une des VLAN.  
Pour la gestion des adresses, se référer au plan d'adressage IPv4.  
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/012.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/013.png?raw=true" alt="Pictures" width="800" >
<br>

Les plages paramétrées sur le Windows Server GUI:
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/014.png?raw=true" alt="Pictures" width="800" >
<br>



    - Vérification de la réplication et des rôles sur ce serveur.
    - 
  
- **Serveur Windows Server 2022 Core :**
  - **Rôle installé :** AD-DS
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
1. **Ouvrir Server Manager** :  
   Depuis la barre des tâches ou le menu démarrer.

2. **Accéder à Active Directory Users and Computers** :  
   Allez dans **Tools** (Outils) en haut à droite et sélectionnez **Active Directory Users and Computers**.

3. **Naviguer jusqu’à votre domaine** :  
   Dans la fenêtre, localisez votre domaine (ex. : `billu.com`).

4. **Actions sur le domaine** :  
   Faites un clic droit sur le domaine, puis suivez les étapes nécessaires.

- **Créer les OU selon vos besoins :**<br>

<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/015.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/016.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/017.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/018.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/019.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/020.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/021.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/022.png?raw=true" alt="Pictures" width="800" >
<br>


    

- **Création des groupes :**
1. **Ouvrir Server Manager** :  
   Depuis la barre des tâches ou le menu démarrer.

2. **Accéder à Active Directory Users and Computers** :  
   Allez dans **Tools** (Outils) en haut à droite et sélectionnez **Active Directory Users and Computers**.

3. **Naviguer jusqu’à votre domaine** :  
   Dans la fenêtre, localisez votre domaine (ex. :`billu.com`).

4. **Actions sur le domaine** :  
   Faites dérouler le domaine, puis suivez les étapes nécessaires.

- **Choisissez votre OU puis créer les groups selon vos besoins :**<br>

<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/023.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/024.png?raw=true" alt="Pictures" width="800" >
<br>
<br>
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/025.png?raw=true" alt="Pictures" width="800" >
<br>


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
    - Installer Debian et les configurations de base.
  
- **Sur le domaine AD-DS :**
  - **Action à réaliser :**
    - Joindre la machine Debian au domaine Active Directory (AD).
    - Configurer l'authentification via AD.

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
