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

        header, footer {
            width: 100%;
            background: rgba(10, 10, 10, 0.9);
            padding: 10px 0;
            text-align: center;
            position: absolute;
            left: 0;
        }

        header {
            top: 0;
            font-size: 1.5rem;
            font-weight: bold;
            text-transform: uppercase;
        }

        footer {
            bottom: 0;
            font-size: 0.9rem;
        }

        .hamburger {
            position: fixed;
            top: 15px;
            right: 20px;
            width: 35px;
            height: 30px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            background: transparent;
            border: none;
            cursor: pointer;
            z-index: 1000;
        }

        .hamburger div {
            width: 35px;
            height: 5px;
            background-color: white;
            border-radius: 5px;
            transition: 0.3s;
        }

        .menu {
            position: fixed;
            top: 0;
            right: -250px;
            width: 160px;
            height: 100%;
            background-color: rgba(20, 20, 20, 0.95);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
            transition: right 0.3s ease;
            z-index: 999;
        }

        .menu a {
            color: white;
            text-decoration: none;
            font-size: 1.5rem;
            padding: 15px;
            transition: 0.3s;
        }

        .menu a:hover {
            background-color: #28a745;
            border-radius: 8px;
        }

        .menu.open {
            right: 0;
        }

        .container {
            text-align: center;
            background: rgba(30, 30, 30, 0.8);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.5);
            max-width: 400px;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        p {
            font-size: 1.2rem;
            margin-top: 10px;
        }

        .google-search {
            background-color: rgba(20, 20, 20, 0.8);
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
            background: black;
            color: white;
        }

        .google-search input[type="submit"] {
            padding: 10px 20px;
            font-size: 1rem;
            background-color: #28a745;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            color: white;
            transition: 0.3s;
        }

        .google-search input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <header>BILLU</header>
    
    <button class="hamburger" onclick="toggleMenu()">
        <div></div>
        <div></div>
        <div></div>
    </button>

    <div class="menu" id="menu">
        <a href="next.html">Services</a> 
        <a href="games.html">Games</a>
        <a href="apropos.html">À propos</a>
        <a href="contact.html">Contact</a>
    </div>

    <div class="container">
        <h1>Bienvenue chez BILLU</h1>
        <p>L'avenir de la facturation, simple et efficace.</p>
    </div>

    <div class="google-search">
        <form method="GET" action="http://www.google.be/search">
            <div align="center">
		<a href="http://www.google.fr/">
                    <img src="./pictures/gif_google.gif" border="0" alt="Logo Google" align="absmiddle" width="80">
                </a>
                <input type="text" name="q" size="31" maxlength="255" placeholder="Rechercher sur Google">
                <input type="hidden" name="hl" value="fr">
                <input type="submit" name="btnG" value="Rechercher">
            </div>
        </form>
    </div>

    <footer>&copy; 2025 BILLU. Tous droits réservés.</footer>

    <script>
        function toggleMenu() {
            document.getElementById('menu').classList.toggle('open');
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
    <title>Dashboard BillU</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Exo:wght@300;600&display=swap');
        
        body {
            margin: 0;
            font-family: 'Exo', sans-serif;
            background-color: #1e1e1e;
            color: white;
            text-align: center;
        }

        .header {
            background: #222;
            padding: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        .header h1 {
            margin: 0;
            font-weight: 600;
            color: #ffd700;
        }

        .icon-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 40px auto;
            max-width: 1200px;
        }

        .icon-wrapper {
            background: #2a2a2a;
            border-radius: 10px;
            padding: 20px;
            margin: 15px;
            text-align: center;
            position: relative;
            width: 150px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            cursor: pointer;
        }

        .icon-wrapper:hover {
            transform: scale(1.05);
        }

        .icon {
            width: 60px;
            height: 60px;
        }

        .status-dot {
            position: absolute;
            bottom: 10px;
            left: 10px;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: gray; /* Initial color */
        }

        .status-dot.up {
            background-color: green;
        }

        .status-dot.down {
            background-color: red;
        }

        .service-name {
            font-size: 1rem;
            margin: 10px 0;
            font-weight: bold;
        }

        .status-text {
            font-size: 0.9rem;
            color: #fff;
        }

        .status-text.up {
            color: #28a745;
        }

        .status-text.down {
            color: #dc3545;
        }

        .footer {
            background: #222;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Dashboard BillU</h1>
    </div>

    <div class="icon-container" id="services-container">
        <!-- Les services seront générés dynamiquement ici -->
    </div>

    <div class="footer">
        <p>&copy; 2025 BillU | Tous droits réservés</p>
    </div>

    <script>
        const services = [
            { name: 'pfSense', url: 'http://192.168.10.254/', img: 'https://wpcomputersolutions.com/wp-content/uploads/2018/07/pfsense-logo-e1534531558807.png' },
            { name: 'GLPI', url: 'http://glpi.billu.com/glpi/', img: 'https://glpi-project.org/wp-content/uploads/2021/06/logo-glpi-bleu-1.png' },
            { name: 'Passbolt', url: 'http://passbolt.billu.com/', img: 'https://static.cdnlogo.com/logos/p/97/passbolt.svg' },
            { name: 'Graylog', url: 'http://graylog.billu.com:9000/', img: 'https://static.cdnlogo.com/logos/g/32/graylog.svg' },
            { name: 'FreePBX', url: 'http://freepbx.billu.com/', img: 'https://cp.beget.com/shared/xisQQW8k-g5QWd77x9XCtcysQ5hIWg3I/logo_freepbx2x.png' },
            { name: 'iRedMail', url: 'https://mail.billu.com/mail/', img: 'https://www.iredmail.org/images/logo.png' },
            { name: 'Zabbix', url: 'http://zabbix.billu.com:8080/', img: 'https://ssd-disclosure.com/wp-content/uploads/2022/11/1_vloEha9mTCLM_SEnXdIUIw-300x300.png' },
            { name: 'Guacamole Bastion', url: 'http://bastion.billu.com:8080/guacamole/#/', img: 'https://d7umqicpi7263.cloudfront.net/img/product/030b6dbb-cd7b-486d-af34-99d4924864a1.com/6fb7788920aacfd15ab8e000e0f750a3' },
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
                    <div class="status-dot" id="status-${service.name}"></div>
                    <div id="status-text-${service.name}" class="status-text">Vérification en cours...</div>
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

        async function updateDashboard() {
            const container = document.getElementById('services-container');
            container.innerHTML = '';

            // Créer les cartes de services pour tous les services
            services.forEach(service => {
                container.innerHTML += createServiceCard(service);
            });

            // Vérifier le statut de chaque service
            for (const service of services) {
                try {
                    const status = await checkServiceStatus(service.url);
                    const statusElement = document.getElementById(`status-${service.name}`);
                    const statusTextElement = document.getElementById(`status-text-${service.name}`);

                    if (status) {
                        statusElement.className = 'status-dot up';
                        statusTextElement.className = 'status-text up';
                        statusTextElement.textContent = `En ligne - Dernière vérification à ${new Date().toLocaleTimeString()}`;
                    } else {
                        statusElement.className = 'status-dot down';
                        statusTextElement.className = 'status-text down';
                        statusTextElement.textContent = `Hors ligne - Dernière vérification à ${new Date().toLocaleTimeString()}`;
                    }
                } catch (error) {
                    console.error('Erreur lors de la vérification du service:', service.name, error);
                }
            }
        }

        // Mise à jour du dashboard toutes les 5 secondes
        setInterval(updateDashboard, 5000);
        updateDashboard();  // Lancer immédiatement la mise à jour
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
