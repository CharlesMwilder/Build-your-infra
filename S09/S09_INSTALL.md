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

- **Première utilisation (création d'un compte admin avec mot de passe)**.
  
- **Puis choisir ``FreePBX Administration``**.

![FREEPBX1](https://github.com/user-attachments/assets/c16de851-8c49-46f0-b910-37a84c7c3002)

- **Se connecter avec le compte admin créer**.

![FREEPBX2](https://github.com/user-attachments/assets/47bfbdf1-b493-4d1e-bf60-7594b52ec17c)

- **Ajouter tout les utilisateurs de mon domaine via un ``fichier .csv`` (voir exemple ci-dessous)**.

![FREEPBX8](https://github.com/user-attachments/assets/be1b778d-039e-4ae7-a5b2-670041e36543)


- **Suivre les étapes** :

- **Aller dans ``Admin`` puis dans ``Bulk Handler``**.
  
![FREEPBX3](https://github.com/user-attachments/assets/9b109810-04f4-4565-861c-98e98154f795)

- **Cliquer sur ``Import`` puis sur ``Browse``**.

![FREEPBX4](https://github.com/user-attachments/assets/fd11e9f0-260c-4fbb-881b-fc0a5755cd6d)

- **Choisissez le ``fichier .csv`` puis sur ``Open``**.

![FREEPBX5](https://github.com/user-attachments/assets/4403516f-4dce-4a2f-9bd7-a3f03acffa3b)

- **Une fois les utilisateurs ajoutés, aller dans ``Connectivity`` puis dans ``Extensions``**.

![FREEPBX6](https://github.com/user-attachments/assets/aba5c62e-7954-4fad-9fd5-31f659247bcd)

- **On aperçoit bien tous les utilisateurs rentrer dans ``FreePBX`` avec une configuration conforme pour la communication entre différent utilisateurs**.

![FREEPBX7](https://github.com/user-attachments/assets/759c945a-573b-429d-aabf-cf50cbcc20ce)

</details>

---

<details>
<summary><h1>🎯 Test de communication entre différent utilisateurs via 3CX<h1></summary>

- **Installation du logiciel ``3CX`` sur tout les utilisateurs via une GPO**.

- **Renseigner le numéro de l'utilisateur que vous voulez contacter et lancer l'appel**.

- **L'utilisateur ``Lucas Duval`` arrive bien, à joindre l'utilisateur ``Valentin Bonnet`` et inversement** :

![3CX1](https://github.com/user-attachments/assets/4a44a830-5606-45e3-a888-484510864238)<br>

![3CX2](https://github.com/user-attachments/assets/e29ff2bc-da2c-471f-a250-226183aaed53)

</details>

---

<details>
<summary><h1>🎯 Mise en place d'un serveur web avec APACHE<h1></summary>
  
# 📑 Installation et Configuration :

## 📑 Étape 1 : Installation de Apache

- **Mettre à jour le système et installer Apache** :
   
   ```bash
   apt update && apt upgrade -y
   apt install apache2 -y
  ```
   
- **Vérifier le statut du service Apache** :

``systemctl status apache2``

---

## 📑 Étape 2 : Configuration de la Page d’Accueil

- **Modifier la page d’accueil par défaut** :

- **Édite le fichier ``/var/www/html/index.html``** (exemple ci-dessous) :

```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BILLU - Logiciel de Facturation</title>
    <link href="https://fonts.googleapis.com/css?family=Exo:100" rel="stylesheet">
    <style>
        /* Animation du fond */
        @keyframes bg-scrolling-reverse {
            from { background-position: 0 0; }
            to { background-position: 50px 50px; }
        }

        body {
            margin: 0;
            font-family: Exo, Arial, sans-serif;
            background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAIAAACRXR/mAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAABnSURBVHja7M5RDYAwDEXRDgmvEocnlrQS2SwUFST9uEfBGWs9c97nbGtDcquqiKhOImLs/UpuzVzWEi1atGjRokWLFi1atGjRokWLFi1atGjRokWLFi1af7Ukz8xWp8z8AAAA//8DAJ4LoEAAlL1nAAAAAElFTkSuQmCC") repeat;
            background-size: 50px 50px;
            animation: bg-scrolling-reverse 5s linear infinite;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }

        /* En-tête et pied de page réduits */
        header, footer {
            width: 100%;
            background: rgba(0, 0, 0, 0.8);
            padding: 0.7px 0; /* Réduction de la hauteur */
            text-align: center;
            position: absolute;
            left: 0;
            font-size: 0.9rem; /* Taille de police légèrement réduite */
        }

        header {
            top: 0;
        }

        footer {
            bottom: 0;
        }

        /* Bouton hamburger */
        .hamburger {
            position: fixed;
            top: 15px; /* Encore légèrement baissé */
            right: 20px;
            width: 30px;
            height: 25px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            background: transparent;
            border: none;
            cursor: pointer;
            z-index: 1000;
        }

        .hamburger div {
            width: 30px;
            height: 4px;
            background-color: white;
            border-radius: 5px;
        }

        /* Menu latéral */
        .menu {
            position: fixed;
            top: 0;
            right: -250px;
            width: 250px;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.9);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
            transition: 0.3s ease;
            z-index: 999;
        }

        .menu a {
            color: white;
            text-decoration: none;
            font-size: 1.5rem;
            padding: 15px;
            transition: background-color 0.3s ease;
        }

        .menu a:hover {
            background-color: #28a745;
        }

        /* Ouverture du menu latéral */
        .menu.open {
            right: 0;
        }

        /* Conteneur principal */
        .container {
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        p {
            font-size: 1.1rem;
            margin-top: 10px;
        }

        .google-search {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            margin-top: 30px;
        }

        .google-search input[type="text"] {
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: none;
            width: 280px;
            margin-right: 10px;
        }

        .google-search input[type="submit"] {
            padding: 10px 20px;
            font-size: 1rem;
            background-color: #28a745;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            color: white;
            transition: background-color 0.3s;
        }

        .google-search input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <header>
        <h2>BILLU</h2>
    </header>
    
    <!-- Bouton hamburger -->
    <button class="hamburger" onclick="toggleMenu()">
        <div></div>
        <div></div>
        <div></div>
    </button>

    <!-- Menu latéral -->
    <div class="menu" id="menu">
        <a href="next.html">Services</a> 
        <a href="games.html">Games</a>
        <a href="#about">À propos</a>
        <a href="#contact">Contact</a>
    </div>

    <div class="container">
        <h1>Bienvenue chez BILLU</h1>
        <p>L'avenir de la facturation, simple et efficace.</p>
    </div>

    <!-- Barre de recherche Google -->
    <div class="google-search">
        <form method="GET" action="http://www.google.be/search">
            <div align="center">
                <a href="http://www.google.fr/">
                    <img src="./pictures/gif_google.gif" border="0" alt="Logo Google" align="absmiddle" width="80">
                </a>
                <input type="text" name="q" size="31" maxlength="255" value="">
                <input type="hidden" name="hl" value="fr">
                <input type="submit" name="btnG" value="recherche">
            </div>
        </form>
    </div>

    <footer>
        <p>&copy; 2025 BILLU. Tous droits réservés.</p>
    </footer>

    <script>
        function toggleMenu() {
            const menu = document.getElementById('menu');
            menu.classList.toggle('open');
        }
    </script>
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
    <title>Services BILLU</title>
    <style>
        /* Exo thin font from Google */
        @import url('https://fonts.googleapis.com/css?family=Exo:100');

        /* Body setup */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: white;
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAIAAACRXR/mAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAABnSURBVHja7M5RDYAwDEXRDgmvEocnlrQS2SwUFST9uEfBGWs9c97nbGtDcquqiKhOImLs/UpuzVzWEi1atGjRokWLFi1atGjRokWLFi1atGjRokWLFi1af7Ukz8xWp8z8AAAA//8DAJ4LoEAAlL1nAAAAAElFTkSuQmCC') repeat 0 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            padding: 20px;
            text-align: center;
            animation: bg-scrolling-reverse 0.92s infinite linear;
        }

        /* Animations */
        @keyframes bg-scrolling-reverse {
            100% { background-position: 50px 50px; }
        }

        /* Header Section */
        .header {
            text-align: center;
            background: rgba(0, 0, 0, 0.8);
            padding: 15px;
            width: 100%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9999;
        }

        .header h1 {
            font-size: 2.2rem;
            margin: 0;
            color: white; 
        }

        .highlight {
            color: #ffd700;
            font-weight: bold;
        }

        /* Main Content Section */
        .content {
            margin-top: 100px; /* Ajouté plus d'espace au top */
            width: 100%;
        }

        .text-section {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            margin-bottom: 40px; /* Plus d'espace entre les zones */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            max-width: 900px; /* Réduit la largeur de la section */
            margin-left: auto;
            margin-right: auto;
        }

        .text-section p {
            font-size: 1rem;
            line-height: 1.4;
            color: #fff;
        }

        /* Icons Section */
        .icon-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            gap: 8px; /* Réduit l'écart entre les icônes */
            background-color: rgba(0, 0, 0, 0.7); 
            padding: 15px;
            margin-bottom: 40px; /* Plus d'espace avant le bouton */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            max-width: 1000px; /* Réduit la largeur de la zone noire derrière les icônes */
            margin-left: auto;
            margin-right: auto;
        }

        .icon {
            width: 45px; /* Taille réduite des icônes */
            height: 45px;
            transition: transform 0.3s ease, filter 0.3s ease;
            cursor: pointer;
            filter: drop-shadow(0px 0px 5px rgba(255, 255, 255, 0.5));
        }

        .icon:hover {
            transform: scale(1.1);
            filter: drop-shadow(0px 0px 10px rgba(255, 215, 0, 0.8));
        }

        /* Back Button Section */
        .button-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .back-button {
            padding: 10px 25px;
            font-size: 0.9rem;
            background-color: #ffd700;
            color: black;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .back-button:hover {
            background-color: #ffa500;
            transform: scale(1.05);
        }

        /* Footer Section */
        .footer {
            text-align: center;
            background: rgba(0, 0, 0, 0.8);
            padding: 15px;
            width: 100%;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.5);
            position: fixed;
            bottom: 0;
            left: 0;
        }

        .footer p {
            margin: 0;
            font-size: 1rem;
            color: white;
        }

        .status-dot {
            width: 15px;
            height: 10px;
            border-radius: 50%;
            margin-top: 80px;
            margin: 20% auto;
        }

        .status-dot.green {
            background-color: green;
        }

        .status-dot.red {
            background-color: red;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <h1>BILLU</h1>
    </div>

    <!-- Main Content Section -->
    <div class="content">

        <!-- Text Section -->
        <div class="text-section">
            <p>BillU, filiale du groupe international <span class="highlight">RemindMe</span>, est spécialisée dans le développement de logiciels innovants, notamment de facturation.</p>
            <p>Avec <span class="highlight">167 collaborateurs</span> et un siège situé dans le 20e arrondissement de Paris, notre mission est de simplifier les processus financiers et d'augmenter l'efficacité opérationnelle de nos clients.</p>
            <p>Répartie en <span class="highlight">9 départements</span>, notre équipe talentueuse mêle expertise en finance et en développement logiciel pour fournir des solutions de pointe.</p>
        </div>

        <!-- Icons Section -->
        <div class="icon-container">
            <div class="icon-wrapper" data-service="http://192.168.10.254/">
            <a href="http://192.168.10.254/" target="_blank"><img class="icon" src="https://wpcomputersolutions.com/wp-content/uploads/2018/07/pfsense-logo-e1534531558807.png" alt="pfSense"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="http://glpi.billu.com/glpi/">
            <a href="http://glpi.billu.com/glpi/" target="_blank"><img class="icon" src="https://glpi-project.org/wp-content/uploads/2021/06/logo-glpi-bleu-1.png" alt="GLPI"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="http://passbolt.billu.com/">
            <a href="http://passbolt.billu.com/" target="_blank"><img class="icon" src="https://static.cdnlogo.com/logos/p/97/passbolt.svg" alt="Passbolt"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="http://graylog.billu.com:9000/">
            <a href="http://graylog.billu.com:9000/" target="_blank"><img class="icon" src="https://static.cdnlogo.com/logos/g/32/graylog.svg" alt="Graylog"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="http://freepbx.billu.com/">
            <a href="http://freepbx.billu.com/" target="_blank"><img class="icon" src="https://cp.beget.com/shared/xisQQW8k-g5QWd77x9XCtcysQ5hIWg3I/logo_freepbx2x.png" alt="FreePBX"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="https://mail.billu.com/mail/">
            <a href="https://mail.billu.com/mail/" target="_blank"><img class="icon" src="https://www.iredmail.org/images/logo.png" alt="iRedMail"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="http://zabbix.billu.com:8080/">
            <a href="http://zabbix.billu.com:8080/" target="_blank"><img class="icon" src="https://ssd-disclosure.com/wp-content/uploads/2022/11/1_vloEha9mTCLM_SEnXdIUIw-300x300.png" alt="Zabbix"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="http://bastion.billu.com:8080/guacamole/#/">
            <a href="http://bastion.billu.com:8080/guacamole/#/" target="_blank"><img class="icon" src="https://d7umqicpi7263.cloudfront.net/img/product/030b6dbb-cd7b-486d-af34-99d4924864a1.com/6fb7788920aacfd15ab8e000e0f750a3" alt="Guacamole Bastion"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra">
            <a href="https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra" target="_blank"><img class="icon" src="https://static.cdnlogo.com/logos/g/69/github-icon.svg" alt="GitHub"></a>
            <div class="status-dot"></div>
            </div>
            <div class="icon-wrapper" data-service="https://www.mailo.com/">
            <a href="https://www.mailo.com/" target="_blank"><img class="icon" src="./pictures/Mailo_logo.png" alt="Mailo"></a>
            <div class="status-dot"></div>
            </div>
        </div>

        <!-- Back Button Section -->
        <div class="button-section">
            <button class="back-button" onclick="window.location.href='index.html';">Retour au menu</button>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <p>&copy; 2025 BillU | Tous droits réservés</p>
    </div>

    <script>
        // Fonction pour vérifier l'état d'un service
        async function checkServiceStatus(url) {
            try {
                const response = await fetch(url, { method: 'HEAD', mode: 'no-cors' });
                return response.ok || response.type === 'opaque'; // 'opaque' pour les requêtes no-cors réussies
            } catch (error) {
                return false; // En cas d'erreur, le service est considéré comme indisponible
            }
        }

        // Fonction pour mettre à jour toutes les pastilles
        async function updateStatusDots() {
            const iconWrappers = document.querySelectorAll('.icon-wrapper');
            iconWrappers.forEach(async (wrapper) => {
                const serviceUrl = wrapper.getAttribute('data-service');
                const statusDot = wrapper.querySelector('.status-dot');
                const isServiceUp = await checkServiceStatus(serviceUrl);
                statusDot.classList.toggle('green', isServiceUp);
                statusDot.classList.toggle('red', !isServiceUp);
            });
        }

        // Mettre à jour les pastilles toutes les secondes
        setInterval(updateStatusDots, 1000);

        // Mettre à jour les pastilles immédiatement au chargement de la page
        updateStatusDots();
    </script>

</body>
</html>
```
---

- **Redémarrer Apache** :

``systemctl restart apache2``

## **Le serveur web est maintenant fonctionnel, sécurisé et accessible depuis l’extérieur grâce à un reverse proxy**. 🎉

![WEB1](https://github.com/user-attachments/assets/db406db2-6b30-493b-bc24-23189096cc4d)<br>

![WEB2](https://github.com/user-attachments/assets/3204d37a-6d85-4d56-981a-11aff3b07fad)


</details>

---

<details>
<summary><h1>🎯 Mise en place d'un serveur RDP</h1></summary>  
  
- **Activation de la connexion à distance**. 

![Capture d'écran 2025-01-30 150308](https://github.com/user-attachments/assets/3a4f7f2b-039f-478d-9376-db26d1638896)  

![Capture d'écran 2025-01-30 150334](https://github.com/user-attachments/assets/8f2dd4e6-d2cd-4934-9e67-1183d3e6d01d)  

![Capture d'écran 2025-01-30 150356](https://github.com/user-attachments/assets/0410647c-16ad-4d2f-bdaa-462ff7ed1110)  

![Capture d'écran 2025-01-30 150635](https://github.com/user-attachments/assets/1c7a660b-5d3a-4a92-9a03-01ccaef6966e)  

- **Il suffit de taper `mstsc` dans la zone de recherche pour lancer la fenêtre de configuration**.  

![Capture d'écran 2025-01-30 150718](https://github.com/user-attachments/assets/87eec76f-669b-4ca2-99d0-f8cb716d40e2)  

</details>  

---

<details>
<summary><h1>🎯 Installation et configuration d'un serveur bastion GUACAMOLE<h1></summary>

# 📑 Installation d'Apache Guacamole sur Debian 12

## 📑 A. Installer les prérequis d'Apache Guacamole

- **Avant de commencer, mettez à jour la liste des paquets** :

```
apt-get update
```

- **Installez ensuite les dépendances nécessaires** :

```bash
apt-get install build-essential libcairo2-dev libjpeg62-turbo-dev libpng-dev libtool-bin uuid-dev libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev
```

---

### 📑 B. Compiler et installer Apache Guacamole "Server"

- **Téléchargez et extrayez les sources** :

```
cd /tmp
wget https://downloads.apache.org/guacamole/1.5.5/source/guacamole-server-1.5.5.tar.gz
tar -xzf guacamole-server-1.5.5.tar.gz
cd guacamole-server-1.5.5/
```

- **Préparez la compilation** :

```
./configure --with-systemd-dir=/etc/systemd/system/
```

- **En cas d'erreur liée à ``guacenc_video_alloc``** :

```
./configure --with-systemd-dir=/etc/systemd/system/ --disable-guacenc
```

- **Compilez et installez** :

```
make
make install
```

- **Mettez à jour les liens dynamiques et démarrez `guacd`** :

```
ldconfig
systemctl daemon-reload
systemctl enable --now guacd
systemctl status guacd
```

---

### 📑 C. Créer le répertoire de configuration

```
sudo mkdir -p /etc/guacamole/{extensions,lib}
```

---

### 📑 D. Installer Guacamole Client (Web App)

- **Ajoutez le dépôt de Debian 11 pour installer Tomcat 9** :

```
nano /etc/apt/sources.list.d/bullseye.list
```

- **Ajoutez cette ligne** :

```
deb http://deb.debian.org/debian/ bullseye main
```

- **Mettez à jour et installez Tomcat 9** :

```
apt-get update
apt-get install tomcat9 tomcat9-admin tomcat9-common tomcat9-user
```

- **Téléchargez et installez Guacamole Client** :

```
cd /tmp
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-1.5.5.war
mv guacamole-1.5.5.war /var/lib/tomcat9/webapps/guacamole.war
```

- **Redémarrez les services** :

```
systemctl restart tomcat9 guacd
```

---

### 📑 E. Base de données MariaDB pour l'authentification

- **Installez MariaDB** :

```
apt-get install mariadb-server
```

- **Sécurisez l'installation** :

```
mysql_secure_installation
```

- **Créez la base de données et un utilisateur** :

```
CREATE DATABASE guacadb;
CREATE USER 'guaca_billu'@'localhost' IDENTIFIED BY 'Azerty1*';
GRANT SELECT,INSERT,UPDATE,DELETE ON guacadb.* TO 'guaca_billu'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

- **Téléchargez et installez l'extension JDBC** :

```
cd /tmp
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-auth-jdbc-1.5.5.tar.gz
tar -xzf guacamole-auth-jdbc-1.5.5.tar.gz
mv guacamole-auth-jdbc-1.5.5/mysql/guacamole-auth-jdbc-mysql-1.5.5.jar /etc/guacamole/extensions/
```

- **Téléchargez et installez le connecteur MySQL** :

```
cd /tmp
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-9.1.0.tar.gz
tar -xzf mysql-connector-j-9.1.0.tar.gz
cp mysql-connector-j-9.1.0/mysql-connector-j-9.1.0.jar /etc/guacamole/lib/
```

- **Importez la structure de la base de données** :

```
cd guacamole-auth-jdbc-1.5.5/mysql/schema/
cat *.sql | mysql -u root -p guacadb
```

- **Configurez `guacamole.properties`** :

```
nano /etc/guacamole/guacamole.properties
```

- **Ajoutez ceci** :

```
mysql-hostname: 127.0.0.1
mysql-port: 3306
mysql-database: guacadb
mysql-username: guaca_billu
mysql-password: Azerty1*
```

- **Configurez `guacd.conf`** :

```
nano /etc/guacamole/guacd.conf
```

- **Ajoutez ceci** :

```
[server]
bind_host = 0.0.0.0
bind_port = 4822
```

- **Redémarrez les services** :

```
systemctl restart tomcat9 guacd mariadb
```

---

## 📑 IV. Premiers pas avec Apache Guacamole

- **Accédez à l'interface** :

```
http://<Adresse IP>:8080/guacamole/
```

- **Utilisez les identifiants par défaut** :

- **Utilisateur** : guacadmin
- **Mot de passe** : guacadmin

![BASTION](https://github.com/user-attachments/assets/bbc94cdf-1061-468d-b1a1-a73a12f4bbdc)

---

### 📑 A. Créer un nouveau compte admin

**1. Accédez aux paramètres > Utilisateurs > Nouvel utilisateur**.<br>
**2. Créez un nouvel administrateur avec un mot de passe sécurisé**.<br>
**3. Supprimez ou désactivez `guacadmin`**.

![BASTION2](https://github.com/user-attachments/assets/14d9c876-2f39-48d1-80b0-c164ebefce64)

![BASTION3](https://github.com/user-attachments/assets/6544612e-0806-452a-91cb-6aa47f69936d)

![BASTION1](https://github.com/user-attachments/assets/8fb58477-3873-4446-95dd-ff8d72f4a4a8)

---

### 📑 B. Ajouter une connexion RDP

**1. Créez un groupe de connexions : **Paramètres > Connexion > Nouveau groupe****.<br>
**2. Ajoutez une nouvelle connexion RDP avec l'IP et les identifiants**.<br>
**3. Activez `Ignorer le certificat du serveur` si nécessaire**.

![BASTION4](https://github.com/user-attachments/assets/8c18369d-ac8b-4a53-933b-3cb0986affa3)

![BASTION5](https://github.com/user-attachments/assets/28d1679b-cd06-4ecd-90b0-94444c02eac1)

![BASTION6](https://github.com/user-attachments/assets/35b46dd4-0b5c-4f83-a4ae-2a28f2a75ba4)

![BASTION7](https://github.com/user-attachments/assets/30d8825e-d0f6-4e13-915f-ab1b0325e873)

![BASTION8](https://github.com/user-attachments/assets/2ed31fd0-bf4e-48ca-8b97-6277d64538b8)

![BASTION9](https://github.com/user-attachments/assets/03eb45d0-cf46-4dec-a7dc-97b2da5e4443)

---

## 📑 C. Apache Guacamole : erreur de connexion en RDP

- **Que faire si la connexion RDP ne se lance pas ou qu'elle affiche une erreur ?**

- **Retournez sur la ligne de commande de votre serveur et vérifiez les dernières lignes de logs qui s'affichent lorsque l'on regarde le statut du service ``guacd``** :

```
systemctl status guacd
```

- **Par exemple, on peut trouver ceci** :

```
juin 14 20:15:29 srv-guacamole guacd[31120]: Certificate validation failed
juin 14 20:15:29 srv-guacamole guacd[31120]: RDP server closed/refused connection: SSL/TLS connection failed (untrusted/self-signed certificate?)
```

- **Si le certificat RDP ne peut pas être vérifié (auto-signé par exemple) et que l'option ``Ignorer le certificat du serveur`` n'est pas cochée dans les paramètres de la connexion Guacamole, alors cette erreur se produira.**

- **Une autre erreur que vous pourriez rencontrer si vous avez besoin d'établir des connexions en RDP, c'est celle-ci** :

```
RDP server closed/refused connection: Security negotiation failed (wrong security type?)
```

- **Ce problème est lié au compte utilisateur ``daemon`` utilisé par défaut pour exécuter le service ``guacd``. Vous pouvez le vérifier avec cette commande** :

```
ps aux | grep -v grep | grep guacd
```

- **Résultat** :

```
daemon     31513  0.0  0.7 247928 15400 ?        Ss   16:03   0:00 /usr/local/sbin/guacd -f
```

- **Nous devons créer un nouvel utilisateur, lui associer les permissions nécessaires sur les données d'Apache Guacamole, puis mettre à jour le service et enfin le relancer**.

- **Voici la série de commandes à exécuter, dans l'ordre** :

```
useradd -M -d /var/lib/guacd/ -r -s /sbin/nologin -c "Guacd User" guacd
mkdir /var/lib/guacd
chown -R guacd: /var/lib/guacd
sed -i 's/daemon/guacd/' /etc/systemd/system/guacd.service
systemctl daemon-reload
systemctl restart guacd
```

- **Puis, vérifiez l'état du service** :

```
systemctl status guacd
```

*Si c'est bon, vous pouvez tenter une nouvelle connexion RDP*.

</details>
