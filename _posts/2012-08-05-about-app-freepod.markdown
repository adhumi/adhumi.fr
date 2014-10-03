---
layout: post
title:  "A propos des applications Freepod"
date:   2012-08-05 16:57:51
---

_**Edit du 22/05/2014 :** L'application coté serveur n'étant plus en ligne et suite à l'arrêt de Freepod, j'ai pris la décision de supprimer l'application de l'AppStore._

Quelques mots à propos des apps Freepod, sorties depuis déjà un mois. Sur le bilan de cette sortie, sur <i>"comment on a fait le bébé"</i> et sur les évolutions futures de l’application.


# 2500 applications Freepod dans la nature

En additionnant les scores de l’App Store et du Marketplace, on arrive à un score d’environ 2500 applications téléchargées depuis la sortie officielle le 4 juillet. Si la plupart ont été téléchargées les premier jours sur iOS, l’appli Windows Phone a sans doute bénéficié de sa présence dans le haut des classement puisque les plus gros scores de téléchargements ont eu lieu plus tard.

Pas mal de flyers ont été distribués pendant Comic Con pour faire la promo des applications. Il en reste encore quelques centaines/milliers à distribuer (si vous en voulez pour aider à la com, n’hésitez pas à demander !).

Merci également à tous pour vos retours et votre soutien. Les commentaires sur l’App Store et le Marketplace font souvent chaud au coeur, même si on sent bien qu’on vous a forcé la main. Pas non plus le temps de répondre à tous les mails qui nous parviennent via le formulaire sur apps.freepod.net.

Bref, on tire un plutôt bon bilan de ce lancement, même si il faudrait relancer un peu la communication pour que tout le monde soit au courant !


# Comment on a fait le bébé ?

Pas mal de choses ont déjà été dite pendant le lancement officiel des applications dans l’<a href="http://www.captainweb.net/2012/07/29/le-concert-des-singes-cultivateurs-de-canabis/" rel="external">ADC #124</a>, mais revenons-y un peu. Pour Michel comme pour moi, le dev pour mobile était quelque chose de nouveau. On a donc pas mal tâtonné avant d’arriver au résultat final.

Depuis sa création en octobre 2011, Freepod souhaitait se doter d’applications mobiles pour faciliter la consommation des podcasts en mobilité. Le pas a été franchi ce printemps dans le cadre d’un projet universitaire : Michel a développé l’application Windows Phone 7, j’ai développé le web-service et l’application iPhone.

Le web-service est la clé de voute de tout ça. Il est associé à une petite interface d’administration qui permet d’ajouter simplement de nouveaux podcasts, de modifier quelques paramètres et d’afficher des statistiques d’utilisation (à terme, il devrait permettre aussi d’autres choses, en lien avec les nouvelles fonctionnalités proposées dans les applis).
Il traite donc les flux RSS des podcasts (avec toutes leurs incohérences), insère ça dans une jolie base de données MySQL et propose à qui veut de récupérer une liste de podcasts ou d’épisodes au format JSON.

L’application (que ce soit la version iOS ou la version WP7, puisqu’elles n’ont pas les mêmes fonctionnalités) ne fait que s’interfacer sur ce service. Elle récupère la liste des podcasts, puis des épisodes pour un podcast et affiche ces informations à l’écran (oui, comme ça, ça a l’air facile).

Notre système de live audio est hébergé par Infomaniak et nous permet pour une somme modique d’obtenir un flux suivable par 200 personnes simultanément, soit plus que ce qui est aujourd’hui nécéssaire !


# Et maintenant ?

On a déjà annoncé pas mal de choses au niveau des évolutions futures des applis. La première chose à dire aujourd’hui, c’est que <a href="http://twitter.com/longhost_" rel="external">Jérémie</a> rejoint l’équipe de dev et va se charger de la version Android. Donc oui, ça devrait arriver un jour ou l’autre !

La priorité numéro 1 pour les apps existantes, c’est d’uniformiser les fonctionnalités : permettre à l’appli iOS de lire des émissions offline, permettre à l’application Windows Phone de suivre les enregistrements en direct. On essaye de faire ça et de balayer quelques bugs pour la rentrée en septembre.

Ensuite viendra le temps d’ajouter autre chose à l’application. Là aussi, plein d’idées : des notifications push à la sortie d’un nouvel épisode ou au démarrage d’un live, l’intégration d’un chat cross-plateforme pour discuter depuis son mobile avec ceux du navigateur pendant les lives et vice-versa, des versions compatibles avec les tablettes...

En bref, les choses partent bien et on a plein de beaux projets pour l’avenir !
