<details>
<summary><h1> 🎯 Documentation : Installation et configuration de GPO<h1></summary>
<br>

## 🎯 Documentation : Installation et configuration de GPO

Suivez les étapes ci-dessous pour créer et configurer des Group Policy Objects (GPOs)

GPOs configurés dans ce guide :
1. GPOs de sécurité  
1.1 Politique de mot de passe  
1.2 Verrouillage des comptes  
1.3 Restrictions d'installation de logiciels  
1.4 Gestion des mises à jour de Windows  
1.5 Restreindre les périphériques amovibles  

2. GPO standard  
2.1 Mappage des lecteurs  
2.2 Fond d'écran  
2.3 Redirection des dossiers  
2.4 Gestion de l'énergie   
2.5 Déploiement de logiciels   

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

#### **Exemple : GPO de Sécurité : Security Politique de mot de passe**
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
  2. Configurer les paramètres de verrouillage
  - Durée du blocage du compte : Réglée sur 15 minutes.
  - Seuil de verrouillage du compte : Réglé sur 3.
  - Réinitialiser le compteur de blocage de compte après : Régler sur 15 minutes.  

![AD-9](https://github.com/user-attachments/assets/74b06d96-595f-4ace-9bf2-0cdf7106edb7)

---

### 🎯 GPO de Sécurité
- **Nom de la GPO** : Software Installation Restrictions
- **Description** : Empêcher les utilisateurs non administrateurs d'installer des logiciels non autorisés
- **Étapes de configuration** :  
  1.  Créer un nouveau GPO : 'Software Restrictions'
  2.  Modifier le GPO
  3.  Créer une nouvelle 'Software Restriction Policy'  
clique droit Software Restriction Policies → Create New Policies  
  
![AD-12](https://github.com/user-attachments/assets/2b39f37f-2764-492a-832a-eb80de4ddb6a)  
![AD-13](https://github.com/user-attachments/assets/b1f0b238-8eb7-44c7-a18a-2cf55451f497)

---

### 🎯 GPO de Sécurité
- **Nom de la GPO** : Windows Update Management
- **Description** : Programmation des mises à jour de Windows et contrôle de l'installation
- **Étapes de configuration** :  
  1. Créer un nouveau GPO : Windows Update Management
  2. Modifier le GPO : Computer Configuration → Policies → Administrative Templates → Windows Components → Windows Update
  3. Configurer les paramètres : Configurer les mises à jour automatiques

![AD-17](https://github.com/user-attachments/assets/a418ea67-0b3b-43a5-925b-0d695630505f)   
![AD-18](https://github.com/user-attachments/assets/9daac085-1107-4872-b3f8-9471c08f8cc8)

---

### 🎯 GPO de Sécurité
- **Nom de la GPO** : Restrict Removable Devices
- **Description** : Bloquer l'accès USB sauf autorisation 
- **Étapes de configuration** :  
  1. Créer un nouveau GPO : Restrict USB Access.
  2. Modifier le GPO : Computer Configuration → Policies → Administrative Templates → System → Removable Storage Access
  3. Configurer les paramètres :  
  All Removable Storage Classes: Deny All Access → Enable
  Computer Configuration → Policies → Administrative Templates → System → Device Installation → Device Installation Restrictions

![AD-23](https://github.com/user-attachments/assets/7b5f342e-b8a4-4953-9171-844e83352aff)  
![AD-22](https://github.com/user-attachments/assets/b095d56b-ed10-4bed-9d4a-2100e0fcfc23)

---

### 🎯 GPO Standard
- **Nom de la GPO** : Drive Mapping
- **Description** : Lier les lecteurs partagés pour les départements
- **Étapes de configuration** :  
  1. Créer un nouveau GPO : Drive Mapping
  2. Modifier le GPO : User Configuration → Preferences → Windows Settings → Drive Maps
  3. Créer une Drive Map : Clique droit Drive Maps → New → Mapped Drive
  4. Configure settings:
Location: e.g., \\Server\Finance.
Label as: e.g., Finance Drive.
Reconnect: Check this box.
  
![AD-27](https://github.com/user-attachments/assets/09cdfd8a-b689-465d-a8a7-c9e3499772aa)  
![AD-28](https://github.com/user-attachments/assets/894ddea6-6417-4543-9dd2-fa15b181aa42)


---

### 🎯 GPO Standard
- **Nom de la GPO** : Screen Background
- **Description** : Définir un Wallpaper unifié pour l'entreprise
- **Étapes de configuration** :  
  1. Créer un nouveau GPO : Screen Background
  2. Modifier le GPO : User Configuration → Policies → Administrative Templates → Desktop → Desktop
  3. Configurer la politique : Desktop Wallpaper → Enabled.  
  Indiquer le chemin d'accès complet au fichier image (e.g., \\Server\Wallpapers\BillU.png).  
  
![AD-30](https://github.com/user-attachments/assets/bbf4e485-c097-493e-bf76-94df0c3626ea)  
![AD-31](https://github.com/user-attachments/assets/951cafe7-b37c-4aff-88fc-37c09ca2018d)


### 🎯 GPO Standard
- **Nom de la GPO** : Folder Redirection
- **Description** : Rediriger les dossiers Desktop et Documents vers un emplacement de serveur partagé.
- **Étapes de configuration** :  
  1. Créer un nouveau GPO : Folder Redirection
  2. Modifier le GPO : User Configuration → Policies → Windows Settings → Folder Redirection
  3. Configurer la redirection : clique droit Documents → Properties.
Définir l'emplacement du dossier cible sur Rediriger vers l'emplacement suivant.
Saisissez le chemin d'accès (par exemple, \Server\RedirectedFolders\%USERNAME\%Documents).  
  
![AD-34](https://github.com/user-attachments/assets/b516f61a-5658-47e7-bc52-84a1243d3dff)


### 🎯 GPO Standard
- **Nom de la GPO** : Software Deployment
- **Description** : Forcer l'installation de logiciels spécifiques sur les utilisateurs
- **Étapes de configuration** :  
  1. Naviguer vers : Computer Configuration → Policies → Software Settings → Software Installation
  2. Ajouter des logiciels pour la publication ou l'affectation.

![AD-39](https://github.com/user-attachments/assets/7fdde4f2-fdc0-4818-97c7-cd78fea67c84)  
![AD-40](https://github.com/user-attachments/assets/88b23090-a24c-4e7d-abe3-44dfef526834)  


### 🎯 GPO Standard
- **Nom de la GPO** : Power Management
- **Description** : Exiger un mot de passe lorsque l'ordinateur sort du mode veille.
- **Étapes de configuration** :  
  1. Naviguer vers : Computer Configuration → Policies → Administrative Templates → System → Power Management
  2. Configurer les paramètres de veille et d'alimentation.

![AD-35](https://github.com/user-attachments/assets/141167fe-49a7-4a00-9c23-e433b1897dc1)  
![AD-38](https://github.com/user-attachments/assets/ecc6505c-2e36-455c-9c5f-a15169ef049f)  

### 🎯 **Étape 5 : Forcer la mise à jour de la GPO**
1. Exécutez la commande suivante sur un ordinateur client ou un serveur pour appliquer immédiatement la nouvelle stratégie :
```powershell
gpupdate /force
```

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

Le script, créé en PowerShell, permet de paramétrer la bonne adresse IP + masque ainsi que les adresses DNS, puis d'installer les rôles AD-DS, DNS et outils graphiques sur le serveur Core. La dernière étape consiste à ajouter le Serveur Core au domaine `Billu.com` en se connectant avec le compte administrator du domaine.

[Script ADDS Serveur Core](https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra/blob/main/S03/Script_Install_ADDS_DNS_Core.ps1)

Lorsque nous lançons le script, il nous rappelle les paramètres qu'il va appliquer avant le lancement. Dans le cas d'un besoin de changer un paramètre, il suffit de modifier la bonne variable. Toutes les variables des paramètres sont en début de script.  
![Capture d'écran 2024-12-05 120342](https://github.com/user-attachments/assets/40df7883-5635-451b-9191-e658cc8dbf5f)

Le script attend la réponse de l'utilisateur pour continuer, il faut tapper `[yes]` pour continuer (Si on tape [non], on sort du script).

La première étape est le changement de nom de l'hôte. Ceci nécéssite un redémarrage et le relancement du script. Si l'hôte comporte le bon nom, l'étape n'est pas appliquée, ce qui permet d'éviter un redémarrage...
![Capture d'écran 2024-12-05 120400](https://github.com/user-attachments/assets/a0edffda-30b6-47a2-851f-48e8a6561494)

Ensuite le script va installer:  
* Les outils graphiques  
* Le rôle AD-DS  
* Le rôle DNS  
  

---
![Capture d'écran 2024-12-05 121318](https://github.com/user-attachments/assets/fd14847a-4315-4069-b189-be1b7cd5f838)
---
La dernière étape est l'ajout de la machine au domaine `Billu.com`. Le script nous demande de nous connecter au domaine avec des droits élevés :  

![Capture d'écran 2024-12-05 131356](https://github.com/user-attachments/assets/d909f97b-5c3c-467a-a3da-211bc64045c1)
---
Tout est installé et la machine est ajoutée au domaine. Un redémarrage est nécéssaire pour prendre en compte les nouveaux paramètres :  

![Capture d'écran 2024-12-05 124103](https://github.com/user-attachments/assets/f59ae564-3061-406c-ba14-675794dbda46)
---
![Capture d'écran 2024-12-05 124430](https://github.com/user-attachments/assets/8c70ccb8-39d7-4aa2-ae35-fe4f64299856)
---
Après redémarrage, nous voyons la machine avec le nouveau nom et l'association au domaine  

![Capture d'écran 2024-12-05 124525](https://github.com/user-attachments/assets/276bbb6c-6af2-4a93-be4c-cb1b363e792c)
---
Nous pouvons nous connecter au serveur graphique pour visualiser le serveur core et finaliser l'installation  

![Capture d'écran 2024-12-05 124139](https://github.com/user-attachments/assets/eb654e32-7769-4cf1-b820-26d43eda2300)
![Capture d'écran 2024-12-05 130249](https://github.com/user-attachments/assets/301f6937-87c3-4076-bafc-a94d3eb4f4c1)
---

