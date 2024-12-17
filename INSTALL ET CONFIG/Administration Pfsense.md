# Documentation de l'Infrastructure 🖥️

## 1. Prérequis matériel/logiciel 📦

### Matériel requis :
- Un serveur ou poste compatible avec PFsense.
- Switch L2 pour les VLANs.
- Câbles Ethernet.

### Logiciels requis :
- **PFsense Community Edition**, version 2.7.0 ou supérieure.
- Navigateur Web pour accéder à l'interface (Firefox, Chrome ou Edge).

### Version d'OS et logiciels :
- **OS** : PFsense CE (basé sur FreeBSD 13).
- **Logiciel** : Aucune application supplémentaire nécessaire sur PFsense.

---


## 2. Configuration/Utilisation ⚙️

### Cible 🎯
Poste administrateur pour PFsense configuré comme routeur et firewall sur le réseau `192.168.10.0/24`. Il gère les VLANs suivants :
- **VLAN10** à **VLAN100** pour divers sous-réseaux (plage d'adresses `192.168.255.1` à `192.168.255.254`).
- **VLAN255** réservé aux serveurs (plage d'adresses `192.168.255.1` à `192.168.255.254`).

### Étapes de configuration/utilisation 🔧

#### 📸 Configuration initiale :
1. Créez les VLANs dans l’interface Web de PFsense :
   - Allez dans `Interfaces > Assignments > VLANs`.
   - Ajoutez un VLAN pour chaque ID (10, 20, ... jusqu'à 255).
   - Assignez ces VLANs à l'interface LAN physique.

#### 📸 Réglages supplémentaires :
- **Firewall Rules** :
  - Allez dans `Firewall > Rules` et ajoutez des règles pour autoriser le trafic entre les VLANs ou le limiter selon les besoins.
- **DHCP** :
  - Configurez un service DHCP pour chaque VLAN dans `Services > DHCP Server`.

#### 📸 Utilisation quotidienne :
- Supervisez les logs via `Status > System Logs`.
- Ajoutez ou modifiez des règles de pare-feu ou NAT en fonction des besoins.

---

## 3. FAQ ❓

- **Problème** : Impossible d'accéder à l'interface Web.  
  **Solution** : Assurez-vous que votre PC est dans le réseau `192.168.10.0/24` et que l'adresse IP est correctement configurée.

- **Problème** : Les VLANs ne fonctionnent pas correctement.  
  **Solution** : Vérifiez que les ports correspondants sur le switch sont configurés en mode *tagged* pour les VLANs.

- **Problème** : Les règles de pare-feu ne s'appliquent pas.  
  **Solution** : Assurez-vous que les règles sont bien assignées à l'interface correcte (VLAN ou LAN).

---

## 4. Optimisation 🏎️

### Choix du hardware 💻
- Privilégiez un processeur multi-cœurs (**Intel i3** ou supérieur) avec au moins **8 Go de RAM** pour gérer de multiples VLANs et un trafic élevé.

### Mise à jour régulière du système 🔄
#### Recommandations :
- Mettez à jour PFsense tous les 6 mois en passant par `System > Update`.
- Sauvegardez la configuration avant chaque mise à jour via `Diagnostics > Backup/Restore`.

---

## 5. Restauration rapide en cas de défaillance 🔄

### Clone miroir 💾

A REMPLIR !
