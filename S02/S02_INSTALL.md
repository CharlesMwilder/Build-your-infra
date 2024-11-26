# Configuration AD-DS sous serveur Windows 2022/core et Serveur Linux (🚨🚨🚨 A REMPLIR ! 🚨🚨🚨)
---

### 1.1. **AD-DS - Création d'un domaine Active Directory (AD)**

- **Serveur Windows Server 2022 GUI :**
  - **Rôles installés :** AD-DS, DHCP, DNS
  - **Action à réaliser :**
    - Décrire la procédure d'installation des rôles (capture d'écran ou commandes à utiliser).
    - Vérification de la réplication et des rôles sur ce serveur.

  
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
   Dans la fenêtre, localisez votre domaine (ex. : `wcs.lan`).

4. **Actions sur le domaine** :  
   Faites un clic droit sur le domaine, puis suivez les étapes nécessaires.

- **Créer les OU selon vos besoins :**<br>

![CREATE OU](https://github.com/user-attachments/assets/62c68a5d-4e57-4703-bfed-79985c4cb82f)<br>
![CREATE OU1](https://github.com/user-attachments/assets/17a9a6eb-0358-4efd-ab54-af4c43ab0144)


    

- **Création des groupes :**
1. **Ouvrir Server Manager** :  
   Depuis la barre des tâches ou le menu démarrer.

2. **Accéder à Active Directory Users and Computers** :  
   Allez dans **Tools** (Outils) en haut à droite et sélectionnez **Active Directory Users and Computers**.

3. **Naviguer jusqu’à votre domaine** :  
   Dans la fenêtre, localisez votre domaine (ex. : `wcs.lan`).

4. **Actions sur le domaine** :  
   Faites dérouler le domaine, puis suivez les étapes nécessaires.

- **Choisissez votre OU puis créer les groups selon vos besoins :**<br>

![CREATE GROUP](https://github.com/user-attachments/assets/4316d273-ee18-46e6-b85c-78f11f0c60cf)<br>
![CREATE GROUP1](https://github.com/user-attachments/assets/11bbf8fe-0bd5-4830-badd-de2c756cb8ea)<br>
![CREATE GROUP2](https://github.com/user-attachments/assets/a7e0d1a5-718e-4f71-b4c8-8dc15f63fc70)


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
