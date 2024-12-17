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

<details>
<summary><h1>⚙️ Configuration/Utilisation Pfsense</h1></summary>

🎯 Création de VLAN

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

## 2. FAQ ❓

- **Problème** : Impossible d'accéder à l'interface Web.  
  **Solution** : Assurez-vous que votre PC est dans le réseau `192.168.10.0/24` et que l'adresse IP est correctement configurée.

- **Problème** : Les VLANs ne fonctionnent pas correctement.  
  **Solution** : Vérifiez que les ports correspondants sur le switch sont configurés pour les VLANs.

- **Problème** : Les règles de pare-feu ne s'appliquent pas.  
  **Solution** : Assurez-vous que les règles sont bien assignées à l'interface correcte (VLAN ou LAN).

---

## 3. Optimisation 🏎️

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

## 4. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾

A REMPLIR
