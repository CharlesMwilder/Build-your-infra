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
    <title>BILLU - Accueil</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap');
        
        body {
            font-family: 'Orbitron', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f5f5, #dcdcdc); /* Dégradé de fond */
            color: black;
            overflow-x: hidden;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        /* Animation des particules */
        @keyframes moveParticles {
            0% {
                transform: translate(0, 0) scale(0.8);
                opacity: 0.5;
            }
            50% {
                transform: translate(100px, 100px) scale(1);
                opacity: 0.7;
            }
            100% {
                transform: translate(-100px, -100px) scale(0.8);
                opacity: 0.5;
            }
        }

        /* Particules en fond */
        .particle {
            position: absolute;
            border-radius: 50%;
            background-color: rgba(60, 60, 60, 0.6); /* Gris foncé */
            animation: moveParticles 5s infinite ease-in-out;
            opacity: 0.6;
        }

        /* Configuration de la taille et de la durée des particules */
        .particle:nth-child(odd) {
            width: 8px;
            height: 8px;
            animation-duration: 6s;
        }

        .particle:nth-child(even) {
            width: 12px;
            height: 12px;
            animation-duration: 5s;
        }

        /* Diffusion des particules sur toute la page */
        .particle:nth-child(1) { top: 5%; left: 15%; animation-delay: 0s; }
        .particle:nth-child(2) { top: 10%; left: 70%; animation-delay: 0.5s; }
        .particle:nth-child(3) { top: 30%; left: 50%; animation-delay: 1.5s; }
        .particle:nth-child(4) { top: 20%; left: 80%; animation-delay: 2s; }
        .particle:nth-child(5) { top: 45%; left: 20%; animation-delay: 0.3s; }
        .particle:nth-child(6) { top: 65%; left: 90%; animation-delay: 1s; }
        .particle:nth-child(7) { top: 50%; left: 10%; animation-delay: 1.7s; }
        .particle:nth-child(8) { top: 40%; left: 60%; animation-delay: 0.9s; }
        .particle:nth-child(9) { top: 60%; left: 35%; animation-delay: 2.2s; }
        .particle:nth-child(10) { top: 80%; left: 5%; animation-delay: 1.4s; }
        .particle:nth-child(11) { top: 90%; left: 55%; animation-delay: 1.8s; }
        .particle:nth-child(12) { top: 75%; left: 85%; animation-delay: 0.6s; }
        .particle:nth-child(13) { top: 10%; left: 90%; animation-delay: 1.1s; }
        .particle:nth-child(14) { top: 90%; left: 25%; animation-delay: 2.5s; }
        .particle:nth-child(15) { top: 30%; left: 40%; animation-delay: 1.2s; }
        .particle:nth-child(16) { top: 60%; left: 75%; animation-delay: 2.7s; }
        .particle:nth-child(17) { top: 20%; left: 25%; animation-delay: 1.6s; }
        .particle:nth-child(18) { top: 80%; left: 50%; animation-delay: 2s; }

        header, footer {
            text-align: center;
            font-size: 1em;
            padding: 8px;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            color: white;
            width: 100%;
        }

        nav {
            display: flex;
            justify-content: center;
            gap: 15px;
            padding: 15px 0; /* Augmente la marge pour descendre le menu */
            margin-top: 10px; /* Ajout pour descendre le menu */
        }

        nav a {
            color: black;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 50px;
            background: rgba(0, 0, 0, 0.2);
            transition: transform 0.15s ease-out, background 0.15s ease-out; /* Transition plus rapide */
            font-size: 0.9em;
        }
	
	nav a.active,
        nav a:hover {
            transform: scale(1.1);
            background: rgba(0, 0, 0, 0.4);
            color: white;
        }

        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex: 1;
            width: 100%;
            margin-top: -30px;
        }

        /* Animation de rebond pour le texte "BILLU" */
        @keyframes bounceBillu {
            0% {
                transform: translateY(0) scale(1);
            }
            30% {
                transform: translateY(-20px) scale(1.1); /* Monte un peu et grossit */
            }
            50% {
                transform: translateY(0) scale(1); /* Redescend et revient à sa taille */
            }
            70% {
                transform: translateY(-10px) scale(1.05); /* Un petit rebond */
            }
            100% {
                transform: translateY(0) scale(1); /* Retour à la position d'origine */
            }
        }

        .big-billu {
            font-size: 10em;
            font-weight: 700;
            color: black;
            text-align: center;
            margin: 50px 0;
            animation: bounceBillu 3s ease infinite; /* Applique l'animation de rebond */
           margin-top: -50px;
        }

        .search-container {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .search-box {
            width: 200px;
            padding: 6px;
            border-radius: 20px;
            border: none;
            outline: none;
            font-size: 0.85em;
            transition: width 0.3s;
        }

        .search-box:focus {
            width: 250px;
        }

        .search-btn {
            position: absolute;
            right: 10px;
            background: none;
            border: none;
            cursor: pointer;
            color: black;
            font-size: 1em;
        }
    </style>
</head>
<body>
    <!-- Création des particules -->
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>

    <header>
        BILLU
    </header>
    <nav>
        <a href="index.html" class="active">Accueil</a>
        <a href="services.html">Services</a>
        <a href="plan.html">Plan</a>
        <a href="github.html">GitHub</a>
        <a href="apropos.html">À propos</a>
        <a href="http://web.billu.com:5000">Assistance</a>
    </nav>
    <div class="center-content">
        <!-- Remplacement du conteneur "Bienvenue chez BILLU" -->
        <h1 class="big-billu">BILLU</h1>
        <div class="search-container">
            <input type="text" class="search-box" placeholder="Rechercher sur Google...">
            <button class="search-btn" onclick="searchGoogle()">🔍</button>
        </div>
    </div>
    <footer>
        &copy; 2025 BILLU - Tous droits réservés
    </footer>
    <script>
        function searchGoogle() {
            let query = document.querySelector('.search-box').value;
            if (query) {
                window.location.href = `https://www.google.fr/search?q=${encodeURIComponent(query)}`;
                document.querySelector('.search-box').value = ''; // Vider la barre de recherche après avoir lancé la recherche
            }
        }

        // Permet de lancer la recherche en appuyant sur la touche 'Entrée'
        document.querySelector('.search-box').addEventListener('keydown', function(event) {
            if (event.key === 'Enter') {
                searchGoogle();
	}

	 document.addEventListener("DOMContentLoaded", function () {
                let currentPage = window.location.pathname.split("/").pop();
                let links = document.querySelectorAll("nav a");

                links.forEach(link => {
                        let linkPage = link.getAttribute("href");
                        if (linkPage === currentPage) {
                                link.classList.add("active");
                        }
                });
        });



    </script>
</body>
</html>
```
---

- **Ajouter un fichier ``services.html`` dans le dossier ``/var/www/html/``** (exemple ci-dessous) :

---

```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BILLU - Services</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap');
        
        body {
            font-family: 'Orbitron', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f5f5, #dcdcdc); /* Dégradé de fond */
            color: black;
            overflow-x: hidden;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        header, footer {
            text-align: center;
            font-size: 1em;
            padding: 8px;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            color: white;
            width: 100%;
        }

        nav {
            display: flex;
            justify-content: center;
            gap: 15px;
            padding: 15px 0; /* Augmente la marge pour descendre le menu */
            margin-top: 10px; /* Ajout pour descendre le menu */
        }

	nav a.active,
        nav a:hover {
            transform: scale(1.1);
            background: rgba(0, 0, 0, 0.4);
            color: white;
}

        nav a {
            color: black;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 50px;
            background: rgba(0, 0, 0, 0.2);
            transition: transform 0.15s ease-out, background 0.15s ease-out; /* Transition plus rapide */
            font-size: 0.9em;
        }

        nav a:hover {
            transform: scale(1.1);
            background: rgba(0, 0, 0, 0.4);
            color: white;
        }

        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex: 1;
            width: 100%;
            margin-top: -30px;
        }

        .services-container {
            display: flex;
            flex-direction: column; /* Aligne les lignes de cartes verticalement */
            gap: 50px;
            margin-top: 20px;
            width: 100%; /* Assurez-vous que la largeur est 100% pour bien occuper l'espace */
        }

        .row {
            display: flex;
            justify-content: center; /* Espace entre les cartes */
            gap: 50px; /* Espacement entre les cartes */
            width: 80%; /* Limiter la largeur de la ligne de cartes */
            margin: 0 auto; /* Centrer la ligne de cartes */
        }

        .icon-wrapper {
            text-align: center;
            width: 200px; /* Largeur fixe */
            height: 150px; /* Hauteur fixe */
            padding: 10px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            position: relative;
            transition: transform 0.2s ease-in-out;
            display: flex;
            flex-direction: column;
            justify-content: center; /* Centre le contenu verticalement */
            align-items: center; /* Centre le contenu horizontalement */
        }

        .icon-wrapper:hover {
            transform: scale(1.05); /* effet au survol */
        }

        .icon-wrapper img {
            width: 60px;
            height: 60px;
            margin-bottom: 10px;
        }

        /* Halo autour de la carte */
        .icon-wrapper.up {
            box-shadow: 0 0 15px 5px green; /* Halo vert pour service en ligne */
        }

        .icon-wrapper.down {
            box-shadow: 0 0 15px 5px red; /* Halo rouge pour service hors ligne */
        }

        .status-text {
            font-size: 0.8em;
            color: #333;
        }

        .status-text.up {
            color: green;
            font-weight: bold;
        }

        .status-text.down {
            color: red;
            font-weight: bold;
        }

        .timestamp {
            font-size: 0.7em;
            color: #888;
        }

        /* Styles pour les particules */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none; /* Empêche d'interagir avec les particules */
            overflow: hidden;
        }

        .particle {
            position: absolute;
            border-radius: 50%;
            background-color: rgba(60, 60, 60, 0.6); /* Couleur jaune plus voyante */
            opacity: 0.6; /* Particules opaques */
            animation: particle-animation 2s infinite; /* Animation plus rapide */
        }

        @keyframes particle-animation {
            0% {
                transform: scale(0) translateX(0) translateY(0);
                opacity: 1;
            }
            100% {
                transform: scale(1) translateX(var(--x)) translateY(var(--y));
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <header>
        BILLU
    </header>
    <nav>
        <a href="index.html">Accueil</a>
        <a href="services.html">Services</a>
        <a href="plan.html">Plan</a>
        <a href="github.html">GitHub</a>
        <a href="apropos.html">À propos</a>
        <a href="http://web.billu.com:5000">Assistance</a>
    </nav>

    <div class="center-content">
        <div class="services-container" id="services-container">
            <!-- 5 cartes du haut -->
            <div class="row" id="top-row">
                <!-- Les services seront ajoutés ici par JavaScript -->
            </div>
            <!-- 5 cartes du bas -->
            <div class="row" id="bottom-row">
                <!-- Les services seront ajoutés ici par JavaScript -->
            </div>
        </div>
    </div>

    <footer>
        &copy; 2025 BILLU - Tous droits réservés
    </footer>

    <div class="particles" id="particles"></div>

    <script>
        const services = [
            { name: 'pfSense', url: 'http://192.168.10.254/', img: 'https://wpcomputersolutions.com/wp-content/uploads/2018/07/pfsense-logo-e1534531558807.png' },
            { name: 'GLPI', url: 'http://glpi.billu.com/glpi/', img: 'https://glpi-project.org/wp-content/uploads/2021/06/logo-glpi-bleu-1.png' },
            { name: 'Passbolt', url: 'http://passbolt.billu.com/', img: 'https://static.cdnlogo.com/logos/p/97/passbolt.svg' },
            { name: 'Graylog', url: 'http://graylog.billu.com:9000/', img: 'https://static.cdnlogo.com/logos/g/32/graylog.svg' },
            { name: 'FreePBX', url: 'http://freepbx.billu.com/', img: 'https://cp.beget.com/shared/xisQQW8k-g5QWd77x9XCtcysQ5hIWg3I/logo_freepbx2x.png' },
            { name: 'iRedMail', url: 'https://mail.billu.com/mail/', img: 'https://www.iredmail.org/images/logo.png' },
            { name: 'Zabbix', url: 'http://zabbix.billu.com:8080/', img: 'https://ssd-disclosure.com/wp-content/uploads/2022/11/1_vloEha9mTCLM_SEnXdIUIw-300x300.png' },
            { name: 'Guacamole', url: 'http://bastion.billu.com:8080/guacamole/#/', img: 'https://d7umqicpi7263.cloudfront.net/img/product/030b6dbb-cd7b-486d-af34-99d4924864a1.com/6fb7788920aacfd15ab8e000e0f750a3' },
            { name: 'GitHub', url: 'https://github.com/WildCodeSchool/TSSR-2409-VERT-P3-G1-build-your-infra', img: 'https://static.cdnlogo.com/logos/g/69/github-icon.svg' },
            { name: 'Mailo', url: 'https://www.mailo.com/', img: './pictures/Mailo_logo.png' }
        ];

        function createServiceCard(service) {
            return `
                <div class="icon-wrapper" data-service="${service.url}">
                    <a href="${service.url}" target="_blank">
                        <img class="icon" src="${service.img}" alt="${service.name}">
                    </a>
                    <div class="service-name">${service.name}</div>
                    <div class="status-text">Vérification en cours...</div>
                    <div class="timestamp"></div>
                </div>
            `;
        }

        async function checkServiceStatus(url) {
            const controller = new AbortController();
            const timeoutId = setTimeout(() => controller.abort(), 5000); // timeout 5 sec

            try {
                const response = await fetch(url, {
                    method: 'HEAD',
                    mode: 'no-cors',
                    signal: controller.signal
                });
                clearTimeout(timeoutId);
                return response.ok || response.type === 'opaque';  // 'opaque' is needed for CORS requests
            } catch (error) {
                clearTimeout(timeoutId);
                if (error.name === 'AbortError') {
                    console.log(`Timeout for ${url}`);
                }
                return false;  // Si une erreur ou timeout, le service est hors ligne
            }
        }

        async function updateServiceStatus() {
            const timestamp = new Date().toLocaleString();
            for (let i = 0; i < services.length; i++) {
                const service = services[i];
                const status = await checkServiceStatus(service.url);
                const statusElement = document.querySelectorAll('.icon-wrapper')[i];
                const statusTextElement = statusElement.querySelector('.status-text');
                const timestampElement = statusElement.querySelector('.timestamp');

                // Met à jour l'état de la carte
                if (status) {
                    statusElement.classList.add('up');
                    statusElement.classList.remove('down');
                    statusTextElement.classList.add('up');
                    statusTextElement.classList.remove('down');
                    statusTextElement.textContent = 'ON';
                } else {
                    statusElement.classList.add('down');
                    statusElement.classList.remove('up');
                    statusTextElement.classList.add('down');
                    statusTextElement.classList.remove('up');
                    statusTextElement.textContent = 'OFF';
                }

                // Affiche la date et l'heure de la vérification
                timestampElement.textContent = `${timestamp}`;
            }
        }

        function displayServices() {
            const topRow = document.getElementById("top-row");
            const bottomRow = document.getElementById("bottom-row");

            for (let i = 0; i < 5; i++) {
                topRow.innerHTML += createServiceCard(services[i]);
            }
            for (let i = 5; i < 10; i++) {
                bottomRow.innerHTML += createServiceCard(services[i]);
            }
        }

        displayServices();
        updateServiceStatus();  // Vérification initiale
        setInterval(updateServiceStatus, 5000);  // Vérification toutes les 5 secondes

        // Ajout des particules
        function createParticle() {
            const particle = document.createElement('div');
            particle.classList.add('particle');
            const size = Math.random() * 10 + 5;  // Taille plus petite
            particle.style.width = size + 'px';
            particle.style.height = size + 'px';
            particle.style.left = Math.random() * window.innerWidth + 'px';
            particle.style.top = Math.random() * window.innerHeight + 'px';
            particle.style.setProperty('--x', (Math.random() - 0.5) * 300 + 'px');  // Mouvement plus grand
            particle.style.setProperty('--y', (Math.random() - 0.5) * 300 + 'px');
            document.getElementById('particles').appendChild(particle);

            setTimeout(() => {
                particle.remove();
            }, 3000); // La particule disparaît après 3 secondes
        }

        setInterval(createParticle, 100); // Crée des particules toutes les 100ms
 
	document.addEventListener("DOMContentLoaded", function () {
                let currentPage = window.location.pathname.split("/").pop();
                let links = document.querySelectorAll("nav a");

                links.forEach(link => {
                        let linkPage = link.getAttribute("href");
                        if (linkPage === currentPage) {
                                link.classList.add("active");
                        }
                });
        });

   </script>
</body>
</html>
```
---

- **Redémarrer Apache** :

``systemctl restart apache2``

## **Le serveur web est maintenant fonctionnel, sécurisé et accessible depuis l’extérieur grâce à un reverse proxy**. 🎉

![WEB1](https://github.com/user-attachments/assets/16b331db-386c-4a77-9d7e-4037b01e3ddd)<br>


![WEB2](https://github.com/user-attachments/assets/415630c3-2358-4b9f-b4d6-89404a2a639d)


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
