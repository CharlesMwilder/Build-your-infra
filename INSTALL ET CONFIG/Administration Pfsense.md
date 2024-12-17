# Documentation de l'Infrastructure 🖥️

## 1. Prérequis matériel/logiciel 📦

### Matériel requis :
- Un serveur ou poste compatible avec PFsense.
- Switch L2 pour les VLANs.
- Câbles Ethernet.

### Logiciels requis :
- **PFsense Community Edition**, version 2.7.0 ou supérieure.
- Navigateur Web pour accéder à l'interface (Firefox, Chrome ou Edge).

### Performances minimales recommandées :
- **Processeur** : 1 socket, 1 cœur.
- **Mémoire RAM** : 4 Go.
- **Espace disque** : 32 Go.
- **Carte réseau** : Compatible Ethernet.

### Version d'OS et logiciels :
- **OS** : PFsense CE (basé sur FreeBSD 13).
- **Logiciel** : Aucune application supplémentaire nécessaire sur PFsense.

---
## 2. Configuration Pfsense 🔧

<details>
<summary><h1>⚙️ Création de VLAN</h1></summary>


- 📸 **Étape 1 :** Cliquez sur ``Interfaces``

![PFSENSE1](https://github.com/user-attachments/assets/757b8746-e1e9-477e-a45d-4f7b523c60fa)

- 📸 **Étape 2 :** Puis sur ``Assignments``

![PFSENSE 8](https://github.com/user-attachments/assets/39f1cc48-24eb-447e-9057-714610a8d9c1)

- 📸 **Étape 3 :** Puis sur ``VLANs``

![PFSENSE 9](https://github.com/user-attachments/assets/615131f4-16b7-4770-8cb5-f9f3f12f3438)

- 📸 **Étape 4 :** Cliquez sur ``Add``

![PFSENSE4](https://github.com/user-attachments/assets/daa0646e-6ce2-4ddd-937e-cd45d3540f2d)

- 📸 **Étape 5 :** Choisir l'interface ``emb2``

![PFSENSE5](https://github.com/user-attachments/assets/81095162-e2df-4e3c-99a2-369d9725ca67)

- 📸 **Étape 6 :** Renseignez le ``VLAN Tag`` et mettre une description (optionnelle) puis cliquer sur ``Save``

![PFSENSE6](https://github.com/user-attachments/assets/6aa0195a-feeb-4894-9196-aeccf0993e4b)

- 📸 **Étape 7 :** Allez dans ``Interface Assignments``

![PFSENSE 1](https://github.com/user-attachments/assets/1146bf4d-81ed-460d-9ee6-b20f922e015b)

- 📸 **Étape 8 :** Choisissez le ``network ports`` que vous venez de créer puis de cliquer sur ``Add``

![PFSENSE 2](https://github.com/user-attachments/assets/37faec32-3e25-4bd6-9111-9ab98e2b0d07)

- 📸 **Étape 9 :** Cliquez sur ``OPT12`` pour configurer

![PFSENSE 3](https://github.com/user-attachments/assets/02fdd156-933a-4381-bbbc-0412edc1ab17)

- 📸 **Étape 10 :** Cochez la case ``Enable interface`` puis remplir la "Description" avec le nom de votre VLAN, sélectionner également l'IPv4

![PFSENSE 4](https://github.com/user-attachments/assets/70a2f3ef-b61c-4012-8702-05682dfd91e9)

- 📸 **Étape 11 :** Remplir l'adresse ``IPv4`` correspondante puis préciser le ``CIDR`` et cliquer sur ``Save``

![PFSENSE11](https://github.com/user-attachments/assets/d7d5acd1-197d-45ac-a225-22c1943147e9)

- 📸 **Étape 12 :** Appliquer les changements en cliquant sur ``Apply Changes``

![PFSENSE 6](https://github.com/user-attachments/assets/06f0d232-aa7f-43bb-ba6b-e984d0efc27b)

- 📸 **Étape 13 :** Bravo tout est bon ! 👏

![PFSENSE 7](https://github.com/user-attachments/assets/9249d161-d793-4cfb-b4c4-c3bc4ca96bc3)


</details>

---

<details>
<summary><h1>⚙️ Gestion du pare-feu / Création de règle</h1></summary>


- 📸 **Étape 1 :** Connexion à Pfsense depuis le poste d'administration

![CONFIGPFSENSE1](https://github.com/user-attachments/assets/c6e12d02-1970-4e0d-9b5e-b505fd7f71b2)

- 📸 **Étape 2 :** Cliquez sur ``Firewall`` puis sur ``Rules`` pour créer une règle

![CONFIGPFSENSE2](https://github.com/user-attachments/assets/755a15d5-b152-49c3-9d3f-0a9fb26e671c)

- 📸 **Étape 3 :** Choisissez la VLAN à configurer puis cliquer sur ``Add``

![CONFIGPFSENSE3](https://github.com/user-attachments/assets/6f1fa555-d21c-44af-948c-75695531eacb)

- 📸 **Étape 4 :** Suivre les étapes de remplissage

![CONFIGPFSENSE4](https://github.com/user-attachments/assets/8bc05f6a-8e23-48fc-86b4-d06fee7dbd1a)

- 📸 **Étape 5 :** Suivre les étapes de remplissage puis cliquer sur ``Save``

![CONFIGPFSENSE5](https://github.com/user-attachments/assets/610905b1-b0fa-4493-934b-8106aab7b083)

- 📸 **Étape 6 :** Appliquer les changements en cliquant sur ``Apply Changes``

![CONFIGPFSENSE6](https://github.com/user-attachments/assets/2d5af13e-6233-4b6e-836e-115c86e16adc)


- 📸 **Étape 7 :** La règle pour permettre la communication entre VLAN est bien ajouté 👍

![CONFIGPFSENSE7](https://github.com/user-attachments/assets/b8277b70-d14e-476b-bb97-4f4f2de69806)

- 📸 **Étape 8 :** Créer une autre règle en suivant la configuration affiché

![CONFIGPFSENSE8](https://github.com/user-attachments/assets/dc9dcfce-c136-444f-8a71-5a629433dd9f)

- 📸 **Étape 9 :** Suivre les étapes de remplissage puis cliquer sur ``Save``

![CONFIGPFSENSE9](https://github.com/user-attachments/assets/a9e21b2a-a013-49f9-9000-7228eb3b62fc)

- 📸 **Étape 10 :** Appliquer les changements en cliquant sur ``Apply Changes``

![CONFIGPFSENSE10](https://github.com/user-attachments/assets/453aff85-2132-4dd4-b65d-9fd429acb1bd)

- 📸 **Étape 11 :** La règle pour permettre un accès à internet est bien ajouté 👍

![CONFIGPFSENSE11](https://github.com/user-attachments/assets/e2b965f9-e76b-4d27-82d7-8d70bb368138)



</details>

---


## 3. FAQ ❓

- **Problème** : Impossible d'accéder à l'interface Web.  
  **Solution** : Assurez-vous que votre PC est dans le réseau `192.168.10.0/24` et que l'adresse IP est correctement configurée.

- **Problème** : Les VLANs ne fonctionnent pas correctement.  
  **Solution** : Vérifiez que les ports correspondants sur le switch sont configurés pour les VLANs.

- **Problème** : Les règles de pare-feu ne s'appliquent pas.  
  **Solution** : Assurez-vous que les règles sont bien assignées à l'interface correcte (VLAN ou LAN).

---

## 4. Optimisation 🏎️

### Améliorations matérielles 💻
- **CPU** : Ajouter un processeur plus performant avec plusieurs cœurs pour une meilleure gestion des flux.
- **RAM** : Étendre la mémoire à 8 Go ou plus pour un traitement plus fluide.
- **Espace disque** : Passer à un SSD pour des temps d'accès plus rapides.
- **Réseau** : Ajouter des interfaces réseau pour des connexions dédiées aux VLANs critiques.

### Recommandations générales :
- **Espace physique** : Installez PFsense dans un environnement aéré pour éviter les surchauffes.
- **Gestion des câbles** : Utilisez des câbles Ethernet de haute qualité et bien organisés.

### Mise à jour régulière du système 🔄
- Mettez à jour PFsense tous les 6 mois via `System > Update`.
- Sauvegardez la configuration avant chaque mise à jour via `Diagnostics > Backup/Restore`.

---

## 5. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾

A REMPLIR
