# Documentation de l'Infrastructure Windows Server Core (Serveur secondaire pour redondance AD DS, DHCP, DNS et backup du serveur principal) 🖥️

## 1. Prérequis matériel/logiciel 📦
- **Matériel requis :**
  - Processeur : ``1 sockets, 1 core``
  - Mémoire RAM : ``4 Go``
  - Espace disque : ``32 Go``
  - Carte réseau compatible Ethernet
- **Logiciels requis :**
  - **Windows Server 2022 Core Edition**
  - **.NET Framework 4.8 ou supérieur** (pour certains outils de gestion)
- **Version d'OS et logiciels :**
  - **OS** : ``Windows Server 2022 Core Edition``
  - **Services** : ``Active Directory Domain Services (AD DS), DHCP, DNS``

## 2. Installation ⚙️

### Étapes d'installation 🚀
1. **Téléchargement de Windows Server Core :**  
   - Télécharger l'ISO de **Windows Server 2022 Core Edition** depuis (https://drive.google.com/file/d/1Y0J_vJhhiFI5QOPVOlTMcLxs3ERTij-e/view).
2. **Préparation de l'environnement :**  
   - Créer une machine virtuelle ou utiliser un serveur physique avec les spécifications matérielles recommandées.
  
    ---
   
<details>
<summary><h1>⚙️ Installation Windows Server Core</h1></summary>

- 📸 **Étape 1 :** Choisir la langue du système, le format horaire et la langue du clavier (French = AZERTY) puis cliquer sur ``Next``

