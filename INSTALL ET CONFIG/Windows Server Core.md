# Documentation de l'Infrastructure Windows Server Core (Serveur secondaire pour redondance AD DS, DHCP, DNS et backup du serveur principal) 🖥️

## 1. Prérequis matériel/logiciel 📦
- **Matériel requis :**
  - Processeur : ``1 sockets, 1 core``
  - Mémoire RAM : ``4 Go``
  - Espace disque : ``32 Go``
  - Carte réseau compatible Ethernet
- **Logiciels requis :**
  - **Windows Server 2022 Core Edition**
  - **.NET Framework 4.8 ou supérieur** (pour certains outils de gestion)
- **Version d'OS et logiciels :**
  - **OS** : ``Windows Server 2022 Core Edition``
  - **Services** : ``Active Directory Domain Services (AD DS), DHCP, DNS``

## 2. Installation ⚙️

### Étapes d'installation 🚀
1. **Téléchargement de Windows Server Core :**  
   - Télécharger l'ISO de **Windows Server 2022 Core Edition** depuis (https://drive.google.com/file/d/1Y0J_vJhhiFI5QOPVOlTMcLxs3ERTij-e/view).
2. **Préparation de l'environnement :**  
   - Créer une machine virtuelle ou utiliser un serveur physique avec les spécifications matérielles recommandées.
  
    ---
   
<details>
<summary><h1>⚙️ Installation Windows Server Core</h1></summary>

- 📸 **Étape 1 :** Choisir la langue du système, le format horaire et la langue du clavier (French = AZERTY) puis cliquer sur ``Next``

![WIN1](https://github.com/user-attachments/assets/7160fc6b-a5c0-49e8-b4e1-3dfd097ce5e9)<br>

- 📸 **Étape 2 :** Lancez l'installation

![WIN2](https://github.com/user-attachments/assets/73cd5edd-8de7-40cf-956c-7ebc0bb8774a)<br>

- 📸 **Étape 3 :** Choisir la version ``Standard Evaluation`` puis cliquer sur ``Next``

 ![WINCORE1](https://github.com/user-attachments/assets/2d840349-dd6f-46ad-91aa-90df768d6d0e)<br>

- 📸 **Étape 4 :** Accepter puis cliquer sur ``Next``
 
![WINCORE2](https://github.com/user-attachments/assets/416b6e1f-ccd7-461a-a8a8-c56b09f0790b)<br>

- 📸 **Étape 5 :** Apuuyer sur la touche ``Entrée``

![WINCORE3](https://github.com/user-attachments/assets/4f8e1a87-6e43-4c43-9a93-cf6716f15a60)<br>

- 📸 **Étape 6 :** Veuillez choisir un mot de passe pour le compte Administrateur puis appuyer sur la touche ``Entrée``

![WINCORE4](https://github.com/user-attachments/assets/67f9c9fa-65d1-46a8-9eb5-50b2148da1a8)<br>

- 📸 **Étape 7 :** Apuuyer sur la touche ``Entrée``

![WINCORE5](https://github.com/user-attachments/assets/5aeec4ab-82a5-482a-a719-0061973e8ada)<br>

- 📸 **Étape 8 :** Vous êtes maintenant connecté 👍

![WINCORE6](https://github.com/user-attachments/assets/6d403ce8-abe0-4e6a-b723-a4501ed65ecf)<br>

</details>

---

## 3. Configuration/Utilisation ⚙️

### Cible 🎯 (A REMPLIR !)
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
     Add-DhcpServerv4Scope -Name "MainScope" -StartRange 172.18.1.100 -EndRange 172.18.1.200 -SubnetMask 255.255.255.0
     ```
   - **Activer le serveur DHCP :**
     ```powershell
     Set-Service -Name DHCPServer -StartupType Automatic
     Start-Service DHCPServer
     ```
   - **Configurer les options DHCP (par exemple, passerelle, DNS) :**
     ```powershell
     Set-DhcpServerv4OptionValue -OptionId 3 -Value 172.18.255.254  # Passerelle
     Set-DhcpServerv4OptionValue -OptionId 6 -Value 172.18.255.254 # Serveur DNS
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
     Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 172.18.255.252
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
     Install-ADDSDomainController -DomainName "billu.com" -Credential (Get-Credential) -InstallDns:$true -NoGlobalCatalog:$false
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
  - Processeur : minimum 4 cœurs.
  - RAM : 8 Go minimum.
  - Disque : SSD de 100 Go ou plus pour de meilleures performances.

### Mise à jour régulière du système 🔄
- **Recommandations :**  
  - Configurer Windows Update pour effectuer des mises à jour automatiques.
  - Vérifiez les mises à jour de sécurité tous les mois et après chaque mise à jour majeure de Windows Server.

## 6. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾
1. **Créer un clone miroir de Windows Server Core :**

A REMPLIR !
