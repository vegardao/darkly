# Robots.txt Search Engine Optimization
Chercher des pages cachees.

# Scrapping
Il est possible de *scrapper* c'est à dire récupérer le contenu d'une page web via des scripts.
Dans ce cas il est question de *scrapper* les pages html basiques retournées pour l'appel récursif de chaque dossier et le contenu de chaque readme.

## Comment obtenir le flag
* Le fichier d'indexation `robots.txt` est disponible à la racine (*`ip`/robots.txt*).
* Il indique deux paths ne devant pas être indexés: */whatever* et */.hidden*.
* En accédant à la page *`ip`/.hidden/* on découvre de nombreux dossiers contenant chacuns un *README*.
Via ce script (`npm install && node requests.js `ip` `maxConcurrentRequests`), chaque dossier est ouvert récursivement et l'ensemble des *README* est vérifié
L'output du script est l'unique *README* différant des 7 phrases lambdas, il s'agit par conséquent du flag : *99dde1d35d1fdd283924d84e6d9f1d820*

Note: afin de ne pas surcharger le serveur, `maxConcurrentRequests` limite le nombre de requêtes parallèles envoyées

## Fix possible
* Interdir l'accès aux dossiers internes à l'architecture du site / serveur, surtout lorsqu'ils ont été exposés par un fichier public

## Explication
Le fichier `robots.txt` permet de controler l'exploration et l'indexation des sites.
Les pages précisées ne seront pas explorées par les moteurs de recherche.
Etant donné que le fichier doit être public, un utilisateur malveillant peut le consulter.
Il est donc important de veiller à protéger l'accès ou le contenu des pages précisées.
Il est par ailleurs possible de limiter le nombre de requêtes parallèles autorisées par le serveur (notamment depuis nginx). Ce qui limiterait le scrapping de plusieurs pages et l'overload du serveur
