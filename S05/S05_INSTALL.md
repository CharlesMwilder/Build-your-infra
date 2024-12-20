
<details>
<summary><h1>🎯 Création d'un dossier partagé<h1></summary>
 
![STORAGE1](https://github.com/user-attachments/assets/a51a5c5a-8ed1-4581-b46a-8298b0f51ba2)<br>

![STORAGE2](https://github.com/user-attachments/assets/fab61929-9bd7-4d28-954f-b0046d4431e3)<br>

![STORAGE3](https://github.com/user-attachments/assets/7436aabb-38db-4d7d-abaf-863f3c6e854e)<br>

![STORAGE4](https://github.com/user-attachments/assets/fd51e5a4-bb35-400d-a870-f68418b24d2f)<br>

![STORAGE5](https://github.com/user-attachments/assets/e72fa7fe-d404-4fbf-8cf4-9dece273e118)<br>

![STORAGE6](https://github.com/user-attachments/assets/5192f7e1-6582-4d41-adf6-607f161a3e20)<br>

![STORAGE7](https://github.com/user-attachments/assets/171fd2e1-6847-469a-b626-fb7254e4a604)<br>

![STORAGE8](https://github.com/user-attachments/assets/53cdd72a-5599-4303-84f6-de45b6f43731)<br>

![STORAGE9](https://github.com/user-attachments/assets/343ff38a-bfc0-4c63-a6ac-061a0ab3b383)<br>

![STORAGE10](https://github.com/user-attachments/assets/814cff46-7fb2-4769-a381-b7b70b4888d8)<br>

![STORAGE11](https://github.com/user-attachments/assets/369d410f-a352-4ee9-b44a-e82d152e2446)



</details>

---


<details>
<summary><h1>🎯 Mise en place de RAID 1 pour les dossiers partagés<h1></summary>

▶️ Nous avons mis en place un RAID 1 sur le dossier partagé global de l'entreprise qui contient tous les fichiers des utilisateurs, de leurs services et de leurs départements.  

🎯 Première étape, créer un nouveau disque d'une taille au moins égale au disque d'origine, sur Proxmox.  

![Capture d'écran 2024-12-19 124151](https://github.com/user-attachments/assets/a82dca85-29b4-4beb-9064-f73ad3a57388)<br>

🎯 Démarrer la machine puis aller dans `Disk Management`, c'est là que se fait le paramétrage. 

![Capture d'écran 2024-12-19 124442](https://github.com/user-attachments/assets/b8c1b47d-fcfc-4170-930b-e577e9c556ab)<br>

🎯 Clique droit sur le disque d'origine, puis ``Convert to Dynamic Disk``. Même opération sur le nouveau disque.  

![Capture d'écran 2024-12-19 124511](https://github.com/user-attachments/assets/738e0517-559c-4a9c-9ef3-2c3716bb9551)<br>

🎯 Une fois les disque dynamiques paramétrées, clique droit sur le disque d'origine et sélectioner `Add Mirror...`.  

![Capture d'écran 2024-12-19 124618](https://github.com/user-attachments/assets/c593b9e9-456d-4564-a039-4dbeecf20daa)<br>

🎯 Choisir le nouveau disque comme mirroir.  

![Capture d'écran 2024-12-19 124627](https://github.com/user-attachments/assets/fba1e53b-8ad7-49a3-a977-31520fe12840)<br>

🎯 La copie est en cours sur le nouveau disque.  

![Capture d'écran 2024-12-19 124647](https://github.com/user-attachments/assets/f20cc8af-fb91-4369-9141-6ea8823d895e)<br>

🎯 La copie est terminée sur le nouveau disque.

![Capture d'écran 2024-12-19 124756](https://github.com/user-attachments/assets/a8d650ff-db97-4fcc-ab2e-dc0d73422165)<br>

🎯 Nous allons tester le fonctionnement du RAID 1. Nous avons débranché l'ancien disque dans Proxmox.  

![Capture d'écran 2024-12-19 124940](https://github.com/user-attachments/assets/1568ad12-5fd9-4650-a4f1-dae5dd1ecabb)<br>

🎯 Après redémarrage, nous avons toujours notre dossier partagé "Share Folder" et son contenu.  

![Capture d'écran 2024-12-19 135133](https://github.com/user-attachments/assets/39cde198-6361-472e-a0fd-686cb6067ef1)<br>

🎯 Rebrancher le disque, démarrer la VM, aller dans `Disk Management`, on voit un message "Failed Redundancy".  

![Capture d'écran 2024-12-19 200600](https://github.com/user-attachments/assets/b208d898-17df-4626-b633-2fcd2f02cc0c)<br>

🎯 Clique droit sur un des disques et `Reactivate Voume`.  

![Capture d'écran 2024-12-19 200705](https://github.com/user-attachments/assets/e0f8a9c0-6a2e-4064-b92a-d1fe08e04d62)<br>

🎯 La synchronisation s'effectue.  

![Capture d'écran 2024-12-19 200756](https://github.com/user-attachments/assets/1a38c352-1a73-4fbb-b237-b7c9ffbe14f2)<br>

🎯 Synchronisation terminée et fonctionnelle.  

![Capture d'écran 2024-12-19 200818](https://github.com/user-attachments/assets/1c959951-36d2-4244-8236-2841eab2392c)


</details>
