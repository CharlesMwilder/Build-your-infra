# :dart: Configuration AD-DS sous serveur Windows 2022 / serveur Windows Core et Serveur Debian :dart:

### 1.1. **AD-DS - Création d'un domaine Active Directory (AD)**

  - **Serveur Windows Server 2022 GUI :**  
  - **Rôles installés :** AD-DS, DHCP, DNS
     
#### :pencil: **Installation de l'Active Directory (AD DS) :**  

<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/001.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/002.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/003.png?raw=true" alt="Pictures" width="800" ><br>
 
:pencil: **Une fois le rôle AD DS installé, il faut cliquer sur le drapeau jaune en haut, afin de créer un DC :**

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/004.png?raw=true" alt="Pictures" width="800" ><br>
<br>

:pencil: **Notre domaine va se nommer `billu.com`**  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/005.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/006.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/007.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/008.png?raw=true" alt="Pictures" width="800" ><br><br>


:pencil: **Après redémarrage, nous pouvons nous connecter en administrateur sur le domaine `billu`**  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/009.png?raw=true" alt="Pictures" width="800" ><br><br>

:pencil: **Nous avons donc 3 rôles d'installés : AD DC, DNS, DHCP**  
Le serveur Windows 2022 GUI est donc bien sur le domaine `billu.com` et se nomme `SERVWIN01`.  

#### :pencil: **Installation du DHCP**  
Toujours dans l'onglet Manage > Add rôles and features :  

<br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/010.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/011.png?raw=true" alt="Pictures" width="800" ><br><br>

#### :pencil: **Paramétrage des plages d'addressage DHCP**  

Nous avons décidé de paramétrer les plages de façon très serrée, en ne gardant que le nombre d'employés par département. Il sera facile d'agrandir la plage d'attribution des adresses si besoin. En ne gardant aucune adresse dispo en plus, nous évitons qu'une personne malintentionnée puisse rejoindre une des VLAN.  
Pour la gestion des adresses, se référer au plan d'adressage IPv4.  

<br><br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/012.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/013.png?raw=true" alt="Pictures" width="800" ><br><br>

 :pencil: **Les plages paramétrées sur le Windows Server GUI :**
<br><br><br><img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/014.png?raw=true" alt="Pictures" width="800" ><br><br>

:pencil: **Vérification de la réplication et des rôles sur ce serveur.**
  
- **Serveur Windows Server 2022 Core :**
  - **Rôle installé :** AD-DS
 ![Capture d'écran 2024-11-27 164826](https://github.com/user-attachments/assets/1993f8b3-d536-4646-ba71-e6cea59e736c)
Nous ajoutons le Serveur-02-Core au domaine existant donc sur le Serveur-01-Gui :
![Capture d'écran 2024-11-27 164909](https://github.com/user-attachments/assets/36f667bc-fd9b-4677-99ed-2d088651ca16)
![Capture d'écran 2024-11-27 182116](https://github.com/user-attachments/assets/9285a936-d885-44ee-8ddd-b36ee2c334a2)
![Capture d'écran 2024-11-28 100340](https://github.com/user-attachments/assets/439daea6-b78c-456d-a702-a8a04673ea02)
![Capture d'écran 2024-11-28 100349](https://github.com/user-attachments/assets/18b66b28-f528-4fab-a19d-3188e04d689f)


### :pencil: **Installation du DHCP sur le Serveur Windows Core**
L'installation se fait en PowerShell :  
![Capture d'écran 2024-11-27 191219](https://github.com/user-attachments/assets/54a86448-6c56-4bfb-a026-bfe6b673249d)

### :pencil: **Ajout du serveur DHCP du Windows Core sur le contrôleur de domaine billu.com du windows Server GUI**
![Capture d'écran 2024-11-27 192449](https://github.com/user-attachments/assets/343cb8d5-c92f-415a-bd18-653fcab5d00e)


### :pencil: **Création d'une réplication du DHCP de la version GUI vers la version Core :**

![Capture d'écran 2024-11-27 192652](https://github.com/user-attachments/assets/95542a2d-8ef7-467b-b642-6e311e958dd7)
Ajout su serveur Core
![Capture d'écran 2024-11-27 192747](https://github.com/user-attachments/assets/11b4534d-6650-4487-8b9f-bf2eff734321)
![Capture d'écran 2024-11-27 192821](https://github.com/user-attachments/assets/cc0f53e8-1809-4000-bac4-26411e852785)
Paramétrage de la réplication. Le serveur Core est en standby tant que le serveur GUI est actif. En cas de panne du serveur GUI, après 5mn le serveur Core prend le relai après les mêmes paramétrages d'adresses.  

![Capture d'écran 2024-11-27 193331](https://github.com/user-attachments/assets/76ac6efd-f42f-4e77-af77-702b67c595b3)  
![Capture d'écran 2024-11-27 193342](https://github.com/user-attachments/assets/b27cc4cf-4f68-4767-bf4f-3b21ce0aa299)  
![Capture d'écran 2024-11-27 193355](https://github.com/user-attachments/assets/d45d478a-3bbe-42ff-b607-1a92aec2b47f)  
![Capture d'écran 2024-11-27 193532](https://github.com/user-attachments/assets/291f9c03-be18-4107-8235-c980692f9680)  
![Capture d'écran 2024-11-27 193618](https://github.com/user-attachments/assets/3e6404da-094e-4fef-a458-a0b77fd3795e)  
![Capture d'écran 2024-11-27 193706](https://github.com/user-attachments/assets/5eb833a7-bd56-45af-bbc3-83d33eeaff93)  


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

<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/015.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/016.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/017.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/018.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/019.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/020.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/021.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/022.png?raw=true" alt="Pictures" width="800" ><br><br>



    

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

<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/023.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/024.png?raw=true" alt="Pictures" width="800" >
<img src="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/RESSOURCES/025.png?raw=true" alt="Pictures" width="800" ><br><br>


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
