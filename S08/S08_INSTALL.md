<details>
<summary><h1>🎯 Mise en place un serveur de gestion des mises à jour WSUS<h1></summary>

## 📑 Voici les étapes : 

![Capture d'écran 2025-01-22 150019](https://github.com/user-attachments/assets/9fce6d9c-9cbe-4ebe-a72e-ca04f4a03020)<br><br>   

![Capture d'écran 2025-01-22 150032](https://github.com/user-attachments/assets/fde0d1a5-bbee-44c1-a340-6e1223b68fe6)<br><br>     

![Capture d'écran 2025-01-22 150041](https://github.com/user-attachments/assets/d287e546-1e60-4fc9-9ca6-b0600efc90ac)<br><br>     

![Capture d'écran 2025-01-22 150055](https://github.com/user-attachments/assets/10451b4f-e2dc-4cc5-9eab-8bd68ed46424)<br><br>    

![Capture d'écran 2025-01-22 150111](https://github.com/user-attachments/assets/e94ddeec-c9b9-48ac-b2da-c4b9edbba468)<br><br>    

![Capture d'écran 2025-01-22 150828](https://github.com/user-attachments/assets/313fbd01-fb1e-4cae-a1bc-b23c85001149)<br><br>    

![Capture d'écran 2025-01-22 150853](https://github.com/user-attachments/assets/4862a6bf-71af-47bd-ad35-fb0c00912ee7)<br><br>     

![Capture d'écran 2025-01-22 150901](https://github.com/user-attachments/assets/6045ca8f-bb81-4e82-920e-2ef7f0ee7025)<br><br>     

![Capture d'écran 2025-01-22 151007](https://github.com/user-attachments/assets/8d260261-8f28-45b1-8462-c0cff5fcea42)<br><br>    

![Capture d'écran 2025-01-22 151026](https://github.com/user-attachments/assets/394e20aa-8098-4c73-9f97-a39070fb34be)<br><br>     

![Capture d'écran 2025-01-22 151052](https://github.com/user-attachments/assets/a1f44a20-f0ab-4ddb-804b-b13ad86a4ab6)<br><br>     

![Capture d'écran 2025-01-22 151221](https://github.com/user-attachments/assets/cbad9fb7-af77-41dd-abc5-d9657482ba9c)<br><br>     


## 📑 *Cette étape est très longue, le serveur se synchronise*


![Capture d'écran 2025-01-22 154151](https://github.com/user-attachments/assets/397d255c-3cdb-485a-86f3-3bf5f2380925)<br><br>    

</details>

<details>
<summary><h1>🎯 VPN Site-to-Site IPsec entre deux Pfsense<h1></summary>  


### 📑 *Suite à un partenariat entre ``BILLU`` et ``SPACE-ZEDE``, il a été décidé d'un commun accord de créer un VPN site-to-site. Nous avons utilisé IPSEC (Internet Protocol Security) sur notre routeur firewall PfSense.*

---

### ▶️ PHASE 1 :

![Capture d'écran 2025-01-22 165317](https://github.com/user-attachments/assets/35a18a7a-d2fe-4a3e-8d4d-942806e216c2)<br><br>     

![Capture d'écran 2025-01-22 165707](https://github.com/user-attachments/assets/d968f45e-99ca-4fab-986f-05cb8e5e7edb)<br><br>     

![Capture d'écran 2025-01-22 170139](https://github.com/user-attachments/assets/83a768cd-41dd-473c-b3c8-6f63e599397d)<br><br>     
  
![Capture d'écran 2025-01-22 170350](https://github.com/user-attachments/assets/e6302ce0-45d6-4d70-a723-3e68de11a2e8)<br><br>     

![Capture d'écran 2025-01-22 170434](https://github.com/user-attachments/assets/139b4f9f-0216-4fee-85cc-991e8fa524a5)<br><br>     

![Capture d'écran 2025-01-22 170631](https://github.com/user-attachments/assets/9bd9b6d0-b992-4df1-b29e-2767db26f11d)<br><br>     

---

### ▶️ PHASE 2 : 
![Capture d'écran 2025-01-22 172146](https://github.com/user-attachments/assets/c2a0f8f1-094c-4ece-9941-4a17acd17337)<br><br>     

![Capture d'écran 2025-01-22 172652](https://github.com/user-attachments/assets/a2e14284-0171-48ad-a80d-f1594ca7984e)<br><br>     

![Capture d'écran 2025-01-22 173231](https://github.com/user-attachments/assets/5fcf2176-df85-4361-8766-f49c9de5faca)<br><br>    

---

### ▶️ PARAMÉTRAGE D'UNE RÈGLE : 

![Capture d'écran 2025-01-22 175211](https://github.com/user-attachments/assets/b6416cac-cb4e-44e5-b04e-891865387fb0)<br><br>   

![Capture d'écran 2025-01-22 175234](https://github.com/user-attachments/assets/878d5698-cc80-48f4-a696-c5aa5f1c916f)<br><br>   

### ▶️ VERIFICATION CONNECTIVITE :  

![Capture d'écran 2025-01-23 083122](https://github.com/user-attachments/assets/8dd10afc-1571-41bd-973d-ef57deaf5c43)

</details>


<details>
<summary><h1>🎯 Distribution des rôles FSMO<h1></summary>  

### **Vérification des rôles sur le serveur principal**  
![Capture d'écran 2025-01-24 101917](https://github.com/user-attachments/assets/a4db6424-558d-43d4-a4b4-627c53b836e1)  
### **Lancement de l'outil de répartition des rôles : ``ntdsutils.exe``**  
![Capture d'écran 2025-01-24 103228](https://github.com/user-attachments/assets/6b715976-a955-4567-9485-b3329e9ba08d)  
### **Activation du mode maintenance pour attribuer les rôles FSMO :**  
![Capture d'écran 2025-01-24 103658](https://github.com/user-attachments/assets/a3c8e94b-a485-4c04-aea5-c44d8385531c)  

![Capture d'écran 2025-01-24 105428](https://github.com/user-attachments/assets/b71b6689-730e-4323-8cdf-363bda191c32)  
![Capture d'écran 2025-01-24 105737](https://github.com/user-attachments/assets/f5284764-c50a-402a-b649-239aae0a9f68)  
![Capture d'écran 2025-01-24 105755](https://github.com/user-attachments/assets/632782e0-0702-4abf-8cc2-e97c34dfcb46)  



</details>




