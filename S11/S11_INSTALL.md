<details>
<summary><h1>🎯 Installation et test de MEDUSA<h1></summary>

# 📑 Installation de MEDUSA sur Debian 12

## 📑 1. Mise à jour des dépôts

- Avant d'installer quoi que ce soit, il est recommandé de mettre à jour les dépôts et d'assurer que ton système est à jour.

``sudo apt update && sudo apt upgrade -y``

## 📑 2. Installation des dépendances nécessaires

- Medusa nécessite certaines bibliothèques et outils pour fonctionner correctement. Installe-les avec la commande suivante :

``sudo apt install build-essential libssl-dev libssh-dev libpcap-dev libjpeg-dev -y``

## 📑 3. Téléchargement et installation de Medusa

## a) Cloner le dépôt GitHub de Medusa

- Télécharge la dernière version stable de Medusa depuis GitHub en clonant le dépôt :


```cd ~
git clone https://github.com/foospidy/medusa.git
cd medusa
```

## b) Compiler Medusa

- Compile le code source avec la commande make :

``make``

## c) Installer Medusa

- Une fois la compilation terminée, installe Medusa avec la commande make install :


``make install``

## 📑 4. Vérification de l'installation

- Une fois l'installation terminée, vérifie que Medusa a été correctement installé en exécutant :

``medusa -h``

- Cela devrait afficher l'interface de ligne de commande de Medusa avec les options disponibles.

## 📑 5. Installation via APT (optionnelle)
   
- Si tu préfères utiliser la version précompilée disponible dans les dépôts Debian (bien que ce ne soit pas toujours la dernière version), tu peux installer Medusa via APT :

``apt install medusa -y``

- Note que cette version peut être plus ancienne que celle disponible sur GitHub.

- Résumé des étapes :

- Mise à jour du système :

``apt update && sudo apt upgrade -y``

- Installation des dépendances :

``sudo apt install build-essential libssl-dev libssh-dev libpcap-dev libjpeg-dev -y``

- Cloner le dépôt GitHub de Medusa :

```
git clone https://github.com/foospidy/medusa.git
cd medusa
```

- Compiler Medusa :

``make``

- Installer Medusa :

``make install``

- Vérifier l'installation :

``medusa -h``

---

- Lancer un brute force avec la commande : 

``medusa -h <cible> -u <utilisateur> -P <chemin_vers_mots_de_passe> -M <protocole> -t 1``

``-h <cible>`` : Spécifie l'hôte cible.<br>
``-u <utilisateur>`` : Spécifie le nom d'utilisateur pour l'attaque.<br>
``-P <chemin_vers_mots_de_passe>`` : Spécifie le fichier contenant les mots de passe à tester.<br>
``-M <protocole>`` : Spécifie le protocole (par exemple, ssh, ftp, http, etc.).<br>
``-t 1`` : Cette option permet de limiter le nombre de tentatives simultanées à 1. Cela peut aider à arrêter plus rapidement l'attaque en cas de succès.<br>

*Medusa s'arrêtera automatiquement lorsque le bon mot de passe sera trouvé, mais si tu veux être encore plus spécifique sur l'arrêt de l'attaque, tu peux aussi jouer avec les paramètres comme ``-F`` pour forcer l'arrêt en cas de succès.*

