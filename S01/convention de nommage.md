# Convention de Nommage pour l'Infrastructure :bookmark_tabs:

---

## **1. Nom de Domaine** :bookmark_tabs:
- FQDN (Nom de Domaine Entièrement Qualifié) : `billu.com`  
  Exemple pour un serveur : `srv01.billu.com`

---

## **2. Unités Organisationnelles (OU)** :bookmark_tabs:
### **Structure** :
- **Niveaux** : 2 ou 3 niveaux
  - Niveau 1 : Par Localisation (ex. : `Paris`)
  - Niveau 2 : Par Département (ex. : `Finance`, `Communication`, `Développement`)
  - Niveau 3 : Optionnel pour les services ou sous-fonctions (ex. : `Relation Médias`, `Rédacteur`)

### **Exemple de Hiérarchie** :
- **Par Département** : 
```
Paris
  ├── Direction
  ├── DSI (IT)
  ├── Communication
  ├── Juridique
  ├── Développement
  ├── Finance
  ├── QHSE
  ├── Commercial
  └── Recrutement
```


---

## **3. Groupes de Sécurité** :bookmark_tabs:
### **Convention de Nommage** :
- **Format** : `[Scope]_[Type]_[Department/Function]`
  - Scope : `L` (Local), `G` (Global)
  - Type : `US` (Utilisateurs), `PC` (Ordinateurs), `FN` (Fonctionnalités)
  - Department/Function : Identifier le département ou la fonction associée.

### **Exemples** :
- `G_US_FINANCE` : Groupe global pour les utilisateurs de Finance.
- `L_PC_DEV` : Groupe local pour les ordinateurs du département Développement.
- `G_FN_COMMU_MAN` : Groupe global pour les fonctionnalités Manager dans Communication.

---

## **4. Ordinateurs** :bookmark_tabs:
### **Placement** :
- Organiser les ordinateurs dans l'AD selon :
  - Localisation (ex. : `Paris\PCs`)
  - Département (ex. : `Finance\Laptops`)

### **Convention de Nommage** :
- **Format** : `[Brand]-[Type]-[Department]-[ID]`
  - Brand : Marque de l’ordinateur (HP, Dell, Lenovo, etc.)
  - Type :
    - `LT` : Laptops
    - `DT` : Desktops
    - `SRV` : Serveurs
  - Department : Département de l’appareil.
  - ID : Numéro unique.

### **Exemples** :
- `HP-LT-COMM-001` : Laptop HP dans Communication.
- `DELL-SRV-FS-01` : Serveur Dell (File Server).
- `LENOVO-DT-FIN-001` : Desktop Lenovo dans Finance.

---

## **5. Utilisateurs** :bookmark_tabs:
### **Placement** :
- Grouper par :
  - Département (ex. : `Paris\Utilisateurs`)
  - Fonction (ex. : `Marketing\Utilisateurs`)

### **Convention de Nommage** :
- **Format** : `[FirstInitialLastName]_[Department]`
  - Standard : `CMickleburgh_COMM` : Charles Mickleburgh dans Communication.
  - Homonymes : Ajouter un numéro (ex. : `CMickleburgh2_DEV`).
  - Temporaire : Préfixe `TMP_` (ex. : `TMP_RBen`).

---

## **6. Objets de Stratégie de Groupe (GPO)** :bookmark_tabs:
### **Convention de Nommage** :
- **Format** : `[Target]_[Department]_[Function]_[Version/Date]`
  - Target : `USER` (Utilisateurs), `SEC` (Sécurité), `CONFIG` (Configuration).
  - Department : Département associé.
  - Function : Fonction ou objectif de la GPO.
  - Version/Date : Révision ou version de la GPO.

### **Exemples** :
- `SEC_COMM_FIREWALL-v1` : GPO de sécurité pour le firewall dans Communication.
- `CONFIG_DEV_TESTENV-2024` : GPO de configuration pour l’environnement de test dans Développement.
- `USER_QHSE_COMPLIANCE-2024` : GPO utilisateur pour la conformité QHSE.


