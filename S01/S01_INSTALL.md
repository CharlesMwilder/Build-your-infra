# Documentation d'installation et de configuration de Proxmox avec Windows Server 2022 et Windows 10 :bookmark_tabs:

## 1. Installation de Proxmox :bookmark_tabs:

### Prérequis matériels
- **Processeur** : 2 cœurs, compatible VT-x/AMD-V.
- **RAM** : 8 Go.
- **Stockage** : 100 Go.
- **Carte réseau** : PONT + Interne.

### Étapes d'installation
1. **Téléchargez l'ISO de Proxmox** depuis le [site officiel de Proxmox](https://www.proxmox.com).
2. **Configuration de l'installateur** :
   - Sélectionnez la langue et la disposition du clavier.
   - Choisissez le disque sur lequel installer Proxmox.
   - Configurez le mot de passe administrateur et l'adresse IP du serveur.
5. **Finalisation de l'installation** :
   - L'installation prendra quelques minutes.
   - Une fois terminée, redémarrez le serveur et connectez-vous via l'interface web de Proxmox à l'adresse `https://<IP_SERVEUR>:8006`.

## 2. Création des machines virtuelles (VM) :bookmark_tabs:

### 2.1. Windows Server 2022
1. **Téléchargez l'ISO de Windows Server 2022** depuis le site officiel de Microsoft.
2. **Créez une nouvelle VM dans Proxmox** :
   - Allez dans l'interface web de Proxmox, cliquez sur "Create VM" (Créer une VM).
   - Dans l'onglet "OS", sélectionnez l'ISO de Windows Server 2022.
   - Dans l'onglet "Hardware", allouez 4 Go de RAM et 2 cœurs CPU.
   - Dans l'onglet "Network", configurez le réseau en mode interne (utilisez `vmbr1` pour un réseau privé).
3. **Démarrez la VM** et installez Windows Server 2022 :
   - Suivez les instructions pour configurer le serveur (choisissez une installation "Standard" et définissez un mot de passe pour l'administrateur).

### 2.2. Windows 10
1. **Téléchargez l'ISO de Windows 10** depuis le site officiel de Microsoft.
2. **Créez une nouvelle VM pour Windows 10** :
   - Allez dans l'interface web de Proxmox, cliquez sur "Create VM" (Créer une VM).
   - Dans l'onglet "OS", sélectionnez l'ISO de Windows 10.
   - Allouez 4 Go de RAM et 2 cœurs CPU pour la VM.
   - Dans l'onglet "Network", configurez le réseau en mode interne (utilisez `vmbr1` pour le même réseau que Windows Server 2022).
3. **Démarrez la VM** et installez Windows 10 :
   - Suivez les instructions pour configurer Windows 10.

## 3. Configuration du serveur DHCP et DNS sur Windows Server 2022 :bookmark_tabs:

### 3.1. Installer le rôle DHCP et DNS
1. Ouvrez **Gestionnaire de serveur**.
2. Cliquez sur **Ajouter des rôles et fonctionnalités**.
3. Sélectionnez les rôles **DHCP Server** et **DNS Server**.
4. Suivez l'assistant pour installer ces rôles et redémarrez le serveur si nécessaire.

### 3.2. Configurer le serveur DHCP
1. Ouvrez **Gestion DHCP** via le menu Outils du gestionnaire de serveur.
2. **Créer un nouveau pool d'adresses** :
   - Clic droit sur **IPv4** > **Nouvelle plage d'adresses**.
   - Définissez une plage d'adresses, par exemple `172.18.1.100 - 172.18.1.200`.
   - Configurez les options du serveur : passerelle (routeur), DNS (l'adresse de votre serveur DNS local).
3. **Activer le serveur DHCP** :
   - Clic droit sur **DHCP Server** > **Activer**.

### 3.3. Configurer le serveur DNS
1. Ouvrez **Gestion DNS** via le menu Outils.
2. Créez une **zone de recherche directe** pour votre domaine local, par exemple `srv01.billu.com`.
3. Ajoutez des enregistrements A pour votre serveur et les machines :
   - `srv01.billu.com -> 172.18.1.0` (adresse de Windows Server 2022).
   - `client1.srv01.billu.com -> 172.18.1.10` (adresse de Windows 10).

### 3.4. Configurer le client Windows 10 pour utiliser le DHCP
1. Allez dans **Paramètres** > **Réseau et Internet** > **Carte réseau**.
2. Configurez la carte réseau pour utiliser **Obtenir une adresse IP automatiquement** et **Obtenir les adresses DNS automatiquement**.

## 4. Tests et vérification :bookmark_tabs:

1. **Vérification de l'adresse IP sur Windows 10** :
   - Ouvrez un terminal et tapez `ipconfig` pour vérifier que l'adresse IP reçue est dans la plage définie par le serveur DHCP (par exemple, 172.18.1.100 - 172.18.1.200).
   
2. **Vérification de la résolution DNS** :
   - Sur Windows 10, ouvrez un terminal et tapez `nslookup srv01.billu.com` pour vérifier que le DNS résout correctement le nom du serveur.
   
3. **Test de la connectivité réseau** :
   - Depuis **Windows Server 2022**, effectuez un ping vers **Windows 10** et vice-versa pour vérifier la communication sur le réseau interne.
   - Par exemple, depuis Windows Server, tapez `ping 172.18.1.10`.
