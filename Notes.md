# 🚨🚨🚨🚨🚨 JULIEN 🚨🚨🚨🚨🚨

# 📑 Intro :

- Bonjour à tous, aujourd'hui, nous, une équipe de 4 techniciens composée de Charles, Nicolas, William et Julien, allons vous présenter l'entreprise BILLU pour laquelle nous avons été mandatés afin de mettre en place une nouvelle infrastructure réseau complète et sécurisée.

---

# 📑 BILLU ??? :

- Qu'est-ce que BILLU ???
  
- BillU c'est une filiale du groupe international RemindMe, qui compte plus de
2000 collaborateurs dans le monde.

- Ils sont spécialisée dans le développement de logiciels, notamment dans le domaine de la facturation.

- Et la société prévoit un budget important pour renforcer son développement.

- L'entreprise emploie actuellement 167 personnes, réparties dans 9 départements, avec des collaborateurs externes qui interviennent ponctuellement ou à temps plein dans certains services.

---

# 📑 Sommaire :

- Nous allons voir 3 points, donc en 1 les objectifs, en 2 nos réalisations et en 3 notre conclusion.

---

# 📑 Les objectifs :

- En tant qu'objectif, nous avons eu la réalisation de l'infrastructure réseau complète à faire, avec l'installation et la configuration des routeurs, des commutateurs et du DHCP pour chaque département. Nous devions aussi fournir un plan synoptique du réseau détaillé. Nous avons également travaillé sur la sécurité et la gestion des données, en améliorant la sécurité du réseau et en utilisant des services de gestion des données. Nous avons adopté la méthode Scrum pour la gestion du projet et avons également utilisé GitHub pour documenter chaque étape d'installation et de configuration du projet.

---

# 📑 Nos réalisation :

- Nous avons donc mis en place plusieurs serveurs ainsi que plusieurs services. Je vous laisse voir cela de plus près juste après.

---

# 🚨🚨🚨🚨🚨 CHARLES 🚨🚨🚨🚨🚨 

# 📑 Présentation rapide des services :

*A toi de joué Charles !*

- **pfSense :** Un pare-feu et routeur open-source pour sécuriser et gérer un réseau.
- **GLPI :** Un outil de gestion de parc informatique et de helpdesk.
- **Passbolt :** Un gestionnaire de mots de passe sécurisé pour les équipes.
- **Graylog :** Un système de gestion et d’analyse des logs centralisés.
- **FreePBX :** Une solution téléphonique open-source basée sur Asterisk.
- **iRedMail :** Un serveur de messagerie complet et open-source.
- **Zabbix :** Un outil de supervision pour surveiller l’état des serveurs et réseaux.
- **Guacamole :** Un accès à distance aux ordinateurs via un navigateur web.
- **GitHub :** Une plateforme pour héberger et gérer du code en collaboration.
- **Mailo :** Un service de messagerie respectueux de la vie privée.

---

# 📑 Réalisation du projet :

- Nous estimons avoir terminé le projet à 80%.

- Ce qui incult :
  
✅ La mise en place de l’infrastructure réseau<br>
✅ La configuration et l’intégration des différents composants<br>
✅ Le déploiement et l’utilisation des services essentiels

- Cependant, il va nous rester encore plusieurs ajustements à effectuer, notamment au niveau de la sécurité et des recommandations, afin de garantir que l'infrastructure réseau soit totalement optimisée et sécurisée.

- Ce projet a été une expérience très enrichissante pour nous tous. Nous avons beaucoup appris. Malgré plusieurs défis techniques rencontrés, notamment sur certains serveurs et services, nous avons su les surmonter grâce à notre travail d’équipe et à notre persévérance.

- Nous sommes fiers du chemin parcouru, car nous avons mis en place une base solide et fonctionnelle pour l'infrastructure réseau qui nous avait été confiée.

  # 🚨🚨🚨🚨🚨 NICOLAS 🚨🚨🚨🚨🚨

# 📑 Présentation du schéma synoptique depuis site Web  

Lorsque l'on veut présenter une Infrastructure de manière claire et concise, il est très important de présenter le schéma synoptique.  
Lorsque l'on arrive depuis internet, nous avons un routeur avec un firewall PfSense qui permet de filter le trafic entrant et sortant.  
Nous avons un réseau LAN en 192.168.10.248/29 pour administrer le firewall.  
Un réseau initial en 172.18.0.0/16 découpé en VLANs 172.18.X.0/24 pour implémenter de la sécurité et de la QoS.  
- 1 VLAN par service  
- 1 VLAN isolé pour la DMZ contenant notre serveur Web  
- 1 VLAN dédié pour tous les serveurs Linux, Windows et nos 2 contrôleurs de domaine Active Directory avec les rôles FSMO répartis ainsi qu'un DC Server Core en RODC pour assurer également la redondance de service au sein du domaine.

# 📑 Présentation du GitHub dpeuis site Web  

Sur le site, on peut également avoir accès au menu principal de notre projet avec les tâches effectuées et documentées, ainsi que chaque installation de serveurs spécifiques sur notre Github.  

