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

<details>
<summary><h1>⚙️ Configuration du rôle DHCP</h1></summary>

- 📸 **Étape 1 :** Cliquer sur le drapeau puis sur ``Complete DHCP configuration``

![WINDHCP1](https://github.com/user-attachments/assets/4fb0f565-62ed-422f-8e23-c85304ae7eb3)<br>


- 📸 **Étape 2 :** Cliquer sur ``Commit``

![WINDHCP2](https://github.com/user-attachments/assets/b8519ede-58ee-4169-95a2-cdfc236a06fc)<br>


- 📸 **Étape 3 :** Puis sur ``Close``

![WINDHCP3](https://github.com/user-attachments/assets/96d9811f-4183-40ac-b616-d4861d615ec7)<br>


- 📸 **Étape 4 :** Faites un clique droit sur votre serveur puis cliquer sur ``DHCP Manager``

![WINDHCP4](https://github.com/user-attachments/assets/165158ad-6798-4b80-a5ce-69990f0d261a)<br>


- 📸 **Étape 5 :** Faites défiler votre serveur puis cliquer sur IPv4 puis faites un clic droit puis cliquer sur ``New Scope``

![WINDHCP5](https://github.com/user-attachments/assets/a9f261d7-c13f-4387-a18d-4af0e6f99e64)<br>


- 📸 **Étape 6 :** Remplissez les champs selon vos besoins puis cliquer sur ``Next``

![WINDHCP6](https://github.com/user-attachments/assets/490d68c2-5cdb-4e4f-ab3e-dc83d562f0a4)<br>


- 📸 **Étape 7 :** Renseignez votre plage d'adresse IP ainsi que le masque de sous-réseau puis cliquer sur ``Next``

![WINDHCP7](https://github.com/user-attachments/assets/9e61c223-8fce-4999-8d2f-00f6431699b5)<br>


- 📸 **Étape 8 :** Remplissez selon vos besoins ou laisser par défaut puis cliquer sur  ``Next``

![WINDHCP8](https://github.com/user-attachments/assets/80735425-431f-49ab-8719-5bf0454b074c)<br>


- 📸 **Étape 9 :** Laisser par défaut puis cliquer sur ``Next``

![WINDHCP9](https://github.com/user-attachments/assets/08d4bc79-d5f0-4f30-b3a1-c3e5735c0818)<br>


- 📸 **Étape 10 :** Laisser par défaut puis cliquer sur ``Next``

![WINDHCP10](https://github.com/user-attachments/assets/95f03bd3-da6d-4bdf-a268-dc104cccc6ea)<br>


- 📸 **Étape 11 :** Remplissez selon vos besoins ou laisser par défaut puis cliquer sur  ``Next``

![WINDHCP11](https://github.com/user-attachments/assets/4bad2b2b-0418-43d2-9e36-4f369e8a8860)<br>


- 📸 **Étape 12 :** Vérifier et modifier si besoin puis cliquer sur ``Next``

![WINDHCP12](https://github.com/user-attachments/assets/f8e9ce1a-60a1-47e7-8e3f-d8f95a461d18)<br>


- 📸 **Étape 13 :** Remplissez selon vos besoins ou laisser par défaut puis cliquer sur  ``Next``

![WINDHCP13](https://github.com/user-attachments/assets/1b10245d-ef7f-441e-bcfb-fe6ecd6b13e6)<br>


- 📸 **Étape 14 :** Laisser par défaut puis cliquer sur ``Next``

![WINDHCP14](https://github.com/user-attachments/assets/f027b3a3-c916-4879-b38a-42b97c15ced5)<br>


- 📸 **Étape 15 :** Tout est bon, cliquer sur ``Finish``

![WINDHCP15](https://github.com/user-attachments/assets/22ff53bd-1f9c-4de3-8112-62df50ab4dd1)<br>


- 📸 **Étape 16 :** Bravo, votre plage d'adresse IP est créer 👍

![WINDHCP16](https://github.com/user-attachments/assets/c5fa2862-c202-4fff-8e72-b5d0a2930617)

</details>

---

<details>
<summary><h1>⚙️ Configuration du rôle DNS</h1></summary>

- 📸 **Étape 1 :** Faites un clique droit sur votre serveur puis cliquer sur ``DNS Manager``

![WINDNS1](https://github.com/user-attachments/assets/36e650f9-7e74-40de-a0e8-c7271311ec54)<br>

- 📸 **Étape 2 :** Faites défiler votre serveur puis faites défiler ``Forward Lookup Zones`` puis faites un clic droit sur ``billu.com`` puis cliquer sur ``New Host (A or AAAA)``

![WINDNS2](https://github.com/user-attachments/assets/7b62faae-8e35-4e5b-9c9f-3293571d823b)<br>

- 📸 **Étape 3 :** Renseignez le nom et l'adresse IP puis cocher la case ``Create PTR`` puis cliquer sur ``ADD Host``

![WINDNS3](https://github.com/user-attachments/assets/f5938364-64f3-465c-96ff-6186a1c95249)<br>

- 📸 **Étape 4 :** Cliquer sur ``Ok``

![WINDNS4](https://github.com/user-attachments/assets/693cb81b-a4e4-496f-9ec2-7ccbed7b1e4a)<br>

- 📸 **Étape 5 :** Bravo tout est bon 👍

![WINDNS5](https://github.com/user-attachments/assets/c606532c-17a7-4378-95ab-86ad08b19eab)


</details>

---


## 3. FAQ ❓
- **Problème : Le service DHCP ne distribue pas les adresses IP.**
  - **Solution :** Vérifiez la configuration de l'étendue et assurez-vous que le service DHCP est bien démarré. Réinitialisez l'étendue si nécessaire.
  
- **Problème : Le serveur DNS ne résout pas les noms internes.**
  - **Solution :** Vérifiez que la zone DNS est correctement configurée et que les enregistrements A et PTR sont présents.
  
- **Problème : Impossible de joindre le domaine via AD DS.**
  - **Solution :** Vérifiez que le serveur AD DS est bien promu et que le client utilise le serveur DNS correct pour résoudre le domaine.

## 4. Optimisation 🏎️

### Choix du hardware 💻
- Pour un serveur Windows Server 2022 avec DHCP, DNS et AD DS, il est recommandé :
  - Processeur :  minimum 4 cœurs.
  - RAM : 8 Go minimum pour de petites installations, 16 Go ou plus pour de plus grandes infrastructures.
  - Disque : SSD de 100 Go ou plus pour de meilleures performances.

### Mise à jour régulière du système 🔄
- **Recommandations :**  
  - Configurer Windows Update pour effectuer des mises à jour automatiques.
  - Effectuer des mises à jour de sécurité chaque mois et après chaque mise à jour majeure de Windows Server.

## 5. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾
1. **Créer un clone miroir :**

A REMPLIR !
