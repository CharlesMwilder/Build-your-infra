# Configuration AD-DS sous serveur Windows 2022/core et Serveur Linux (🚨🚨🚨 A REMPLIR ! 🚨🚨🚨)
---

### 1.1. **AD-DS - Création d'un domaine Active Directory (AD)**

- **Serveur Windows Server 2022 GUI :**  
  - **Rôles installés :** AD-DS, DHCP, DNS  
  - **Actions à réaliser :**  
    #### Installation de l'Active Directory (AD DS)
  

![Capture d'écran 2024-11-26 154954](https://github.com/user-attachments/assets/0b0e9f7e-465f-41ca-af1b-9fa67d3dc962)  
![Capture d'écran 2024-11-26 155434](https://github.com/user-attachments/assets/9e2a476a-3cf8-403d-9818-6632501ad41c)  
![Capture d'écran 2024-11-26 155730](https://github.com/user-attachments/assets/b2f7c97e-dd4a-44be-af1a-6ff234149680)   

:arrow_right: Une fois le rôle AD DS installé, il faut cliquer sur le drapeau jaune en haut, afin de créer un DC :  
![Capture d'écran 2024-11-26 155751](https://github.com/user-attachments/assets/21291125-d110-427a-82d3-ce9814ba70df)  

:arrow_right: Notre domaine va se nommer **`billu.com`**  
![Capture d'écran 2024-11-26 155852](https://github.com/user-attachments/assets/cbb72235-1ae2-4503-a63b-84f567e5c1c2)  
![Capture d'écran 2024-11-26 155931](https://github.com/user-attachments/assets/ae678d71-1604-4962-a780-ad09771530bd)
![Capture d'écran 2024-11-26 155931](https://github.com/user-attachments/assets/8de0595b-54d0-4b74-8736-3e48ff6b73f5)
![Capture d'écran 2024-11-26 160046](https://github.com/user-attachments/assets/c3bca927-f3e1-47e3-b60a-770f4fb055a5)
![Capture d'écran 2024-11-26 160133](https://github.com/user-attachments/assets/ef91a9e6-1fe8-4f68-9dac-269327c6b348)

Après redémarrage, nous pouvons nous connecter en administrateur sur le domaine `billu`  
![Capture d'écran 2024-11-26 160929](https://github.com/user-attachments/assets/6801ee46-6e77-4992-8244-4d143e8c1f8e)

#### Installation du DHCP  
Toujours dans l'onglet Manage > Add rôles and features :  
![Capture d'écran 2024-11-26 162309](https://github.com/user-attachments/assets/bee85b73-cde5-4862-b035-d13442282b07)
![Capture d'écran 2024-11-26 162527](https://github.com/user-attachments/assets/90e89164-250a-48a4-b1d0-490d0d78f045)

:arrow_right: **Nous avons donc 3 rôles d'installés : AD DC, DNS, DHCP**
Le serveur Windows 2022 GUI est donc bien sur le domaine billu.com est se nomme SERVWIN01.


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

![CREATE OU](https://github.com/user-attachments/assets/ba802554-aeae-4276-9c36-e117aad3cef8)<br>
![CREATE OU1](https://github.com/user-attachments/assets/c34edc7b-0720-4ebd-8302-19ab09946e5c)<br>
![CREATE OU10](https://github.com/user-attachments/assets/39d69f68-9138-4023-bbf9-5abc9d5b0da6)<br>
![CREATE OU11](https://github.com/user-attachments/assets/7b3d4b85-4f85-4bed-9a4d-5622d1b48fc6)<br>
![CREATE OU2](https://github.com/user-attachments/assets/ef898ac8-8c08-4700-865d-3ea2ea6f3417)<br>
![CREATE OU3](https://github.com/user-attachments/assets/6680e69a-5a4c-47e3-b863-e2a33bf8e4b5)<br>
![CREATE OU4](https://github.com/user-attachments/assets/9918a89a-4cf4-4477-8e82-e0736cc0e187)<br>
![CREATE OU6](https://github.com/user-attachments/assets/d8367669-eaf6-42aa-9bbc-719de85d9d1e)


    

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

![CREATE OU7](https://github.com/user-attachments/assets/10899d47-663b-436e-a8e4-4e47b03540c5)<br>
![CREATE OU8](https://github.com/user-attachments/assets/7fdedc20-2574-4f25-af71-6a2c4bba5eea)<br>
![CREATE OU9](https://github.com/user-attachments/assets/8f11f0c9-5a18-443c-9ace-34f9bcf1db05)


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
