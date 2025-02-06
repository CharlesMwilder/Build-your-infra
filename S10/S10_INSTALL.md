<details>
<summary><h1>🎯 Installation et test de NIKTO<h1></summary>

## 📑 Installation de NIKTO : 

- **Mettre à jour les paquets et installer les dépendances** :

``apt update && sudo apt install git perl -y``

- **Cloner le dépôt officiel de Nikto** :

``git clone https://github.com/sullo/nikto.git``

- **Aller dans le dossier de Nikto** :

``cd nikto/program``

- **Lancer Nikto avec Perl** :

``perl nikto.pl -h http://exemple.com``

*(Remplacer http://exemple.com par l'URL de votre site que vous voulez scanner.)*

---

🚨🚨🚨 *9 erreurs détectées avant correction* 🚨🚨🚨 :

![NIKTO1](https://github.com/user-attachments/assets/3f43b25c-b5f0-4385-aa76-36d9c7677f84)<br>


🚨🚨🚨 *3 erreurs détectées après correction* 🚨🚨🚨 :
  
![NIKTO2](https://github.com/user-attachments/assets/32aebfa4-a406-4a6c-9109-a05374c35269)

</details>


---

<details>
<summary><h1>🎯 Installation et test de PSScriptAnalyzer<h1></summary>

## 📑 Installation de PSScriptAnalyzer : 

- **Installer à l'aide de PowerShellGet 2.x** :

``Install-Module -Name PSScriptAnalyzer -Force``

- **Lancer une analyse de script** :

``Invoke-ScriptAnalyzer -Path "C:\Chemin\Vers\VotreScript.ps1"``

---

🚨🚨🚨 *Erreurs détecter* 🚨🚨🚨

![SCRIPTANALIZER1](https://github.com/user-attachments/assets/74ce178a-a1bd-46fb-b502-73fbe1f30304)<br>


🚨🚨🚨 *Erreurs corriger* 🚨🚨🚨

![SCRIPTANALIZER2](https://github.com/user-attachments/assets/d25b51b4-b9ba-47ee-9d2d-b69718f4016d)


</details>

---

<details>
<summary><h1>🎯 Installation et test de Purple Knight<h1></summary>  

- **Il faut remplir un formulaire pour recevoir un lien de téléchargement. Ensuite il faut autoriser l'ouverture du dossier zip (avant de le dézipper)** :  
  
![Capture d'écran 2025-02-05 180622](https://github.com/user-attachments/assets/036bf37a-98a3-4259-9b22-e222878a3edd)  

- **Lancer ensuite l'exécutable** :  **``PurpleKnight.exe``**

![Capture d'écran 2025-02-05 171100](https://github.com/user-attachments/assets/b7aa4c50-cfd9-4403-9f4a-8d6eb5fc5793)<br> 

![Capture d'écran 2025-02-05 171115](https://github.com/user-attachments/assets/0b66a956-80d6-4df0-b7a6-1d852c0acf76)<br>

![Capture d'écran 2025-02-05 171128](https://github.com/user-attachments/assets/7a0d32a1-f01d-4591-a1cd-fd126514b56b)<br> 

![Capture d'écran 2025-02-05 171216](https://github.com/user-attachments/assets/cc7d58d2-f6d9-4a92-b4fa-d4a87b976f5e)<br> 

![Capture d'écran 2025-02-05 175504](https://github.com/user-attachments/assets/44fde063-390b-4371-a42a-2e91f9948bd0)  

---

- **Désactivation du service ``Spooler`` sur nos 2 contrôleurs de domaines** :

![Capture d'écran 2025-02-05 174209](https://github.com/user-attachments/assets/4778c455-5138-45e2-965c-b278305a7fc4)<br> 

![Capture d'écran 2025-02-05 175157](https://github.com/user-attachments/assets/8cc3f9a1-5daf-42d3-b0e7-9aa333feb619)<br>  

![Capture d'écran 2025-02-05 174903](https://github.com/user-attachments/assets/c1a22477-3ba5-4b72-b8eb-2875270c50dc)<br>  

![Capture d'écran 2025-02-05 184956](https://github.com/user-attachments/assets/27b8d287-4b5d-4b30-883e-761d30ceda95)  

  
</details>

---

<details>
<summary><h1>🎯 Installation et test de LYNIS<h1></summary>

## 📑 Installation de LYNIS : 

- **Télécharger le paquet depuis le github** :

``wget https://github.com/CISOfy/lynis/archive/refs/tags/3.1.4.tar.gz``

- **Extraire le paquet** :

 ``tar -zxf 3.1.4.tar.gz``

- **Ce déplacer dans le dossier ``lynis-3.1.4``** :

``cd lynis-3.1.4/``

- **Voir les infos de ``lynis``** :

``./lynis update info``

![LYNIS0](https://github.com/user-attachments/assets/a9f64e41-bec5-4fe0-8492-7c40e524ffba)

- **Puis lancer un audit du système** :

``lynis audit system``

---

![LYNIS1](https://github.com/user-attachments/assets/0df438d0-6c26-4053-8f2d-783eb9b2cf52)<br>

![LYNIS2](https://github.com/user-attachments/assets/722a8ebe-aa08-4f80-874d-97f6691e3d24)<br>

![LYNIS3](https://github.com/user-attachments/assets/a1ff55d1-4212-4fcc-90cc-e88ce245bdb7)<br>

![LYNIS4](https://github.com/user-attachments/assets/d5f1a946-8fc7-4269-8b28-6ec1241b812f)<br>

![LYNIS5](https://github.com/user-attachments/assets/564fe06b-9316-4321-9867-91a3aaddc5fb)<br>

![LYNIS6](https://github.com/user-attachments/assets/d76a55fe-46b5-42ff-aa39-d1b512bcf7e4)<br>

![LYNIS7](https://github.com/user-attachments/assets/cf625c8e-93c3-4c12-b245-f0cf1b759141)<br>

![LYNIS8](https://github.com/user-attachments/assets/ddf58d26-c64d-44b6-b9e8-9b20b61fdcd2)<br>

![LYNIS9](https://github.com/user-attachments/assets/374176e7-138c-4c4a-a39f-fc9a8fc3ed15)<br>

![LYNIS10](https://github.com/user-attachments/assets/043f48b5-d635-425b-b159-11ac56eabf7e)<br>

![LYNIS11](https://github.com/user-attachments/assets/9198af09-091e-4376-b4d3-290116f5e75c)<br>


🚨🚨🚨 *Détails du scan avec SCORE avant modification* 🚨🚨🚨 :

![LYNIS12](https://github.com/user-attachments/assets/85e722a2-8427-42f9-ba73-fb3a918a5a1a)


🚨🚨🚨 *Détails du scan avec SCORE après quelques modifications* 🚨🚨🚨 :

![LYNIS13](https://github.com/user-attachments/assets/50d82d12-045e-4bfc-9c9b-a5879d8d2f76)


---

🚨🚨🚨 *Recommandations pour améliorer le score* 🚨🚨🚨 :

## 📑 Installation de paquets recommandés

- **Installez les paquets suivants pour renforcer la sécurité de votre système** :

``apt-get install debsums apt-listbugs needrestart apt-show-versions fail2ban unattended-upgrades clamav clamav-daemon rkhunter``

- *Clamav : ``Antivirus``.*
- *unattend-upgrades : ``Mises à jour automatiques``.*
- *rkhunter : ``Anti-rootkit``.*
- *Fail2ban : ``Sécurise SSH contre les attaques par brute force``.*


- **Recommandations pour SSH** :

- **Modifiez le fichier ``/etc/ssh/sshd_config`` avec les réglages suivants** :

```java
- Changez le port "SSH" (autre que 22).
- Augmentez les logs à "VERBOSE".
- Réglez LoginGraceTime à "2" minutes.
- Activez "strictModes" (contrôle des fichiers utilisateurs).
- Limitez les tentatives à "3" avec "MaxAuthtries".
- Limitez les sessions simultanées à "2" avec "MaxSessions".
- Activez "PubkeyAuthentication yes" et "PasswordAuthentication yes".
- Désactivez "PermitEmptyPasswords no" et "PermitRootLogin no".
- Désactivez "AllowTcpForwarding no" et "X11Forwarding no".
- Réglez "ClientAliveInterval 300" et "ClientAliveCountMax 0".
- Désactivez le "PrintMotd no" et "Banner none" pour éviter la divulgation d'informations.<br>
```
  
*Ces réglages permettront d'augmenter la sécurité de votre serveur SSH*.


</details>

---

<details>
<summary><h1>🎯 Installation et test de HardenSysvol<h1></summary>  
  
### Installation du module avec PowerShell  

![Capture d'écran 2025-02-06 100535](https://github.com/user-attachments/assets/28dd46d7-5f56-4248-ac18-25bad212d7b7)  

### Lancement de HardenSysvol  

![Capture d'écran 2025-02-06 101255](https://github.com/user-attachments/assets/7c02505e-5269-4697-b914-4f9dea775e64)  

### Résultat du premier scan, en mode standard  

![Capture d'écran 2025-02-06 101459](https://github.com/user-attachments/assets/836c5c4c-c4ed-451d-a2aa-65abf9152a86)  

### Scan avec options étendues  

![Capture d'écran 2025-02-06 101712](https://github.com/user-attachments/assets/ff749af2-ffc5-41d6-adff-d9f9bc0f1aae)




</details>




