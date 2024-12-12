<details>
<summary><h1>🎯 Gestion d'un firewall pfSense<h1></summary>

---
``📑 Création d'une régle pare-feu pour une VLAN (Autorisation du port "53" pour le proctocole "DNS" via uniquement le serveur)``
---
![RULES 1](https://github.com/user-attachments/assets/38b26943-5267-4fb2-850e-3295f03a7f4a)
---
``📑 Remplir les champs suivant :``
---
![RULES 2](https://github.com/user-attachments/assets/6b7a2b4c-f9a4-41e8-9917-96b110594ff4)
---
![RULES 3](https://github.com/user-attachments/assets/552e8fa0-46e3-4b6d-a7d8-ac2f4661ec97)
---
``📑 Appliquez les changements via "Apply Changes"``
---
![RULES 4](https://github.com/user-attachments/assets/fefd485d-82d4-4f8d-8797-c93aa378a873)
---
``📑 La règles est maintenant validé et fonctionnelle``
---
![RULES 5](https://github.com/user-attachments/assets/e91a17ff-5aba-4126-a91f-7e51bec64376)

---
</details>

---

<details>
<summary><h1>🎯 Gestion de la télémétrie sur les clients Windows 10/11<h1></summary>

---
``📑 Script pour la gestion de télémétrie``
---
![SCRIPT1](https://github.com/user-attachments/assets/e8361921-919f-450a-a283-675a61aef27c)
![SCRIPT2](https://github.com/user-attachments/assets/266e8128-ea58-4368-8e67-d1149f189686)
---
</details>

---

<details>
<summary><h1>🎯 Simulation de switch par utilisation de tag de vlan<h1></summary>

---
``📑 Etape 1 : Cliquez sur "Interfaces"``
---
![PFSENSE1](https://github.com/user-attachments/assets/757b8746-e1e9-477e-a45d-4f7b523c60fa)
---
``📑 Etape 2 : Puis sur "Assignments"``
---
![PFSENSE 8](https://github.com/user-attachments/assets/39f1cc48-24eb-447e-9057-714610a8d9c1)
---
``📑 Etape 3 : Puis sur "VLANs"``
---
![PFSENSE 9](https://github.com/user-attachments/assets/615131f4-16b7-4770-8cb5-f9f3f12f3438)
---
``📑 Etape 4 : Cliquez sur "Add"``
---
![PFSENSE4](https://github.com/user-attachments/assets/daa0646e-6ce2-4ddd-937e-cd45d3540f2d)
---
``📑 Etape 5 : Choisir l'interface "emb2"``
---
![PFSENSE5](https://github.com/user-attachments/assets/81095162-e2df-4e3c-99a2-369d9725ca67)
---
``📑 Etape 6 : Renseignez le "VLAN Tag" et mettre une description (optionnelle) puis cliquer sur "Save"``
---
![PFSENSE6](https://github.com/user-attachments/assets/6aa0195a-feeb-4894-9196-aeccf0993e4b)
---
``📑 Etape 7 : Allez dans "Interface Assignments"``
---
![PFSENSE 1](https://github.com/user-attachments/assets/1146bf4d-81ed-460d-9ee6-b20f922e015b)
---
``📑 Etape 8 : Choisissez le "network ports" que vous venez de créer puis de cliquer sur "Add"``
---
![PFSENSE 2](https://github.com/user-attachments/assets/37faec32-3e25-4bd6-9111-9ab98e2b0d07)
---
``📑 Etape 9 : Cliquez sur "OPT12" pour configurer``
---
![PFSENSE 3](https://github.com/user-attachments/assets/02fdd156-933a-4381-bbbc-0412edc1ab17)
---
``📑 Etape 10 : Cochez la case "Enable interface" puis remplir la "Description" avec le nom de votre VLAN, sélectionner également l'IPv4``
---
![PFSENSE 4](https://github.com/user-attachments/assets/70a2f3ef-b61c-4012-8702-05682dfd91e9)
---
``📑 Etape 11 : Remplir l'adresse "IPv4" correspondante puis préciser le "CIDR" et cliquer sur "Save"``
---
![PFSENSE11](https://github.com/user-attachments/assets/d7d5acd1-197d-45ac-a225-22c1943147e9)
---
``📑 Etape 12 : Appliquer les changements en cliquant sur "Apply Changes"``
---
![PFSENSE 6](https://github.com/user-attachments/assets/06f0d232-aa7f-43bb-ba6b-e984d0efc27b)
---
``📑 Etape 13 : Bravo tout est bon ! 👏``
---
![PFSENSE 7](https://github.com/user-attachments/assets/9249d161-d793-4cfb-b4c4-c3bc4ca96bc3)
---
</details>