![WIN1](https://github.com/user-attachments/assets/7160fc6b-a5c0-49e8-b4e1-3dfd097ce5e9)<br>

- 📸 **Étape 2 :** Lancez l'installation

![WIN2](https://github.com/user-attachments/assets/73cd5edd-8de7-40cf-956c-7ebc0bb8774a)<br>

- 📸 **Étape 3 :** Choisir la version ``Standard Evaluation`` puis cliquer sur ``Next``

 ![WINCORE1](https://github.com/user-attachments/assets/2d840349-dd6f-46ad-91aa-90df768d6d0e)<br>

- 📸 **Étape 4 :** Accepter puis cliquer sur ``Next``
 
![WINCORE2](https://github.com/user-attachments/assets/416b6e1f-ccd7-461a-a8a8-c56b09f0790b)<br>

- 📸 **Étape 5 :** Apuuyer sur la touche ``Entrée``

![WINCORE3](https://github.com/user-attachments/assets/4f8e1a87-6e43-4c43-9a93-cf6716f15a60)<br>

- 📸 **Étape 6 :** Veuillez choisir un mot de passe pour le compte Administrateur puis appuyer sur la touche ``Entrée``

![WINCORE4](https://github.com/user-attachments/assets/67f9c9fa-65d1-46a8-9eb5-50b2148da1a8)<br>

- 📸 **Étape 7 :** Apuuyer sur la touche ``Entrée``

![WINCORE5](https://github.com/user-attachments/assets/5aeec4ab-82a5-482a-a719-0061973e8ada)<br>

- 📸 **Étape 8 :** Vous êtes maintenant connecté 👍

![WINCORE6](https://github.com/user-attachments/assets/6d403ce8-abe0-4e6a-b723-a4501ed65ecf)<br>

</details>

---
<br>
<details>
<summary><h1>⚙️ Installation des features sur Windows Server Core</h1></summary>

- 📸 **Étape 1 :** Installation de la feature ``RSAT-AD-Tools``
  
![WINCOREF1](https://github.com/user-attachments/assets/d17c0a12-1ecd-485a-adef-92be7dd84294)<br>

- 📸 **Étape 2 :** Installation de la feature ``AD-Domain-Services``

![WINCOREF2](https://github.com/user-attachments/assets/6037209f-df25-4a5e-8271-4b253cf32668)<br>

- 📸 **Étape 3 :** Installation de la feature ``DHCP``

![WINCOREF3](https://github.com/user-attachments/assets/62aa6bdf-815f-45e6-a9c2-37170f2a896e)<br>

- 📸 **Étape 4 :** Installation de la feature ``DNS``
  
![WINCOREF4](https://github.com/user-attachments/assets/047bb5f2-ad42-4753-861b-f44d9a3dbd2b)<br>


</details>

---
<br>
<details>
<summary><h1>⚙️ Ajout du Windows Server Core au domaine billu.com</h1></summary>
  
- 📸 **Étape 1 :** Ajout du serveur core au domaine ``billu.com``

![WINCOREF5](https://github.com/user-attachments/assets/74c5116b-2f68-4938-b2b3-585e30e0d495)<br>


- 📸 **Étape 2 :** Connexion au domaine via le compte ``Administrateur du domaine billu.com``

![WINCOREF6](https://github.com/user-attachments/assets/277faa22-b51a-412b-9f13-a6908ec2f28e)<br>

- 📸 **Étape 3 :** Redémarrage pour validation de l'ajout du serveur core au domaine ``billu.com``

![WINCOREF7](https://github.com/user-attachments/assets/830de9f6-244e-4b42-98ef-8a7dd6edb02c)<br>

- 📸 **Étape 4 :** Après redémarrage choisir ``l'option 12`` pour changer de compte

![WINCOREF8](https://github.com/user-attachments/assets/f0551182-5d9d-4fde-ac39-ef43ce383c09)<br>

- 📸 **Étape 5 :** Choisir ``Other user`` puis faites entrer

![WINCOREF9](https://github.com/user-attachments/assets/fd87bbc6-8d7a-48bb-b499-a97716217967)<br>

- 📸 **Étape 6 :** Renseignez le nom du compte Administrateur avec le nom de domaine ``billu.com`` ainsi que le mot de passe puis faites entrer

![WINCOREF10](https://github.com/user-attachments/assets/7f393ae9-9c62-4198-ac32-ce397420cf6d)<br>

- 📸 **Étape 7 :** Tout est bon, vous voila connecter sur le domaine ``billu.com``

![WINCOREF11](https://github.com/user-attachments/assets/cd4d7048-be8a-4b73-a23a-aa3aed3041c9)



</details>

---
<br>

### ⭐ CONFIGURATION DHCP ET DNS VOIR DIRECTEMENT SUR LE SERVEUR PRINCIPAL ⭐

https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/INSTALL%20ET%20CONFIG/Windows%20Server%202022.md

---

## 3. FAQ ❓
- **Problème : Le service DHCP ne distribue pas d'adresses IP.**
  - **Solution :** Vérifiez si l'étendue DHCP est correctement configurée et si le service DHCP est bien démarré.
  
- **Problème : Le serveur DNS ne résout pas les noms internes.**
  - **Solution :** Assurez-vous que le serveur DNS est correctement configuré pour utiliser le serveur DNS principal du domaine et que la zone DNS est bien répliquée.

- **Problème : Impossible de rejoindre le domaine.**
  - **Solution :** Vérifiez que le serveur Core peut communiquer avec le contrôleur de domaine principal et que les informations d'identification sont correctes.

## 4. Optimisation 🏎️

### Choix du hardware 💻
- Pour un serveur **Windows Server Core** avec DHCP, DNS et AD DS :
  - Processeur : minimum 4 cœurs.
  - RAM : 8 Go minimum.
  - Disque : SSD de 100 Go ou plus pour de meilleures performances.

### Mise à jour régulière du système 🔄
- **Recommandations :**  
  - Configurer Windows Update pour effectuer des mises à jour automatiques.
  - Vérifiez les mises à jour de sécurité tous les mois et après chaque mise à jour majeure de Windows Server.

## 5. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾
1. **Créer un clone miroir de Windows Server Core :**

A REMPLIR !
