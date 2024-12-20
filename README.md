# Projet 📑 : Mise en place d’une infrastructure réseau pour l'entreprise BillU 
---

## Description du Projet 📑

Ce projet vise à créer une nouvelle infrastructure réseau pour la société BillU, une filiale de RemindMe spécialisée dans le développement de logiciels de facturation. L'objectif est de moderniser l'architecture réseau existante pour répondre aux besoins croissants de l'entreprise, assurer la sécurité des données, améliorer la collaboration interne, et permettre une évolutivité future.

L'infrastructure actuelle est limitée : un réseau Wi-Fi basique, des PC en workgroup sans sécurité, et un stockage sur NAS grand public sans redondance. Ce projet a pour ambition de transformer ce système rudimentaire en une architecture robuste et fiable.

---

## Objectifs du Projet 📑

- **Objectif 1** : Concevoir et implémenter une architecture réseau moderne, sécurisée et évolutive, adaptée aux besoins de l'entreprise.

- **Objectif 2** : Mettre en place une solution centralisée pour la gestion des utilisateurs, la sécurité d’accès, et les partages de fichiers afin de simplifier l'administration du système.

- **Objectif 3** : Mettre en place un système de sauvegarde régulier et de protection des données, garantissant leur sécurité et leur disponibilité.

- **Objectif 4** : Installer un système de communication interne performant et sécurisé, incluant la messagerie et la téléphonie, pour améliorer les échanges au sein de l'entreprise.

- **Objectif 5** : Déployer une solution de gestion centralisée des ordinateurs pour assurer une sécurité optimale et simplifier la maintenance.

- **Documentation et Support** : Fournir des guides clairs pour l'installation, l'utilisation, et la maintenance du projet, ainsi que des ressources pour le support continu.

- **Collaboration et Rôles** : Définir les rôles de chaque membre du projet, clarifier les responsabilités et assurer une communication fluide au sein de l'équipe pour une gestion efficace.


---

## Organisation de l'Équipe 📑

| Semaine       | Charles      | Nicolas      | William      | Julien       |
|---------------|----------------|----------------|----------------|----------------|
| **Semaine 1** | Rôle : ``Technicien 💻`` | Rôle : ``Product Owner 🎯`` | Rôle : ``Technicien 💻`` | Rôle : ``Scrum Master 🧑‍🤝‍🧑`` |
| **Semaine 2** | Rôle : ``Product Owner 🎯``         | Rôle : ``Technicien 💻``         | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         | Rôle : ``Technicien 💻``         |
| **Semaine 3** | Rôle : ``Technicien 💻``         | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         | Rôle : ``Technicien 💻``         | Rôle : ``Product Owner 🎯``          |
| **Semaine 4** | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         | Rôle : ``Technicien 💻``         | Rôle : ``Product Owner 🎯``         | Rôle : ``Technicien 💻``          |
| **Semaine 5** | Rôle : ``Technicien 💻``         | Rôle : ``Product Owner 🎯``         | Rôle : ``Technicien 💻``         | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         |
| **Semaine 6** | Rôle : ``Product Owner 🎯``         | Rôle :          | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         | Rôle : ``Technicien 💻``         |
| **Semaine 7** | Rôle : ``Technicien 💻``         | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         | Rôle : ``Technicien 💻``         | Rôle :``Product Owner 🎯``          |
| **Semaine 8** | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         | Rôle : ``Technicien 💻``         | Rôle : ``Product Owner 🎯``         | Rôle : ``Technicien 💻``         |
| **Semaine 9** | Rôle : ``Technicien 💻``         | Rôle : ``Product Owner 🎯``         | Rôle : ``Technicien 💻``         | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         |
| **Semaine 10** | Rôle :``Product Owner 🎯``          | Rôle : ``Technicien 💻``         | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         | Rôle : ``Technicien 💻``         |
| **Semaine 11**| Rôle : ``Technicien 💻``         | Rôle : ``Scrum Master 🧑‍🤝‍🧑``         | Rôle : ``Technicien 💻``         | Rôle :``Product Owner 🎯``          |

---

## Mise en place du suivi des objectifs du projet :bookmark_tabs:

* Tableau d'objectifs de groupe choisi : **Template n°2**  
* Tableau d'objectifs individuels : **Template n°3**  

---

## Fonctionnalités :bookmark_tabs:

1. **Gestion des utilisateurs** : 
   - Centralisation des comptes via un annuaire (ex : Active Directory).
   - Politique de mots de passe et authentification sécurisée.

2. **Sécurisation du réseau** :
   - Séparation des départements avec des VLANs.
   - Installation de pare-feu et VPN pour un accès sécurisé.

3. **Infrastructure et stockage** :
   - Serveurs de fichiers et NAS avec redondance pour sécuriser les données.
   - Amélioration du matériel réseau (Wi-Fi, switchs).

4. **Messagerie et collaboration** :
   - Solution de messagerie collaborative.
   - Centralisation des boîtes mails et calendriers.

5. **Sécurité des données** :
   - Authentification multifactorielle (MFA) et antivirus.
   - Sauvegarde des données en local et cloud.

6. **Gestion des périphériques** :
   - Gestion à distance des PC portables.
   - Sécurisation des connexions Wi-Fi avec mots de passe.

7. **Téléphonie** :
   - Solution VoIP pour la téléphonie fixe et mobile.

8. **Nomadisme (futur)** :
   - Préparation pour le télétravail avec outils collaboratifs sécurisés.


---

## Prérequis :bookmark_tabs:

- **Environnement nécessaire** :
  - **Serveur** (Proxmox) :
    - Processeur : 2 cœurs.
    - Mémoire : 8 Go de RAM pour le serveur Proxmox.
    - Stockage : 100 Go ou plus, avec des disques séparés pour le système et les VMs.
    - Système d'exploitation : Proxmox VE 7.x ou version supérieure.
    - Carte réseau : Interne.

- **Configuration réseau** :
  - **Serveur Proxmox** : 
    - Adresse IP fixe dans le réseau 172.18.1.0/24 (ex : 172.18.1.x).
    - VLAN : Utilisation de VLAN pour isoler les différentes machines virtuelles, si nécessaire.
    - Routeur : Configuration des routes réseau si plusieurs VLANs ou sous-réseaux sont utilisés.
  - **VM Windows Server 2022** :
    - Adresse IP statique dans le même réseau interne (ex : 172.18.1.x).
    - Accès réseau : Carte réseau interne.
  - **Client Windows 10 Pro** :
    - Adresse IP obtenue via DHCP ou statique dans le même sous-réseau (ex : 172.18.1.x).
    - Connexion via Ethernet ou Wi-Fi stable.

- **Services requis** : 
  - **DHCP** : Configurer un serveur DHCP sur la VM Windows Server 2022 pour l’attribution automatique des adresses IP aux clients.
  - **DNS** : Configurer un serveur DNS sur la VM Windows Server 2022 pour la résolution des noms internes.
  - **Active Directory (AD)** : Installer et configurer AD sur la VM Windows Server 2022 pour la gestion des utilisateurs et des ressources.
  - **VPN** : Mettre en place un serveur VPN sur le serveur pour sécuriser l'accès à distance.
  - **Sauvegarde** : Mettre en place une solution de sauvegarde (pour le serveur ou les serveurs).


---

## Fonctionnalités et Améliorations Potentielles :bookmark_tabs:

1. **FAQ et Dépannage** : Ajouter une FAQ pour les erreurs courantes et documenter les étapes de dépannage. 
2. **Extension des Fonctionnalités** : Idées pour améliorer ou ajouter de nouvelles fonctionnalités pour enrichir le projet.
