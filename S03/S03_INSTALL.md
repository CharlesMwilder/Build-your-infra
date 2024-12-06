## 🎯 Documentation : Installation et configuration de GPO

### 🎯 GPO de Sécurité
- **Nom de la GPO** :  
- **Description** :  
- **Étapes de configuration** :  
  1.  
  2.  
  3.  
- **Autres remarques** :  

---

### 🎯 GPO Standard
- **Nom de la GPO** :  
- **Description** :  
- **Étapes de configuration** :  
  1.  
  2.  
  3.  
- **Autres remarques** :  

---

# 🎯 Documentation : Installation et Configuration de GLPI sur un Serveur Debian


## 🎯 Prérequis

- Un serveur Debian en CLI (VM ou CT).
- Accès root ou un utilisateur avec des privilèges sudo.
- Connexion à un Active Directory pour la synchronisation des utilisateurs.
- Un accès à Internet pour télécharger les paquets nécessaires.

---

## 🎯 1. Installation de GLPI sur le Serveur Debian en CLI via script BASH et fichier de configuration

``📑 Fichier config.txt``

![config 1](https://github.com/user-attachments/assets/4326e919-a1d2-4ef2-9217-50d211771e95)<br>
---

``📑 Script installation GLPI``

![script 1](https://github.com/user-attachments/assets/681b8f1b-b354-4f2f-9896-2683f26ad4d5)<br>
---
![script 2](https://github.com/user-attachments/assets/6c49ccf4-c45c-486a-b442-558d469106db)<br>
---
![script 3](https://github.com/user-attachments/assets/f3c09379-6f0d-414b-8335-9734957bea93)<br>
---

``📑 Lancement du script``

![017](https://github.com/user-attachments/assets/fbfe3fcd-ba70-4121-8ebd-4e1a0516ac94)<br>
---
![018](https://github.com/user-attachments/assets/eb8ec1df-e6ce-4db6-af08-e9218074268b)<br>
---

``📑 Connexion sur le compte admin (billu)``

![001](https://github.com/user-attachments/assets/99c60c91-80e5-4bce-a74d-69b85e29e6be)<br>
---
![002](https://github.com/user-attachments/assets/3ff82d21-aeb8-4909-9ed3-524b1166acbd)<br>
---

``📑 Connexion sur le compte utilisateur``

![003](https://github.com/user-attachments/assets/7c46272c-778f-46fa-ba8d-31e5b8fd60f9)<br>
---

``📑 Création d'un ticket``

![004](https://github.com/user-attachments/assets/9c08904a-e19c-438d-99c0-643b0ed9fe45)<br>
---
![005](https://github.com/user-attachments/assets/7492bda0-3a30-4111-b8c9-e7053a177089)<br>
---
![006](https://github.com/user-attachments/assets/256e0ded-178e-4eb7-9a06-eaff91a1e264)<br>
---
![007](https://github.com/user-attachments/assets/090410c2-bf6b-4e5e-9187-0e6f90667ca5)<br>
---
![008](https://github.com/user-attachments/assets/bd91bc7c-502e-443e-b81d-5b2469b01c5d)<br>
---

``📑 Réception, traitement et clos du ticket de l'utilisateur sur le compte admin (billu)``

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

``📑 Réception de la solution et clos du ticket de l'utilisateur``

![014](https://github.com/user-attachments/assets/ba16ef29-f360-40c5-8ecf-cdbb037c384e)<br>
---
![015](https://github.com/user-attachments/assets/1cb4aa23-ae56-4c5a-a01a-7b315a646813)<br>
---
![016](https://github.com/user-attachments/assets/727f4b31-1bfb-4279-a855-5f1910002970)<br>
---

## 🎯 Documentation : Installation et configuration AD DS sur serveur Windows Core via script POWERSHELL

Le script, créé en PowerShell, permet de paramétrer la bonne adresse IP + masque ainsi que les adresses DNS, puis d'installer les rôles ADD-DS, DNS et outils graphiques sur le serveur Core. La dernière étape consiste à ajouter le Serveur Core au domaine `Billu.com` en se connectant avec le compte administrator du domaine.

[Script ADDS Serveur Core](https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/S03/Script_Install_ADDS_DNS_Core.ps1)

Lorsque nous lançons le script, il nous rappelle les paramètres qu'il va appliquer avant le lancement. Dans le cas d'un besoin de changer un paramètre, il suffit de modifier la bonne variable. Toutes les variables des paramètres sont en début de script.  
![Capture d'écran 2024-12-05 120342](https://github.com/user-attachments/assets/40df7883-5635-451b-9191-e658cc8dbf5f)

Le script attends la réponse de l'utilisateur pour continuer, il faut tapper `[yes]` pour continuer (Si on tape [non], on sort du script) :  
![Capture d'écran 2024-12-05 121232](https://github.com/user-attachments/assets/26963fec-1ea5-4748-ba5b-7848d808f91d)
