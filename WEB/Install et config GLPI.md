<details>
<summary><h1>🎯 Installation et Configuration GLPI sur Debian<h1></summary>


## 🎯 Prérequis

- Un serveur Debian en CLI (VM ou CT).
- Accès root ou un utilisateur avec des privilèges sudo.
- Connexion à un Active Directory pour la synchronisation des utilisateurs.
- Un accès à Internet pour télécharger les paquets nécessaires.

---

## 🎯 1. Installation de GLPI sur le Serveur Debian en CLI via script BASH et fichier de configuration

📑 Fichier config.txt
---
![config 1](https://github.com/user-attachments/assets/4326e919-a1d2-4ef2-9217-50d211771e95)<br>
---

📑 Script installation GLPI
---
![script 1](https://github.com/user-attachments/assets/681b8f1b-b354-4f2f-9896-2683f26ad4d5)<br>
---
![script 2](https://github.com/user-attachments/assets/6c49ccf4-c45c-486a-b442-558d469106db)<br>
---
![script 3](https://github.com/user-attachments/assets/f3c09379-6f0d-414b-8335-9734957bea93)<br>
---

📑 Lancement du script
---
![017](https://github.com/user-attachments/assets/fbfe3fcd-ba70-4121-8ebd-4e1a0516ac94)<br>
---
![018](https://github.com/user-attachments/assets/eb8ec1df-e6ce-4db6-af08-e9218074268b)<br>
---

📑 Connexion sur le compte admin (billu)
---
![001](https://github.com/user-attachments/assets/99c60c91-80e5-4bce-a74d-69b85e29e6be)<br>
---
![002](https://github.com/user-attachments/assets/3ff82d21-aeb8-4909-9ed3-524b1166acbd)<br>
---

📑 Récupération de l'annuaire LDAP (domaine billu)
---
![ADDS 1](https://github.com/user-attachments/assets/52c67a29-deff-4821-9a78-84050113913e)<br>
---
![ADDS 2](https://github.com/user-attachments/assets/d0f486cd-041b-41b4-b08c-5aea5de252ee)<br>
---
![ADDS 3](https://github.com/user-attachments/assets/0fe41fd6-4e53-4391-932d-88ee466d322d)<br>
---
![ADDS 4](https://github.com/user-attachments/assets/273f4cd9-16da-4118-926d-f8984484ffa1)<br>
---

📑 Ajouts des utilisateurs sur GLPI via LDAP (domaine billu)
---
![ADDUSER1](https://github.com/user-attachments/assets/5bf17ac1-1652-4218-9380-0876c00efd41)<br>
---
![ADDUSER2](https://github.com/user-attachments/assets/cd516ff8-858a-4a08-a7be-c275e6015c6a)<br>
---
![ADDUSER3](https://github.com/user-attachments/assets/be6d4337-b690-456e-b69c-e0b89f98eeed)<br>
---
![ADDUSER4](https://github.com/user-attachments/assets/9f369c7f-9376-4bc0-9d6f-9634b1da6c74)<br>
---
![ADDUSER5](https://github.com/user-attachments/assets/03fa50c5-a7bd-4e9a-80e2-5c9d651d66e8)<br>
---
![ADDUSER6](https://github.com/user-attachments/assets/dd9fa51d-65af-4e04-aa23-a25e898d10f7)<br>
---
![ADDUSER7](https://github.com/user-attachments/assets/4a08e289-3ab3-442b-9e62-d435efa08120)<br>
---
![ADDUSER8](https://github.com/user-attachments/assets/fc7ca479-47b3-4b84-ac75-1b0ba7f4d258)<br>
---

📑 Ajouts des groupes sur GLPI via LDAP (domaine billu)
---
![ADDGROUP1](https://github.com/user-attachments/assets/2d5e1690-c20f-4ddc-b9f7-04f41e492236)<br>
---
![ADDGROUP2](https://github.com/user-attachments/assets/41ddb9ca-16d5-4f08-9d86-8204c5093339)<br>
---
![ADDGROUP3](https://github.com/user-attachments/assets/7310e0f8-e455-4554-a972-e8da90764d43)<br>
---
![ADDGROUP4](https://github.com/user-attachments/assets/e12da41c-9566-4454-be53-2e6e6381875c)<br>
---
![ADDGROUP5](https://github.com/user-attachments/assets/636e4a1a-85f6-4ba8-8b3e-92b0f0a48d93)<br>
---
![ADDGROUP6](https://github.com/user-attachments/assets/14d8aa27-dc5a-4dfe-b11a-9eb3702aa819)<br>
---


📑 Synchronisation des utilisateurs à leurs groupes sur GLPI via LDAP (domaine billu)
---
![SYNC1](https://github.com/user-attachments/assets/d0ba0ebe-9bb5-4a48-8269-8834531e703f)<br>
---
![SYNC2](https://github.com/user-attachments/assets/9025a3cf-8349-4b6c-8a4c-2acbdcbf82ce)<br>
---
![SYNC3](https://github.com/user-attachments/assets/b286473a-6cf0-463d-b171-91ec3f26438e)<br>
---
![SYNC4](https://github.com/user-attachments/assets/eae73747-65df-4ea6-8026-98d6a9c798dd)<br>
---
![SYNC5](https://github.com/user-attachments/assets/b2e64cd4-841c-4d7b-af4c-beb7be70a3a0)<br>
---

📑 Réception, traitement et clos du ticket d'un utilisateur sur le compte admin (billu)
---
![009](https://github.com/user-attachments/assets/9fec810e-85d2-4e94-b099-19908a7b579c)<br>
---
![010](https://github.com/user-attachments/assets/eb27abf3-6b5d-4608-9b8b-0369c4681e33)<br>
---
![011](https://github.com/user-attachments/assets/3cabd561-ddf2-43c5-ae6a-6eb0fa62efd5)<br>
---
![012](https://github.com/user-attachments/assets/51a97bd4-2a3a-4d45-b36b-838ce8c23e73)<br>
---
![013](https://github.com/user-attachments/assets/bad969c0-ecac-4268-8cac-0955cf0bb0c0)<br>
---
</details>
