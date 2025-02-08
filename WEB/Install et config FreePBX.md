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
