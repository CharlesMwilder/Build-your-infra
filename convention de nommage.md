# Convention de Nommage pour l'Infrastructure

---

## **1. Nom de Domaine**
- FQDN (Nom de Domaine Entièrement Qualifié) : `billu.com`  
  Exemple pour un serveur : `srv01.billu.com`

---

## **2. Unités Organisationnelles (OU)**
### **Structure** :
- **Niveaux** : 2 ou 3 niveaux
  - Niveau 1 : Par Localisation (ex. : `Paris`)
  - Niveau 2 : Par Département (ex. : `Finance`, `Marketing`)
  - Niveau 3 Optionnel : Par Fonction (ex. : `Admins`, `Utilisateurs`)

### **Exemples de Hiérarchie** :
- **Par Département** : 
```
Paris
  ├── Direction
  ├── DSI
  └── IT
```

---

## **3. Groupes de Sécurité**
### **Convention de Nommage** :
- Préfixe selon le **Type de Contenu** :
- `US_` : Utilisateurs
- `PC_` : Ordinateurs
- `FN_` : Fonctionnalités
- Ajouter un **Objectif** :
- `US_Marketing` : Utilisateurs Marketing
- `PC_Ventes` : PC Ventes
- Ajouter la **Portée** :
- Locale : `L_`
- Globale : `G_`

Exemple : `G_US_IT_Admins` (Groupe global pour les administrateurs IT)

---

## **4. Ordinateurs**
### **Placement** :
- Organiser les ordinateurs dans l'AD selon :
- Localisation (ex. : `Paris\PCs`)
- Département (ex. : `Finance\Laptops`)

### **Convention de Nommage** :
- Type Physique :
- `LT` : Laptops
- `DT` : Desktops
- `SRV` : Serveurs
- Rôle :
- `AD` : Contrôleur de Domaine
- `FS` : Serveur de Fichiers
- Ajouter un ID ou localisation unique :  
`LT-PA-001` : Laptop 1 à Paris  
`SRV-AD-01` : Contrôleur de Domaine 1

---

## **5. Utilisateurs**
### **Placement** :
- Grouper par :
- Département (ex. : `Paris\Utilisateurs`)
- Fonction (ex. : `Marketing\Utilisateurs`)

### **Convention de Nommage** :
- Standard : `InitialePrénomNom` (ex. : `JDoe`)
- Homonymes : Ajouter un numéro (ex. : `JDoe2`)
- Temporaire : Préfixe `TMP_` (ex. : `TMP_JDoe`)

---

## **6. Objets de Stratégie de Groupe (GPO)**
### **Convention de Nommage** :
- Préfixe selon **Cible** :
- `USER_` : GPO spécifique aux utilisateurs
- `SEC_` : Paramètres de sécurité
- `CONFIG_` : Configuration
- Ajouter la **Portée** :
- Domaine entier : `DOMAIN_`
- Département spécifique : `MARKETING_`
- Ajouter Version/Date :
- `v1` ou `2024-01`

Exemple : `SEC_MARKETING_2024-v1`
