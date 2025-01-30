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
  
- Puis choisir une des trois options selon les tâches à effectuer.

![FREEPBX1](https://github.com/user-attachments/assets/3620a205-9864-48ca-8a42-a571a498134e)


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

- **Édite le fichier ``/var/www/html/index.html``** :

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

- **Ajouter un fichier ``next.html`` dans le dossier ``/var/www/html/``** :

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

## 📑Étape 3 : Configuration de la Box Internet

- **Configurer la redirection de port** :

- **Rediriger le port externe ``80`` de la box vers le port interne ``80`` de la VM**.

- **Tester l’accès depuis un appareil connecté en 4G** :

- **Utiliser l’adresse IP publique de la box : ``http://Adresse_IP_Publique``**.
  
- **Sécuriser la connexion** :

- **Modifier la règle NAT/PAT pour rediriger un autre port externe, comme ``22545``, vers le port interne ``80``**.
  
- **Tester avec le port personnalisé** :

``Exemple : http://Adresse_IP_Publique:22545``

## 📑Étape 4 : Enregistrement d’un Nom de Domaine

- **Créer un nom de domaine dynamique sur ``no-ip``** :

- **Connectez-vous sur ``no-ip`` et créer un hostname** :

``Hostname : BilluServer``<br>
``Domain : Sélectionne un domaine, ex. tssr.net``<br>
``Record Type : A``<br>
``IPV4 Address : Ton adresse IP publique``.

- **Accèder à votre site via le domaine** :

``Exemple : http://BilluServer.tssr.net:22545``.

## 📑 Étape 5 : Mise en Place d’un Reverse Proxy

- **Installer Apache sur la VM proxy** :

```bash
apt install apache2 -y
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_balancer
a2enmod lbmethod_byrequests
```

``systemctl restart apache2``

- **Configure le fichier ``VirtualHost``** :

- **Sauvegarde ``/etc/apache2/sites-available/000-default.conf``** :

``cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak``

- **Éditer ``/etc/apache2/sites-available/000-default.conf``** :

```bash
<VirtualHost *:22545>
    ServerName BilluServer.tssr.net

    ProxyPreserveHost On
    ProxyPass / http://<Adresse_IP_Du_Serveur>:80/
    ProxyPassReverse / http://<Adresse_IP_Du_Serveur>:80/

    <Location />
        Order allow,deny
        Allow from all
    </Location>
</VirtualHost>
```

- **Configurer le port d’écoute** :

- **Éditer ``/etc/apache2/ports.conf`` et ajouter** :

``Listen 22545``

- **Activer la configuration et redémarrer Apache** :

```bash
a2ensite 000-default.conf
systemctl restart apache2
```

- **Configurer la box pour rediriger le port externe ``22545`` vers la VM proxy**.

- **Tester l’accès via le reverse proxy** :

``Exemple : http://HomeHomeWCS.webhop.me:22545``.

- **Basculer vers le port ``80``** :

- **Modifie le VirtualHost pour écouter sur le port ``80``**.

``Exemple : http://HomeHomeWCS.webhop.me``.

---

## **Le serveur web est maintenant fonctionnel, sécurisé et accessible depuis l’extérieur grâce à un reverse proxy**. 🎉

![WEB1](https://github.com/user-attachments/assets/ad358a8b-7293-42da-afeb-3af5321688d7)<br>

![WEB2](https://github.com/user-attachments/assets/8b8961d5-1380-4638-a6cc-0e1d25783564)

</details>
