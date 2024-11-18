# Plan de Mise en Place de l'Infrastructure Réseau

## Étape 1 : Analyse et Préparation
### Matériel nécessaire :
- Routeurs.
- Switchs réseau.
- Points d’accès Wi-Fi professionnels.
- 1 serveur pour gérer les utilisateurs (contrôleur de domaine) et les fichiers.
- Un NAS ou un serveur avec stockage redondant.
- Proxmox.

### Organisation des utilisateurs :
- Créer 167 comptes utilisateurs.
- Associer chaque utilisateur à son département (exemple : Finance, Recrutement, etc.).

---

## Étape 2 : Conception du Réseau
### Adresse réseau :
- Conserver la plage d’adresses IP actuelle `172.18.1.0/24` :
  - Réserver une plage pour les serveurs.
  - Réserver une plage pour les équipements réseau.
  - Le reste des adresses sera attribué aux PC des utilisateurs via DHCP.

### Schéma réseau :
- Routeur principal pour gérer l'accès Internet.
- Switchs pour les connexions filaires.
- Points d’accès Wi-Fi pour remplacer les répéteurs existants.
- Serveurs pour gérer les utilisateurs et le stockage de données.

### Convention de nommage :
- **Comptes utilisateurs** : `prenom.nom` (exemple : jean.dupont).
- **Machines** : `NomDepartement-PC-XX` (exemple : DEV-PC-01 pour le département développement).

---

## Étape 3 : Installation Initiale
### Serveurs virtuels sur Proxmox :
1. Créer un serveur Active Directory (Windows Server) pour gérer les utilisateurs.
2. Créer un serveur de fichiers pour stocker les données.

### Réseau physique :
- Installer le routeur, les switchs et les points d’accès Wi-Fi.
- Configurer le routage réseau pour connecter tout le matériel.
- Configurer un serveur DHCP pour distribuer automatiquement les adresses IP aux utilisateurs.

---

## Étape 4 : Gestion des Utilisateurs et des Groupes
### Création des utilisateurs dans Active Directory :
1. Importer les 167 comptes utilisateurs via un fichier CSV.
2. Organiser les utilisateurs en groupes (par exemple, par département).
3. Appliquer des règles de sécurité (mot de passe complexe, expiration).

### Accès réseau :
- Créer des espaces partagés sur le serveur de fichiers pour chaque département.
- Configurer des permissions pour chaque groupe (lecture, écriture, etc.).

---

## Étape 5 : Sécurisation et Sauvegarde
### Sécurité réseau :
1. Installer un pare-feu pour sécuriser le trafic réseau.

### Sauvegarde :
- Configurer un système de sauvegarde automatique pour le serveur de fichiers.
- Définir une rétention des sauvegardes (exemple : garder les données 30 jours).

---

## Étape 6 : Tests et Validation
### Tests techniques :
1. Tester la connexion réseau et le Wi-Fi.
2. Vérifier que les utilisateurs peuvent se connecter à leurs comptes et accéder aux fichiers.
3. Tester la récupération des données sauvegardées.

### Validation :
- Présenter un rapport détaillé au formateur.
- Documenter toutes les étapes et les configurations.

---

## Synthèse du Matériel et Logiciels
### Matériel nécessaire :
- Routeur principal.
- Switchs réseau.
- Points d’accès Wi-Fi.
- NAS ou serveur avec stockage redondant pour les données.

### Logiciels et outils :
- Windows Server pour Active Directory.
- Protocol pour les partages réseau.
- Proxmox pour gérer les serveurs virtuels.
- Antivirus et outils de monitoring réseau.

### Ressources humaines :
- Créer et gérer les 167 comptes utilisateurs.
