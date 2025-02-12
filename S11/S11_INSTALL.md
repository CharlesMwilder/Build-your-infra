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

``medusa -h <cible> -u <utilisateur> -P <chemin_vers_mots_de_passe> -M <protocole> -t 1 -v``

``-h <cible>`` : Spécifie l'hôte cible.<br>
``-u <utilisateur>`` : Spécifie le nom d'utilisateur pour l'attaque.<br>
``-P <chemin_vers_mots_de_passe>`` : Spécifie le fichier contenant les mots de passe à tester.<br>
``-M <protocole>`` : Spécifie le protocole (par exemple, ssh, ftp, http, etc.).<br>
``-t 1`` : Cette option permet de limiter le nombre de tentatives simultanées à 1. Cela peut aider à arrêter plus rapidement l'attaque en cas de succès.<br>
``-v`` : Mode verbose pour afficher plus de détails pendant l'exécution.

*Medusa s'arrêtera automatiquement lorsque le bon mot de passe sera trouvé, mais si tu veux être encore plus spécifique sur l'arrêt de l'attaque, tu peux aussi jouer avec les paramètres comme ``-F`` pour forcer l'arrêt en cas de succès.*

![MEDUSA1](https://github.com/user-attachments/assets/a6cf2732-e835-4707-a1f6-66ba10a52fdc)


</details>

---

<details>
<summary><h1>🎯 Présentation BILLU<h1></summary>

[Présentation BILLU.pdf](https://github.com/user-attachments/files/18772707/Presentation.BILLU.pdf)


</details>
