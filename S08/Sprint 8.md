# PLANNING SEMAINE 8

## SPRINT 8 🏃‍♂️

| **Objectif**                                   | **Description**                                                                                                                                                          |
|-------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **SÉCURITÉ - Serveur de gestion des mises à jour WSUS** 🔐 | - Mettre en place un serveur de gestion des mises à jour WSUS sur une **VM dédiée**.<br>- Liaison avec l'**Active Directory** :<br>  - Les groupes dans WSUS liés à l'AD.<br>  - Les mises à jour sont liées aux **OU** (Unités d'Organisation).<br>- Gestion différenciée des mises à jour pour les :<br>  - **Clients**<br>  - **Serveurs**<br>  - **DC (Domain Controllers)**.<br>- Gestion des rôles **FSMO** entre les **DC**.<br>- Assurer au moins **3 DC** sur le domaine. |
| **PARTENARIAT D'ENTREPRISE - VPN site-à-site** 🌐 | - Mettre en place un VPN site-à-site entre les deux réseaux d'entreprise pour une communication sécurisée. |
| **PARTENARIAT D'ENTREPRISE - Active Directory** 🔑 | - Choisir l'une des deux solutions pour la gestion des **AD** en commun :<br>  - Fusion de domaines<br>  - Relation de confiance.<br>- Gérer l'accès distant pour les membres IT de l'autre entreprise (full access => à décider). |
| **PARTENARIAT D'ENTREPRISE - FIREWALL** 🛡️ | - Mettre à jour les règles de pare-feu pour permettre le trafic réseau entre les deux réseaux d'entreprise (ping, etc.).<br>- Permettre l'accès à l'interface de gestion du pare-feu aux administrateurs de l'autre entreprise (full access => à décider). |
| **PARTENARIAT D'ENTREPRISE - SUPERVISION** 📈 | - Mettre en place une supervision globale pour les deux entreprises :<br>  - **Réseau**<br>  - **Matériel**<br>  - **Services**.<br>- Permettre l'accès à l'interface de gestion de la supervision aux administrateurs de l'autre entreprise (full access => à décider). |
| **PARTENARIAT D'ENTREPRISE - STOCKAGE** 🗂️ | - Ajouter des dossiers partagés entre les utilisateurs des deux sociétés dans la structure existante.<br>- Permettre l'accès à la gestion de la sécurité des dossiers partagés aux administrateurs de l'autre entreprise (full access => à décider). |
| **PARTENARIAT D'ENTREPRISE - SERVEUR BASTION** 🔒 | - Mettre en place un serveur **Guacamole** sur chaque infrastructure.<br>- Utilisation **Externe-Interne** : permet à une personne externe au réseau d'accéder aux serveurs de l'entreprise via une plateforme centralisée. |
| **PARTENARIAT D'ENTREPRISE - SERVEUR RDP** 🖥️ | - Mettre en place un serveur Windows **RDP** sur chaque infrastructure.<br>- Utilisation **Interne-Interne** : permet à une personne interne au réseau d'accéder aux serveurs de l'entreprise via une plateforme centralisée. |



## EQUIPES ET ROLES 🏢

| **Nom**          | **Rôle**          | **Description**                                     |
|-------------------|-------------------|-----------------------------------------------------|
| WILLIAM | Product Owner 🎯  | Responsable de définir les besoins et priorités du projet. |
| CHARLES | Scrum Master 🧑‍🤝‍🧑    | Garant du respect de la méthodologie Agile et facilitateur.|
| NICOLAS | Technicien  💻    | Responsable des aspects techniques et de la mise en œuvre. |
| JULIEN | Technicien 💻     | Responsable des aspects techniques et de la mise en œuvre. |


## OBJECTIS GLOBAL ET PERSO 🥇

GLOBAL : https://docs.google.com/spreadsheets/d/1gD5fyAN9Olu2De5SCk6L1eNOps8n7Q6Vp1-fZeFyTuI/edit?gid=6251786#gid=6251786


PERSO : https://docs.google.com/spreadsheets/d/1gD5fyAN9Olu2De5SCk6L1eNOps8n7Q6Vp1-fZeFyTuI/edit?gid=1820486547#gid=1820486547
