<details>
<summary><h1>🎯 Mise en place d'un serveur de téléphonie sur IP avec FREEPBX<h1></summary>

## 📑 Installation de FREEPBX : 

```
cd /tmp
wget https://github.com/FreePBX/sng_freepbx_debian_install/raw/master/sng_freepbx_debian_install.sh  -O /tmp/sng_freepbx_debian_install.sh
bash /tmp/sng_freepbx_debian_install.sh
```

🚨 *Veuillez noter que le script peut prendre environ 30 minutes ou plus à compléter, en fonction des spécifications du système sous-jacent et de la vitesse Internet. Il est recommandé de l'exécuter en arrière-plan et de surveiller la progression dans le fichier journal*. 🚨

---

## 📑 Une fois l'installation finie se connecter directement via : ``http://freepbx.billu.com``

- Première utilisation (création d'un compte admin avec mot de passe).
  
- Puis choisir ``FreePBX Administration``.

![FREEPBX1](https://github.com/user-attachments/assets/c16de851-8c49-46f0-b910-37a84c7c3002)

- Se connecter avec le compte admin créer.

![FREEPBX2](https://github.com/user-attachments/assets/47bfbdf1-b493-4d1e-bf60-7594b52ec17c)

- Ajouter tout les utilisateurs de mon domaine via un ``fichier .csv`` (voir exemple ci-dessous).

![FREEPBX8](https://github.com/user-attachments/assets/be1b778d-039e-4ae7-a5b2-670041e36543)


- Suivre les étapes :

- Aller dans ``Admin`` puis dans ``Bulk Handler``.
  
![FREEPBX3](https://github.com/user-attachments/assets/9b109810-04f4-4565-861c-98e98154f795)

- Cliquer sur ``Import`` puis sur ``Browse``.

![FREEPBX4](https://github.com/user-attachments/assets/fd11e9f0-260c-4fbb-881b-fc0a5755cd6d)

- Choisissez le ``fichier .csv`` puis sur ``Open``.

![FREEPBX5](https://github.com/user-attachments/assets/4403516f-4dce-4a2f-9bd7-a3f03acffa3b)

- Une fois les utilisateurs ajoutés, aller dans ``Connectivity`` puis dans ``Extensions``.

![FREEPBX6](https://github.com/user-attachments/assets/aba5c62e-7954-4fad-9fd5-31f659247bcd)

- On aperçoit bien tous les utilisateurs rentrer dans ``FreePBX`` avec une configuration conforme pour la communication entre différent utilisateurs.

![FREEPBX7](https://github.com/user-attachments/assets/759c945a-573b-429d-aabf-cf50cbcc20ce)

</details>

---

<details>
<summary><h1>🎯 Test de communication entre différent utilisateurs via 3CX<h1></summary>

- Installation de ``3CX`` sur tout les utilisateurs via une GPO.

- Renseigner le numéro de l'utilisateur que nous voulons contacter et lancer l'appel.

- L'utilisateur ``Lucas Duval`` arrive bien, à joindre l'utilisateur ``Valentin Bonnet" et inversement :

![3CX1](https://github.com/user-attachments/assets/4a44a830-5606-45e3-a888-484510864238)

![3CX2](https://github.com/user-attachments/assets/e29ff2bc-da2c-471f-a250-226183aaed53)

</details>

---

<details>
<summary><h1>🎯 Mise en place d'un serveur web avec APACHE<h1></summary>
  
# 📑 Installation et Configuration :

## 📑 Étape 1 : Préparation de la VM webserver

- **Mettre à jour le système et installer Apache** :
   
   ```bash
   apt update && apt upgrade -y
   apt install apache2 -y
  ```
   
- **Vérifier le statut du service Apache** :

``systemctl status apache2``

- **Trouver l’adresse IP de la carte réseau "Accès par pont"** :

- **Utiliser la commande suivante** :

``ip a``

- **Tester l’accès à Apache depuis la machine hôte** :

- **Ouvrir un navigateur et se connecter via ``http://Adresse_IP_privée``**.

## 📑 Étape 2 : Configuration de la Page d’Accueil

- **Modifier la page d’accueil par défaut** :

- **Édite le fichier ``/var/www/html/index.html``** (exemple ci-dessous) :

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BILLU</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://images6.alphacoders.com/120/1201406.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }
        .container {
            text-align: center;
            background: rgba(0, 0, 0, 0.6);
            padding: 40px 60px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.5);
            animation: fadeIn 2s ease-in-out;
        }
        h1 {
            font-size: 4rem;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.5rem;
            margin-top: 0;
        }
        .button {
            margin-top: 20px;
            padding: 15px 30px;
            font-size: 1.2rem;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }
        .button:hover {
            background-color: #218838;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bienvenue chez BILLU !</h1>
        <p>L'avenir de la facturation</p>
        <a href="next.html" class="button">Enter</a>
    </div>
</body>
</html>
```
---

- **Ajouter un fichier ``next.html`` dans le dossier ``/var/www/html/``** (exemple ci-dessous) :

---

```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Présentation de BILLU</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://images8.alphacoders.com/120/1201407.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            flex-direction: column;
        }

        .container {
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            animation: fadeIn 2s ease-in-out;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
        }

        p {
            font-size: 1.2rem;
            line-height: 1.6;
            margin: 10px 0;
            text-shadow: 1px 1px 6px rgba(0, 0, 0, 0.4);
        }

        .highlight {
            color: #ffd700;
            font-weight: bold;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .wave {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 200px;
            background: url('https://svgshare.com/i/tHx.svg') repeat-x;
            animation: waveAnimation 10s linear infinite;
        }

        @keyframes waveAnimation {
            from {
                transform: translateX(0);
            }
            to {
                transform: translateX(-1600px);
            }
        }

        /* Style du bouton */
        .back-button {
            margin-top: 20px;
            padding: 15px 30px;
            font-size: 1.2rem;
            background-color: #ffd700;
            color: black;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .back-button:hover {
            background-color: #ffa500;
            transform: scale(1.1);
        }

        .back-button:active {
            transform: scale(1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bienvenue chez BILLU</h1>
        <p>BillU, filiale du groupe international <span class="highlight">RemindMe</span>,
            est spécialisée dans le développement de logiciels innovants, notamment de facturation.</p>
        <p>Avec <span class="highlight">167 collaborateurs</span> et un siège situé dans le 20e arrondissement de Paris,
            notre mission est de simplifier les processus financiers et d'augmenter l'efficacité opérationnelle de nos clients.</p>
        <p>Répartie en <span class="highlight">9 départements</span>, notre équipe talentueuse mêle expertise en finance et en développement
            logiciel pour fournir des solutions de pointe.</p>

        <!-- Bouton pour retourner à la page index.html -->
        <button class="back-button" onclick="window.location.href='index.html';">Retour à l'index</button>
    </div>
    <div class="wave"></div>
</body>
</html>
```
---

- **Redémarrer Apache** :

``systemctl restart apache2``

## **Le serveur web est maintenant fonctionnel, sécurisé et accessible depuis l’extérieur grâce à un reverse proxy**. 🎉

![WEB1](https://github.com/user-attachments/assets/ad358a8b-7293-42da-afeb-3af5321688d7)<br>

![WEB2](https://github.com/user-attachments/assets/8b8961d5-1380-4638-a6cc-0e1d25783564)

</details>
