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

- Je vous laisse maintenant avec mon frêre d'arme Charles pour vous présentez la suite.

---


# 🚨🚨🚨🚨🚨 CHARLES 🚨🚨🚨🚨🚨 

# 📑 Présentation rapide des services :

*A toi de joué Charles !*

- Notre mission était de concevoir une infrastructure réseau complète, incluant l’installation et la configuration des routeurs, des commutateurs et du DHCP pour chaque département. Nous devions également fournir un plan synoptique détaillé du réseau. Par ailleurs, nous avons renforcé la sécurité et optimisé la gestion des données grâce à des services dédiés. Pour structurer notre travail, nous avons adopté la méthode Scrum et utilisé GitHub afin de documenter chaque étape d’installation et de configuration.

# 📑 Nos réalisation :

- Nous avons donc mis en place plusieurs serveurs ainsi que plusieurs services. Je vous laisse voir cela de plus près juste après.
  
---

 # 🚨🚨🚨🚨🚨 NICOLAS 🚨🚨🚨🚨🚨

# 📑 Présentation du GitHub depuis site Web  

- Sur notre site Web, on peut également avoir accès au menu principal de notre projet avec les tâches effectuées et documentées [CLIC].  
- Nous avons également un accès à chaque installation documentée de nos serveurs sur notre Github [CLIC].  


# 📑 Présentation du schéma synoptique depuis site Web  

[CLIC] Nous avons également accès à notre schéma synoptique qui permet de présenter de manière claire et concise notre infrastructure.  
Lorsque l'on arrive depuis internet, nous avons un routeur avec un firewall PfSense qui permet de filter le trafic entrant et sortant.  

Nous avons un réseau LAN dédié pour administrer le firewall.  

Un réseau initial large, nous a été fourni en 172.18.0.0/16 et a été découpé en VLANs pour implémenter de la sécurité et de la QoS.  

- Il y a notamment un VLAN pour une DMZ contenant le serveur Web avec des règles de filtrage spécifique.  
- Il y a 1 VLAN par service avec 254 adresses disponibles.  
- Et 1 VLAN dédié pour tous les serveurs Linux comme FreePBX ou IredMail, mais également des serveurs Windows avec plusieurs contrôleurs de domaine Active Directory avec une répartition des rôles FSMO, de la redondance, du load balancing, ainsi qu'un Windows Server Core en RODC, pour assurer de la disponibilité au sein de l'infrastructure.  

Je repasse la main à mon frère d'arme Charles.  

---

# 🚨🚨🚨🚨🚨 CHARLES 🚨🚨🚨🚨🚨 

# 📑 Conlusion :
Nous estimons avoir terminé le projet à 80%, ce qui inclut :

✅ La mise en place de l’infrastructure réseau

✅ La configuration et l’intégration des différents composants

✅ Le déploiement et l’utilisation des services essentiels

Mais il reste encore plusieurs ajustements à effectuer, notamment **au niveau de la sécurité et des recommandations**, afin de garantir que l’infrastructure soit totalement **optimisée et sécurisée**.

Ce projet a été **une expérience extrêmement enrichissante**, où nous avons rencontré et surmonté de nombreux défis techniques grâce à **notre travail d’équipe et notre persévérance**.

Nous sommes fiers du chemin parcouru, car nous avons mis en place une base solide et fonctionnelle pour l'infrastructure réseau qui nous avait été confiée..