![MEDUSA1](https://github.com/user-attachments/assets/a6cf2732-e835-4707-a1f6-66ba10a52fdc)


</details>

---

<details>
<summary><h1>🎯 Installation et test de NMAP<h1></summary>

   
## 📑 1. Installation de NMAP :

``apt update``<br>
``apt install nmap``

## 📑 2. Test de scan NMAP :

![NMAP1](https://github.com/user-attachments/assets/4ae48da3-43d4-4ecb-96f4-898b9c22edbd)


## 📑 Rapport d'Analyse Nmap

## 📑 Informations Générales
- **Commande utilisée :** `nmap 172.18.255.254`
- **Version de Nmap :** 7.93
- **Date et heure du scan :** 13 février 2025 à 11:10 CET
- **Hôte analysé :** `SRVWIN01.billu.com` (172.18.255.254)
- **Statut de l'hôte :** **Actif** (répond en 0.00048s)
- **Nombre de ports filtrés (bloqués) :** **987**

## 📑 Ports ouverts détectés

| Port  | Protocole | État  | Service associé |
|-------|----------|-------|----------------|
| 22    | TCP      | Open  | SSH |
| 53    | TCP      | Open  | DNS (domain) |
| 88    | TCP      | Open  | Kerberos |
| 135   | TCP      | Open  | Microsoft RPC (msrpc) |
| 139   | TCP      | Open  | NetBIOS Session Service (netbios-ssn) |
| 389   | TCP      | Open  | LDAP |
| 445   | TCP      | Open  | Microsoft-DS (partages SMB) |
| 464   | TCP      | Open  | Kerberos kpasswd |
| 593   | TCP      | Open  | HTTP RPC EPMAP |
| 636   | TCP      | Open  | LDAPS (LDAP sécurisé) |
| 3268  | TCP      | Open  | Global Catalog LDAP |
| 3269  | TCP      | Open  | Global Catalog LDAPS (sécurisé) |
| 3389  | TCP      | Open  | Microsoft Remote Desktop (RDP) |

## 📑 Analyse et Implications

### 📑 Présence de services Windows Active Directory
- **LDAP (389, 636)** et **Global Catalog (3268, 3269)** indiquent que cette machine est probablement un **contrôleur de domaine (Domain Controller)**.
- **Kerberos (88, 464)** confirme l'authentification AD.
- **SMB (445, 139)** permet l'accès aux partages réseau.
- **RPC (135, 593)** utilisé pour la gestion distante.

### 📑 Présence d'un accès distant
- **SSH (22)** peut être utilisé pour une connexion sécurisée.
- **RDP (3389)** permet un accès graphique à distance à la machine.

### 📑 Port DNS (53) ouvert
- Indique que cette machine peut également jouer un rôle de serveur DNS.

## 📑 Recommandations
1. **Sécuriser l'accès distant :** Restreindre l'accès à SSH (22) et RDP (3389) uniquement aux adresses IP de confiance.
2. **Vérifier la configuration LDAP et Kerberos :** S'assurer que ces services sont bien sécurisés pour éviter toute exploitation.
3. **Surveiller SMB (445) et NetBIOS (139) :** Ces ports sont souvent ciblés par des attaques (ex: EternalBlue).
4. **Appliquer des pare-feu et règles d'accès strictes** pour limiter l'exposition de services sensibles.

</details>

---

<details>
<summary><h1>🎯 Installation et test de hping3<h1></summary>
   
## 📑 Installation des paquets :  

   ``sudo apt install hping3``  
   
## 📑 Découverte d'autres machines du réseau

![Capture d'écran 2025-02-13 162114](https://github.com/user-attachments/assets/ea75011f-ea14-4ffc-af6b-6fddcaab95b0)

## 📑 Envoie d'ICMP flood sur le LAN du PfSense 

- *Avant envoi :*  

![Capture d'écran 2025-02-13 162439](https://github.com/user-attachments/assets/19731b3d-53da-4eaa-9a79-e0e530c49ade)  

- *Pendant envoi :*

![Capture d'écran 2025-02-13 162552](https://github.com/user-attachments/assets/ea3d11f2-bd6c-46ac-b529-20b592c05262)  

- *Doublement des ICMP flood (2 terminaux)*  

![Capture d'écran 2025-02-13 162900](https://github.com/user-attachments/assets/5880fc3b-a035-4134-b542-a6cd9340a89c)  

## 📑 Scan des ports sur DC principal

![Capture d'écran 2025-02-13 164932](https://github.com/user-attachments/assets/cca91e75-adc2-436d-905e-a56bef9a6f99)  

## 📑 Scan des ports sur PfSense

![Capture d'écran 2025-02-13 165023](https://github.com/user-attachments/assets/d6f20096-0337-449e-b04b-6dd80347a424)  

## 📑 Scan des ports sur FreePBX 

![Capture d'écran 2025-02-13 165239](https://github.com/user-attachments/assets/26e89cb5-673d-44f8-b10c-cf7547d78ff2)

## 📑 Attaque DOS de type TCP SYN Flood sur le serveur web 

![Capture d'écran 2025-02-13 170756](https://github.com/user-attachments/assets/e05dca91-a148-4423-b851-befc178d4228)  

- **Flux passant dans PfSense, 21 Méga Octets par seconde**  

![Capture d'écran 2025-02-13 172624](https://github.com/user-attachments/assets/87df935c-8b38-47aa-8a13-ca0796e7ee0e)


- **On voit bien le serveur Web (172.18.11.254) attaqué sur le port 80 depuis des IP sources random**  

![Capture d'écran 2025-02-13 170650](https://github.com/user-attachments/assets/50234452-1017-42d8-930b-b2480e311802)  

- **Vérification sur Wireshark avec un serveur avec GUI pour observer en temps réel**  

![Capture d'écran 2025-02-13 181054](https://github.com/user-attachments/assets/c7edf588-af2c-4bac-b845-0c4fc331a084)


- **Le PfSense n'a pas apprécié 😅**
  
![Capture d'écran 2025-02-13 170859](https://github.com/user-attachments/assets/51ba9152-7821-4fe5-97c7-c91cdd9f80c6)  


</details>

---

<details>
<summary><h1>🎯 Présentation BILLU<h1></summary>

[Presentation.BILLU.pdf](https://github.com/user-attachments/files/18826053/Presentation.BILLU.pdf)

</details>

---

<details>
<summary><h1>🎯 Installation et test de ZENMAP<h1></summary>

# 📑 Installation de ZENMAP sur Debian 12

## 📑 1. Télécharger la clé GPG de kali linux

``wget -q -O - https://archive.kali.org/archive-key.asc | sudo gpg --dearmor -o /usr/share/keyrings/kali-archive-keyring.gpg``

## 📑 2. Ajouter les dépôts kali linux dans /etc/apt/sources.list

``deb [signed-by=/usr/share/keyrings/kali-archive-keyring.gpg] http://http.kali.org/kali kali-rolling main non-free contrib``  
``deb-src [signed-by=/usr/share/keyrings/kali-archive-keyring.gpg] http://http.kali.org/kali kali-rolling main non-free contrib``  

## 📑 3. Mettre à jour la liste des paquets

``apt update && apt upgrade -y``

## 📑 4. Afficher la liste des méta-paquets disponible

``apt-cache search kali-tools-``

## 📑 5. Installation du méta-paquet default

``apt install kali-linux-default``  
> Plus de détails : https://www.kali.org/tools/kali-meta/#kali-linux-default  

## 📑 6. Aperçu de l'interface et scan d'une adresse ip

![image](https://github.com/user-attachments/assets/b0210ae5-ce16-4fec-9051-c862e21ff49f)

## 📑 7. Type de scan disponible

![image](https://github.com/user-attachments/assets/95579daa-5184-45a9-9d8d-509a6f4cc2b9)

## 📑 8. Aperçu de la map

![zenmap2](https://github.com/user-attachments/assets/3b95da8c-2475-4817-8042-e9256af091a1)
