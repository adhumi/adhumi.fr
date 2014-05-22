---
layout: post
title:  "De l’importance de contrôler le flux RSS de son podcast"
date:   2011-12-19 16:57:51
---

Il serait temps de faire revivre ce lieu...

Il y a quelques temps, j’ai publié ici un billet expliquant comment mettre en place un flux rss "à la main" pour son podcast (<a href="http://blog.adhumi.fr/article/creer-un-flux-rss-de-podcast-a-la">voir ici</a>). Suites aux mésaventures traversées par quelques camarades podcasteurs autour de leur flux RSS, j’ai ressenti le besoin d’écrire une bafouille pour expliquer l’importance de contrôler soi-même son flux.

J’en ai moi même fait les frais pour <a href="http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewPodcast?id=489311289" rel="external">les extras de Poli*Geek</a>. Ce podcast audio et vidéo est hébergés sur le service Blip.tv, qui propose un bon service d’hébergement gratuit pour des podcasts d’audience modeste (le débit de téléchargement n’est pas particulièrement rapide). Blip.tv propose de générer automatiquement un flux qui puisse être récupéré par iTunes pour en faire un podcast. La plupart des CMS génèrent eux aussi (plus ou moins nativement) un flux RSS exploitable par iTunes pour en faire un podcast. 

Naïf jeune podcasteur et informaticien que j’étais au moment du lancement de ce podcast, j’avais laissé Blip.tv gérer 100% de ce podcast, de l’hébergement des fichiers à la génération du flux RSS. Quelle erreur !
Suite à une erreur de manipulation, l’adresse du flux a été changée par Blip.tv, sans en notifier iTunes. Le podcast, ses commentaires et ses abonnés sont donc perdus, iTunes ne permettant de changer l’URL du flux RSS que dans le code de celui-ci (et ne permettant pas non plus de supprimer un podcast pour le recréer).

Pour un podcasteur qui veut garder un minimum de continuité dans son travail et ne pas perdre ses abonnés et commentaires sur sa page iTunes, il est donc extrêmement important de garder un contrôle sur son flux rss. C’est à dire héberger soi-même le fichier .xml sur son site internet et le coder ou le générer <a href="http://blog.adhumi.fr/article/creer-un-flux-rss-de-podcast-a-la">"à la main"</a>. Les fichiers peuvent par contre continuer à être hébergé ailleurs, c’est ce que j’ai fait pour les extras de Poli*Geek : les fichiers sont chez Blip.tv et le xml sur poligeek.fr.

Si jamais vous avez besoin de modifier l’URL de votre flux, c’est simple : Ajouter la ligne de code suivante dans le fichier .xml change automatiquement le flux sur la page iTunes, et la répercute progressivement pour les abonnés.

{% highlight xml %}
<itunes:new-feed-url>http://nomdedomaine.com/nouveau-flux.xml</itunes:new-feed-url>
{% endhighlight %}

Bien sûr, il faut que "l’ancien" flux reste en place un moment pour que le transfert puisse se faire tranquillement.

Bref, si vous vous lancez dans un projet de podcast, gardez ça en mémoire. Pour un podcasteur, le flux RSS, c’est la vie !