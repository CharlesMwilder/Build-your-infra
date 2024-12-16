# Documentation de l'Infrastructure Windows Server 2022 (serveur principal avec AD DS, DHCP et DNS) 🖥️

## 1. Prérequis matériel/logiciel 📦
- **Matériel requis :**
  - Processeur : [min 1.4 GHz 64-bit]
  - Mémoire RAM : [min 2 Go]
  - Espace disque : [min 32 Go]
  - Carte réseau compatible Ethernet
- **Logiciels requis :**
  - **Windows Server 2022** (version Standard ou Datacenter)
  - **.NET Framework 4.8 ou supérieur**
- **Version d'OS et logiciels :**
  - **OS** : Windows Server 2022 (version [x.x.x])
  - **Services** : DHCP, DNS, Active Directory Domain Services (AD DS)

## 2. Installation ⚙️

### Étapes d'installation 🚀
1. **Téléchargement de Windows Server 2022 :**  
   - Télécharger l'ISO depuis [Microsoft](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server).
2. **Préparation de l'environnement :**  
   - Créer une machine virtuelle ou utiliser un serveur physique avec les spécifications matérielles recommandées.
3. **Installation pas-à-pas :**
   - 📸 **Étape 1 :** Sélectionner la langue et la région lors de l'installation de Windows Server.
   - 📸 **Étape 2 :** Choisir l'édition (Standard ou Datacenter) et démarrer l'installation.
   - 📸 **Étape 3 :** Suivre les instructions pour l'installation complète (partitionnement du disque, configuration réseau, etc.).
   - 📸 **Étape 4 :** Après le redémarrage, effectuer les configurations initiales (choix du mot de passe administrateur, etc.).
4. **Vérification du résultat :**
   - 📸 **Résultat attendu :** L'écran d'accueil de Windows Server avec un accès au "Server Manager" pour configurer les rôles.

## 3. Configuration/Utilisation ⚙️

### Cible 🎯
- Serveur pour fournir des services DHCP, DNS et AD DS dans un environnement Windows.

### Étapes de configuration/utilisation 🔧
#### 3.1. Configuration du rôle DHCP 🔄
1. **Ajout du rôle DHCP :**  
   - Ouvrir le "Server Manager" → Sélectionner "Add Roles and Features".
   - 📸 **Étape 1 :** Sélectionner "DHCP Server" et cliquer sur "Next".
   - 📸 **Étape 2 :** Compléter les configurations nécessaires (étendue, plage d'adresses IP).
   - 📸 **Étape 3 :** Activer le serveur DHCP en configurant l’étendue et les options réseau (passerelle, DNS, etc.).
   
2. **Vérification du service DHCP :**  
   - 📸 **Résultat attendu :** Le service DHCP est activé et prêt à attribuer des adresses IP automatiquement aux clients.

#### 3.2. Configuration du rôle DNS 🌐
1. **Ajout du rôle DNS :**  
   - Ouvrir le "Server Manager" → Sélectionner "Add Roles and Features".
   - 📸 **Étape 1 :** Sélectionner "DNS Server" et cliquer sur "Next".
   - 📸 **Étape 2 :** Configurer le serveur DNS pour résoudre les noms de domaine internes et externes.
   - 📸 **Étape 3 :** Créer les zones DNS nécessaires pour l'environnement réseau (zone primaire, zone inverse, etc.).

2. **Vérification du service DNS :**  
   - 📸 **Résultat attendu :** Le serveur DNS doit résoudre les noms de domaine et fournir les services DNS à travers le réseau.

#### 3.3. Configuration de Active Directory Domain Services (AD DS) 🔑
1. **Installation d'Active Directory :**  
   - Ouvrir "Server Manager" → Sélectionner "Add Roles and Features".
   - 📸 **Étape 1 :** Choisir "Active Directory Domain Services".
   - 📸 **Étape 2 :** Promouvoir le serveur en contrôleur de domaine via l'assistant AD DS.
   - 📸 **Étape 3 :** Configurer le nom du domaine (ex. : `example.local`).
   
2. **Vérification du service AD DS :**  
   - 📸 **Résultat attendu :** Le serveur devient contrôleur de domaine, et les utilisateurs peuvent être gérés via "Active Directory Users and Computers".

## 4. FAQ ❓
- **Problème : Le service DHCP ne distribue pas les adresses IP.**
  - **Solution :** Vérifiez la configuration de l'étendue et assurez-vous que le service DHCP est bien démarré. Réinitialisez l'étendue si nécessaire.
  
- **Problème : Le serveur DNS ne résout pas les noms internes.**
  - **Solution :** Vérifiez que la zone DNS est correctement configurée et que les enregistrements A et PTR sont présents.
  
- **Problème : Impossible de joindre le domaine via AD DS.**
  - **Solution :** Vérifiez que le serveur AD DS est bien promu et que le client utilise le serveur DNS correct pour résoudre le domaine.

## 5. Optimisation 🏎️

### Choix du hardware 💻
- Pour un serveur Windows Server 2022 avec DHCP, DNS et AD DS, il est recommandé :
  - Processeur : Xeon ou équivalent, avec au moins 4 cœurs.
  - RAM : 8 Go minimum pour de petites installations, 16 Go ou plus pour de plus grandes infrastructures.
  - Disque : SSD de 100 Go ou plus pour de meilleures performances.

### Mise à jour régulière du système 🔄
- **Recommandations :**  
  - Configurer Windows Update pour effectuer des mises à jour automatiques.
  - Effectuer des mises à jour de sécurité chaque mois et après chaque mise à jour majeure de Windows Server.

## 6. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾
1. **Créer un clone miroir avec Hyper-V :**
   - Utiliser Hyper-V pour créer un snapshot ou un clone complet de la machine virtuelle Windows Server 2022.
   - 📸 **Procédure :** Sélectionner "Export" dans Hyper-V Manager pour sauvegarder une copie complète du serveur.
   
2. **Utiliser des outils comme Veeam ou Windows Server Backup pour sauvegarder l'état de la machine virtuelle.**

### Script de restauration OS 🖥️
- **Script de restauration complet :**
  ```bash
  # Exemple de commande PowerShell pour restaurer une image système
  wbAdmin start recovery -version:MM/DD/YYYY-HH:MM -itemType:Volume -items:C: -recoveryTarget:C:
