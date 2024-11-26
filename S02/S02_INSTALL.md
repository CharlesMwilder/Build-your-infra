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
  - **Action à réaliser :**
    - Créer des OU pour les départements/services de l'entreprise.
    - Description de la méthode manuelle et automatisée via script PowerShell.
    

- **Création des groupes :**
  - **Action à réaliser :**
    - Créer des groupes d'utilisateurs (ex : IT, RH, Finance).
    - Description de la méthode manuelle et automatisée via script PowerShell.

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
