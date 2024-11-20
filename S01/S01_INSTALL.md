# EN COURS DE REMPLISSAGE..

# Documentation d'installation et configuration de Proxmox avec Windows Server 2022 et Windows 10

## 1. Installation de Proxmox

### Prérequis
- Un serveur avec un processeur compatible VT-x/AMD-V.
- Processors : 2.
- 8 Go de RAM.
- 30 Go de stockage minimum (SSD recommandé pour de meilleures performances).


### Étapes d'installation
1. **Téléchargez l'ISO de Proxmox** sur [le site officiel](https://www.proxmox.com/en/proxmox-ve).
2. **Configurez le mot de passe administrateur** et l'adresse IP du serveur.
3. **Accédez à l'interface web de Proxmox** via `https://<IP_SERVEUR>:8006`.

---

## 2. Création des machines virtuelles

### 2.1. Windows Server 2022
1. **Créez une VM** dans Proxmox avec l'ISO de Windows Server 2022.
2. **Configurez le réseau en mode interne** pour utiliser un réseau privé (`vmbr1`).
3. **Démarrez la VM** et installez Windows Server 2022.

***4. Information sur l'installation sur Proxmox en cours..***

### 2.2. Windows 10
1. **Créez une VM** dans Proxmox avec l'ISO de Windows 10.
2. **Configurez le réseau en mode interne** (`vmbr1`), identique à celui du serveur.
3. **Démarrez la VM** et installez Windows 10.

***4. Information sur l'installation sur Proxmox en cours..***

---

## 3. Configuration du serveur DHCP et DNS sur Windows Server 2022

### 3.1. Installer le rôle DHCP et DNS
1. **Ouvrir le gestionnaire de serveur** sur Windows Server 2022.
2. **Ajouter des rôles et des fonctionnalités** :
   - Sélectionnez `DHCP Server` et `DNS Server`.
   - Suivez l'assistant pour installer ces rôles.
3. **Redémarrer le serveur** si nécessaire.

### 3.2. Configurer le serveur DHCP
1. Ouvrez **Gestion DHCP** via le menu `Outils` du gestionnaire de serveur.
2. **Créer un nouveau pool d'adresses** :
   - Clic droit sur `IPv4` > `Nouvelle plage d'adresses`.
   - Définissez une plage d'adresses, par exemple `172.18.1.100 - 172.18.1.200`.
   - Configurez les options du serveur (passerelle, DNS, a voir selon configuration du serveur).

3. **Activer le serveur DHCP** :
   - Clic droit sur `DHCP Server` > `Activer`.

### 3.3. Configurer le serveur DNS
1. Ouvrez **Gestion DNS** via le menu `Outils`.
2. **Ajouter une zone de recherche directe** pour votre domaine local, par exemple `srv01.billu.com`.
3. **Ajouter des enregistrements A** pour votre serveur et machines, par exemple :
   - `srv01.billu.com` -> `172.18.1.0` (adresse du serveur).
   - `client1.srv01.billu.com` -> `172.18.1.10` (adresse de Windows 10).

### 3.4. Configurer le client Windows 10 pour utiliser le DHCP
1. Sur **Windows 10**, allez dans `Paramètres réseau` et configurez la carte réseau pour utiliser `Obtenir une adresse IP automatiquement` et `Obtenir les adresses DNS automatiquement`.

---

## 4. Tests et vérification

1. **Vérifiez que Windows 10 reçoit une adresse IP via DHCP** :
   - Ouvrez un terminal et tapez `ipconfig` pour vérifier que l'adresse IP est dans la plage définie par le DHCP.

2. **Vérifiez la résolution DNS** :
   - Sur Windows 10, ouvrez un terminal et tapez `nslookup srv01.billu.com` pour vérifier que le DNS résout correctement le nom du serveur.

3. **Testez la connectivité réseau** :
   - Depuis Windows Server 2022, effectuez un `ping` vers Windows 10 et vice-versa pour vérifier la communication sur le réseau interne.
