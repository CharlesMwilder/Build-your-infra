# PLANNING SEMAINE 5

## SPRINT 5 🏃‍♂️

| **Tâche**                                      | **Description**                                                                                                          |
|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Gestion des dossiers partagés** 📊           | Mettre en place des dossiers réseaux pour les utilisateurs avec des droits d'accès selon les groupes AD. Mappage via GPO, script PowerShell/batch ou profil utilisateur AD. Créer des dossiers individuels, de service, et de département avec des lettres de mappage spécifiques (I, J, K). |
| **Stockage des données** 📊                    | Mettre en place un volume dédié pour le stockage des données. Sécuriser le partage des dossiers via des groupes AD et assurer un bon mappage des lecteurs pour les utilisateurs. |
| **RAID 1 sur serveur** 📊                      | Configurer un RAID 1 sur un serveur pour garantir la redondance des données et améliorer la sécurité du stockage. |
| **LVM sur Debian** 📊                          | Mettre en place LVM (Logical Volume Management) sur un serveur Debian pour permettre une gestion flexible des partitions. |
| **Sauvegarde de données** 📊                   | Mettre en place un système de sauvegarde de données, définir les données à sauvegarder (ex. dossiers partagés), et planifier les sauvegardes à l'aide de scripts, tâches planifiées ou logiciels. |
| **Mise en place de LAPS** 📊                   | Installer LAPS (Local Administrator Password Solution) pour gérer les mots de passe administrateur local, avec une gestion via la console AD (GUI) et l'installation sur un client via GPO ou script PS. |
| **Gestion des objets AD** 📊                   | Automatiser le déplacement des ordinateurs vers les bonnes unités organisationnelles (OU) en fonction du nom de la machine ou d'un attribut AD, à l'aide d'un script PowerShell et d'une tâche planifiée. |
| **Sécurisation de l'accès utilisateur** 📊     | Restreindre les heures de connexion des utilisateurs standard de 7h30 à 20h, du lundi au samedi, avec une possibilité de bypass pour les administrateurs et une gestion des exceptions via un groupe dédié. |
| **Optimisation de l'infrastructure réseau** 📊 | S'assurer que chaque élément de l'infrastructure (serveurs, services, équipements) est bien documenté et optimisé. Cela inclut des prérequis matériels/logiciels, des versions d'OS et logiciels, et des procédures d'installation détaillées. La documentation doit être à jour et inclure des FAQ et des captures d'écran. L'infrastructure doit être optimisée par le choix adéquat du hardware, des mises à jour système régulières et des stratégies de restauration rapide en cas de défaillance (clones miroir, scripts de restauration d'OS et de configuration). |


## EQUIPES ET ROLES 🏢

| **Nom**          | **Rôle**          | **Description**                                     |
|-------------------|-------------------|-----------------------------------------------------|
| NICOLAS | Product Owner 🎯  | Responsable de définir les besoins et priorités du projet. |
| JULIEN | Scrum Master 🧑‍🤝‍🧑    | Garant du respect de la méthodologie Agile et facilitateur.|
| CHARLES | Technicien  💻    | Responsable des aspects techniques et de la mise en œuvre. |
| WILLIAM | Technicien 💻     | Responsable des aspects techniques et de la mise en œuvre. |


## OBJECTIS GLOBAL ET PERSO 🥇

GLOBAL :
https://docs.google.com/spreadsheets/d/1gD5fyAN9Olu2De5SCk6L1eNOps8n7Q6Vp1-fZeFyTuI/edit?gid=151497379#gid=151497379

PERSO:
https://docs.google.com/spreadsheets/d/1gD5fyAN9Olu2De5SCk6L1eNOps8n7Q6Vp1-fZeFyTuI/edit?gid=1139160082#gid=1139160082
