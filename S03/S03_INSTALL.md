<details>
<summary><h2> 🎯 Documentation : Installation et configuration de GPO<h1></summary>
<br>


## 🎯 Documentation : Installation et configuration de GPO

Suivez les étapes ci-dessous pour créer et configurer des Group Policy Objects (GPOs)

---

### 🎯 **Étape 1 : Ouvrir la gestion des stratégies de groupe**
1. Recherchez **Group Policy Management** dans le menu Démarrer.
2. Ouvrez **Group Policy Management Console (GPMC)**.

![AD-1](https://github.com/user-attachments/assets/bc94d2bc-0de2-4779-9ec2-bc383ff2b965)

---

### 🎯 **Étape 2 : Créer un nouveau GPO**
1. Dans la **Group Policy Management**, développez votre domaine (par exemple, `billu.com`).
2. Faites un clic droit sur votre domaine (`billu.com`) ou sur une unité d'organisation (OU) spécifique, telle que **Paris**.
3. Sélectionnez **Create a GPO in this domain, and Link it here...**.

![AD-2](https://github.com/user-attachments/assets/896c5331-ec5b-4d0a-bc56-7207d9026d2c)

4. Nommez la nouvelle GPO en fonction de son objectif (par exemple, `Password Policy`, `Drive Mapping`, etc.)
5. Cliquez sur **OK** pour enregistrer.

![AD-3](https://github.com/user-attachments/assets/7ea9b951-c33a-4228-b926-f4fc700fe443)

---

### 🎯 **Étape 3 : Modifier la GPO**
1. Cliquez avec le bouton droit de la souris sur la GPO nouvellement créée et sélectionnez **Edit**.
2. La fenêtre **Group Policy Management Editor** s'ouvre.

![AD-4](https://github.com/user-attachments/assets/14aabf60-a547-4284-b05a-b1569546799b)

---

### 🎯 **Etape 4 : Configurer les paramètres de la GPO**

#### **Exemple : Politique de mot de passe**
1. Dans le **Group Policy Management Editor**, naviguez jusqu'à :
Computer Configuration → Policies → Windows Settings → Security Settings → Account Policies → Password Policy

2. Double-cliquez sur chaque paramètre pour le configurer :
- **Enforcer l'historique des mots de passe** : Régler à `5`.
- **Longueur minimale du mot de passe** : Définir à `12`.
- Complexité du mot de passe** : Enable.
- **Age maximum du mot de passe** : Fixé à `90 jours`.

![AD-5](https://github.com/user-attachments/assets/411331cd-a0d4-4043-bb44-619abec094d2)
![AD-6](https://github.com/user-attachments/assets/96d7e7cf-35af-41e2-b9e3-292d2fcab432)
![AD-7](https://github.com/user-attachments/assets/6fa02976-2de4-4cdd-bf5a-8170d05cf56e)

---

### 🎯 GPO de Sécurité
- **Nom de la GPO** : Account Lockout
- **Description** : Verrouiller les comptes après 5 tentatives infructueuses
- **Étapes de configuration** :  
  1. Ouvrir la GPO Stratégie du mot de passe pour l'éditer
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

### 🎯 GPO Standard
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

### 🎯 GPO Standard
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

</details>

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
