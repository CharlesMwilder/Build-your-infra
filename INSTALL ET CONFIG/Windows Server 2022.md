# Documentation de l'Infrastructure Windows Server 2022 (serveur principal avec AD DS, DHCP et DNS) 🖥️

## 1. Prérequis matériel/logiciel 📦
- **Matériel requis :**
  - Processeur : ``1 sockets, 2 cores``
  - Mémoire RAM : ``4 Go``
  - Espace disque : ``32 Go``
  - Carte réseau compatible Ethernet
- **Logiciels requis :**
  - **Windows Server 2022**
  - **.NET Framework 4.8 ou supérieur**
- **Version d'OS et logiciels :**
  - **OS** : ``Windows Server 2022``
  - **Services** : ``Domain Services (AD DS), DHCP, DNS``

## 2. Installation ⚙️

### Étapes d'installation 🚀
1. **Téléchargement de Windows Server 2022 :**  
   - Télécharger l'ISO depuis (https://drive.google.com/file/d/1Y0J_vJhhiFI5QOPVOlTMcLxs3ERTij-e/view).
2. **Préparation de l'environnement :**  
   - Créer une machine virtuelle ou utiliser un serveur physique avec les spécifications matérielles recommandées.

---

<details>
<summary><h1>⚙️ Installation Windows Server 2022</h1></summary>

- 📸 **Étape 1 :** Choisir la langue du système, le format horaire et la langue du clavier (French = AZERTY) puis cliquer sur ``Next``

![WIN1](https://github.com/user-attachments/assets/e9f47a4b-1897-474d-bb3e-b1e0c566b210)<br>

- 📸 **Étape 2 :** Lancez l'installation

![WIN2](https://github.com/user-attachments/assets/d5371526-c8dd-4564-88d8-82d1844f18f0)<br>

- 📸 **Étape 3 :** Choisir la version ``Standard Evaluation`` avec ``Desktop`` puis cliquer sur ``Next``

![WIN3](https://github.com/user-attachments/assets/0ed24558-eb68-4e30-8d7d-9afeffd6f176)<br>

- 📸 **Étape 4 :** Accepter puis cliquer sur ``Next``

![WIN4](https://github.com/user-attachments/assets/6e8aa230-a05e-4374-b79d-afb753d3b969)<br>

- 📸 **Étape 5 :** Choisissez l'install ``Custom``

![WIN5](https://github.com/user-attachments/assets/0b84f22b-1bb7-404b-811e-2a8649c61448)<br>

- 📸 **Étape 6 :** Prendre votre disque principal puis cliquer sur ``Next``

![WIN6](https://github.com/user-attachments/assets/d3bb0123-4722-4718-bcd6-90a8bd338722)<br>

- 📸 **Étape 7 :** Laissez l'installation se faire

![WIN7](https://github.com/user-attachments/assets/7edd7ee6-f72d-4d3f-a28b-5d67e447b600)<br>

- 📸 **Étape 8 :** Veuillez rentrer un mot de passe pour le compte Administrateur puis cliquer sur ``Finish``

![WIN8](https://github.com/user-attachments/assets/79bd6f48-4bfe-45ca-93b7-59ed3a1799be)<br>

- 📸 **Étape 9 :** Vous pouvez maintenant vous connecter avec votre compte Administrateur

![WIN9](https://github.com/user-attachments/assets/dde18228-d5af-4ad0-ad4e-e4a5ac460070)  

</details>

---

<details>
<summary><h1>⚙️ Installation AD DS, DHCP, DNS sur Windows Server 2022</h1></summary>

- 📸 **Étape 1 :** Cliquer sur le menu Windows puis sur ``Server Manager``

![WIN10](https://github.com/user-attachments/assets/53929007-6fbf-49fc-a779-19a952630a45)<br>

- 📸 **Étape 2 :** Cliquer sur ``Manage`` puis sur ``Add Rôles and Features``

![WIN11](https://github.com/user-attachments/assets/7523740c-8659-4c8e-8c58-e8bd6a225c51)<br>

- 📸 **Étape 2 :** Cliquer sur ``Next``

![WIN12](https://github.com/user-attachments/assets/bbd98be8-8f67-4d59-bfbc-e2921c57f529)<br>

- 📸 **Étape 4 :** Cliquer sur ``Next``

![WIN13](https://github.com/user-attachments/assets/a073a52d-12a3-4b1b-a58b-7e0ce3e8a3ac)<br>

- 📸 **Étape 5 :** Choisissez bien votre serveur et cliquer sur ``Next``

![WIN14](https://github.com/user-attachments/assets/46784eec-5d2b-4ba5-b651-2ec204c55ab0)<br>

- 📸 **Étape 6 :** Cocher les 3 features ``(AD DS, DHCP et DNS)`` puis cliquer sur ``Next``

![WIN15](https://github.com/user-attachments/assets/6e5f36b2-6682-415c-b890-e804ac18c24b)<br>

- 📸 **Étape 7 :** Cliquer sur ``Next``

![WIN16](https://github.com/user-attachments/assets/ae346b48-5888-4ee1-9b02-983ddf2bd4bd)<br>

- 📸 **Étape 8 :** Cliquer sur ``Next``

![WIN17](https://github.com/user-attachments/assets/552b14cd-2573-4195-b500-a3a7259c87af)<br>

- 📸 **Étape 9 :** Cliquer sur ``Next``

![WIN18](https://github.com/user-attachments/assets/5f2ff3ff-12f9-40dc-8fee-20f1f2871394)<br>

- 📸 **Étape 10 :** Cliquer sur ``Next``

![WIN19](https://github.com/user-attachments/assets/e9e42fa6-b40a-48fe-a24a-ef0a35c4ff35)<br>

- 📸 **Étape 11 :** Cliquer sur ``Install``

![WIN20](https://github.com/user-attachments/assets/2d4b816d-fd00-42b5-9d10-aa4406b5429d)<br>

- 📸 **Étape 12 :** Une fois l'installation terminée cliquer sur ``Close``

![WIN21](https://github.com/user-attachments/assets/b30e2206-0ff9-4905-b106-0ecb35370c3b)

</details>

---

## 3. Configuration/Utilisation ⚙️

### Cible 🎯 (A REMPLIR !)
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
   - 📸 **Étape 3 :** Configurer le nom du domaine (ex. : `billu.com`).
   
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
  - Processeur :  minimum 4 cœurs.
  - RAM : 8 Go minimum pour de petites installations, 16 Go ou plus pour de plus grandes infrastructures.
  - Disque : SSD de 100 Go ou plus pour de meilleures performances.

### Mise à jour régulière du système 🔄
- **Recommandations :**  
  - Configurer Windows Update pour effectuer des mises à jour automatiques.
  - Effectuer des mises à jour de sécurité chaque mois et après chaque mise à jour majeure de Windows Server.

## 6. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾
1. **Créer un clone miroir :**

A REMPLIR !
