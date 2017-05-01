---
layout: 	post
section:	blog
title:  	"Créer un flux RSS de podcast “à la main”"
date:   	2011-03-02 16:57:51
excerpt_separator:  "<!--more-->"
---

Quand on souhaite créer un podcast, il y a d’abord la phase de conception du podcast (la partie la plus important, on en parlera ici prochainement), puis vient le moment fatidique où il faut mettre tout ça en ligne pour le partager et le faire découvrir à ses futurs poditeurs.

<!--more-->

Pour rendre votre podcast disponible, les fichiers audio doivent d’abord être hébergés en ligne puis répertoriés dans un flux RSS qui permet leurs récupération facile par les auditeurs.

La plupart des CMS de blogs forment des flux RSS compatibles avec les contraintes des podcasts, mais il manque toujours certaines informations. Le mieux est donc de créer "à la main" ce flux.

Pour ça, Apple fournit une bonne documentation <a href="https://itunespartner.apple.com/fr/podcasts/overview" rel="external">sur son site</a>.

<strong>En pratique, ça se passe de la façon suivante :</strong>

On place l’ensemble de ce qui va suivre entre les balises suivantes.

{% highlight xml linenos %}
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
    <channel>
        <!-- INSERER LA SUITE ICI -->
    </channel>
</rss>
{% endhighlight %}

On entre ensuite les données propres au podcast de la façon suivante.

{% highlight xml linenos %}
<title>Poli*Geek</title>
<description>Poli*Geek, c'est le podcast qui revient toutes les deux semaines sur l'essentiel de l'actualité politique autour des nouvelles technologies. Retrouvez dans chaque épisode les news et le grand débat, avec des invités passionnants ! Blog et plus d'infos sur www.poligeek.fr</description>
<link>http://www.poligeek.fr</link>
<language>fr-fr</language>
<copyright>cc by-nc-sa 2.0 fr</copyright>
<lastBuildDate>Tue, 26 Feb 2011 11:00:00 +0200</lastBuildDate>
<pubDate>Tue, 26 Feb 2011 11:00:00 +0200</pubDate>
<docs>http://blogs.law.harvard.edu/tech/rss</docs>
<webMaster>email@podcast.com (Nom)</webMaster>
<itunes:author>Poli*Geek</itunes:author>
<itunes:subtitle>Le podcast qui vous parle politique et technologies !</itunes:subtitle>
<itunes:summary>Poli*Geek, c'est le podcast qui revient toutes les deux semaines sur l'essentiel de l'actualité politique autour des nouvelles technologies. Retrouvez dans chaque épisode les news et le grand débat, avec des invités passionnants ! Blog et plus d'infos sur www.poligeek.fr</itunes:summary>
<itunes:owner>
    <itunes:name>Nom</itunes:name>
    <itunes:email>email@podcast.com</itunes:email>
</itunes:owner>
<itunes:explicit>Clean</itunes:explicit>
<itunes:image href="http://www.poligeek.fr/logo.png"/>
<itunes:category text="News &amp; Politics"/>
<itunes:category text="Technology">
    <itunes:category text="Tech News" />
</itunes:category>
{% endhighlight %}

On doit ensuite ajouter pour chaque épisode le code suivant, en adaptant les données à son podcast bien sûr !

{% highlight xml linenos %}
<!-- EPISODE 0 -->
<item>
    <title>&#35;0 - Le ventilo du Captain Liban</title>
    <link>http://www.poligeek.fr/spip.php?article4</link>
    <guid>http://upload.poligeek.fr/MP3/PoliGeek0.mp3</guid>
    <description>
        On y cause :
        # Les scarabés et le Vatican
        # L’ACTA dévoilé
        # Couvre-feu sur les Meuporgs
        # SeedFuck Hadopi !?
               
        Et dans le "grand débat" :
        # Les droits d’auteurs et la rémunération des artistes
               
        Plus d'infos sur www.poligeek.fr
    </description>
    <enclosure url="http://upload.poligeek.fr/MP3/PoliGeek0.mp3" type="audio/mpeg"/>
    <category>Podcasts</category>
    <pubDate>Thu, 22 Apr 2010 15:00:00 +0200</pubDate>
    <itunes:author>Poli*Geek</itunes:author>
    <itunes:explicit>No</itunes:explicit>
    <itunes:subtitle>&#35;0 - Le ventilo du Captain Liban</itunes:subtitle>
    <itunes:summary>
        On y cause :
        # Les scarabés et le Vatican
        # L’ACTA dévoilé
        # Couvre-feu sur les Meuporgs
        # SeedFuck Hadopi !?
               
        Et dans le "grand débat" :
        # Les droits d’auteurs et la rémunération des artistes
               
        Plus d'infos sur www.poligeek.fr
    </itunes:summary>
    <itunes:duration>1:04:17</itunes:duration>
    <itunes:image href="http://upload.poligeek.fr/PNG/Jacquette0.png" />
    <itunes:keywords>politique, technologie, droits, auteurs, majors, acta, hadopi</itunes:keywords>
</item>
{% endhighlight %}

Et le tour est joué !

Pour optimiser les statistiques sur le téléchargement et les abonnements, le flux peut être passé par Feedburner.