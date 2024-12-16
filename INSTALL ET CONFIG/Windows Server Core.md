# Documentation de l'Infrastructure Windows Server Core (Serveur secondaire pour redondance AD DS, DHCP, DNS et backup du serveur principal) 🖥️

## 1. Prérequis matériel/logiciel 📦
- **Matériel requis :**
  - Processeur : [min 1.4 GHz 64-bit]
  - Mémoire RAM : [min 2 Go]
  - Espace disque : [min 32 Go]
  - Carte réseau compatible Ethernet
- **Logiciels requis :**
  - **Windows Server 2022 Core Edition**
  - **.NET Framework 4.8 ou supérieur** (pour certains outils de gestion)
- **Version d'OS et logiciels :**
  - **OS** : Windows Server 2022 Core Edition (version [x.x.x])
  - **Services** : DHCP, DNS, Active Directory Domain Services (AD DS)

## 2. Installation ⚙️

### Étapes d'installation 🚀
1. **Téléchargement de Windows Server Core :**  
   - Télécharger l'ISO de **Windows Server 2022 Core Edition** depuis [Microsoft](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server).
2. **Préparation de l'environnement :**  
   - Créer une machine virtuelle ou utiliser un serveur physique avec les spécifications matérielles recommandées.
3. **Installation pas-à-pas :**
   - 📸 **Étape 1 :** Démarrer à partir du support d'installation et choisir "Windows Server 2022 Core Edition".
   - 📸 **Étape 2 :** Configurer les paramètres de base (partitions de disque, réseau, etc.) pendant l'installation via l'interface texte.
   - 📸 **Étape 3 :** Une fois l'installation terminée, redémarrer le serveur et accéder à l'invite de commande.
4. **Vérification du résultat :**
   - 📸 **Résultat attendu :** Le serveur doit démarrer en mode Core, avec une invite de commande et une connexion réseau valide.

## 3. Configuration/Utilisation ⚙️

### Cible 🎯
- Serveur **Windows Server Core** configuré avec **DHCP**, **DNS** et **Active Directory Domain Services (AD DS)**, relié à un domaine existant pour la redondance.

### Étapes de configuration/utilisation 🔧

#### 3.1. Configuration du rôle DHCP 🔄
1. **Installation du rôle DHCP :**
   - Ouvrir PowerShell en tant qu’administrateur sur le serveur Core.
   - Exécuter la commande suivante pour installer le rôle DHCP :
     ```powershell
     Install-WindowsFeature -Name DHCP -IncludeManagementTools
     ```
2. **Configurer le serveur DHCP :**
   - **Définir une étendue d'adresses IP :**
     ```powershell
     Add-DhcpServerv4Scope -Name "MainScope" -StartRange 192.168.1.100 -EndRange 192.168.1.200 -SubnetMask 255.255.255.0
     ```
   - **Activer le serveur DHCP :**
     ```powershell
     Set-Service -Name DHCPServer -StartupType Automatic
     Start-Service DHCPServer
     ```
   - **Configurer les options DHCP (par exemple, passerelle, DNS) :**
     ```powershell
     Set-DhcpServerv4OptionValue -OptionId 3 -Value 192.168.1.1  # Passerelle
     Set-DhcpServerv4OptionValue -OptionId 6 -Value 192.168.1.2  # Serveur DNS
     ```

3. **Vérification du service DHCP :**
   - 📸 **Résultat attendu :** Le service DHCP doit être actif et fournir des adresses IP aux clients.

#### 3.2. Configuration du rôle DNS 🌐
1. **Installation du rôle DNS :**
   - Exécuter la commande suivante pour installer le rôle DNS :
     ```powershell
     Install-WindowsFeature -Name DNS -IncludeManagementTools
     ```
2. **Configurer DNS pour joindre le domaine principal :**
   - Ajouter le serveur DNS du domaine existant dans la configuration DNS du serveur Core :
     ```powershell
     Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.1.2
     ```
3. **Vérification du service DNS :**
   - 📸 **Résultat attendu :** Le serveur DNS doit résoudre les noms internes du domaine et diriger les requêtes vers le serveur DNS primaire du domaine.

#### 3.3. Configuration de Active Directory Domain Services (AD DS) 🔑
1. **Installation d'Active Directory :**
   - Installer le rôle AD DS en exécutant la commande suivante :
     ```powershell
     Install-WindowsFeature -Name AD-Domain-Services
     ```
2. **Promouvoir le serveur en contrôleur de domaine secondaire :**
   - Exécuter la commande PowerShell suivante pour rejoindre un domaine existant :
     ```powershell
     Install-ADDSDomainController -DomainName "example.local" -Credential (Get-Credential) -InstallDns:$true -NoGlobalCatalog:$false
     ```
   - **Rejoindre le domaine existant (réplication et redondance) :** 
     Le serveur Core va se promouvoir en tant que **contrôleur de domaine secondaire**, ce qui permet de créer une redondance pour l'Active Directory.
   
3. **Vérification du service AD DS :**
   - 📸 **Résultat attendu :** Le serveur devient contrôleur de domaine secondaire, et les utilisateurs et groupes sont répliqués depuis le contrôleur de domaine primaire.

## 4. FAQ ❓
- **Problème : Le service DHCP ne distribue pas d'adresses IP.**
  - **Solution :** Vérifiez si l'étendue DHCP est correctement configurée et si le service DHCP est bien démarré.
  
- **Problème : Le serveur DNS ne résout pas les noms internes.**
  - **Solution :** Assurez-vous que le serveur DNS est correctement configuré pour utiliser le serveur DNS principal du domaine et que la zone DNS est bien répliquée.

- **Problème : Impossible de rejoindre le domaine.**
  - **Solution :** Vérifiez que le serveur Core peut communiquer avec le contrôleur de domaine principal et que les informations d'identification sont correctes.

## 5. Optimisation 🏎️

### Choix du hardware 💻
- Pour un serveur **Windows Server Core** avec DHCP, DNS et AD DS :
  - Processeur : Xeon ou équivalent, avec au moins 4 cœurs.
  - RAM : 8 Go minimum.
  - Disque : SSD de 100 Go ou plus pour de meilleures performances.

### Mise à jour régulière du système 🔄
- **Recommandations :**  
  - Configurer Windows Update pour effectuer des mises à jour automatiques.
  - Vérifiez les mises à jour de sécurité tous les mois et après chaque mise à jour majeure de Windows Server.

## 6. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾
1. **Créer un clone miroir de Windows Server Core :**
   - Utiliser des outils comme **Windows Server Backup** ou des solutions tierces pour créer une image complète du serveur Core.
   - 📸 **Procédure :** Utiliser la commande PowerShell pour exporter une image système :
     ```powershell
     wbAdmin start backup -backuptarget:D: -include:C: -allcritical -quiet
     ```

### Script de restauration OS 🖥️
- **Restauration complète via PowerShell :**
  ```powershell
  wbAdmin start recovery -version:MM/DD/YYYY-HH:MM -itemType:Volume -items:C: -recoveryTarget:C:
