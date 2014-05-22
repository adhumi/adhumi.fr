---
layout: post
title:  "Tweetwall"
date:   2012-02-06 16:57:51
---

<i>TweetWall</i> est un projet réalisé en quelques heures dans le cadre universitaire (Licence DANT @ UPMC). Les contraintes du projet étaient l’emploi de Javascript, d’AJAX, du format JSON et des Cookies, sans utilisation de jQuery.

Il s’agit d’une application simple qui permet de rechercher les personnes ayant tweeté sur un sujet. Elle affiche le résultat sous la forme d’un damier d’avatars et stocke l’historique de recherche de l’utilisateur dans un cookie. Twitter n’autorisant pas les requêtes Cross-Domain en AJAX, je suis passé par un micro "web-service" en php pour récupérer le résultat de la requête en JSON.

Le modeste résultat de la chose est disponible sur <a href="http://www.adhumi.fr/tw" rel="external">adhumi.fr/tw</a> (cliquez sur l’image) et le code source est en libre accès sur <a href="https://github.com/adhumi/TweetWall" rel="external">Github</a>.

<strong>Edit : </strong><i>J’ai ajouté quelques fonctionnalités et corrigé pas mal de bugs depuis la version originale. On peut maintenant aller chercher facilement les Trending Topics, et je pense ajouter rapidement le support d’autres langues. Je ferai part des avancées ici !</i>
