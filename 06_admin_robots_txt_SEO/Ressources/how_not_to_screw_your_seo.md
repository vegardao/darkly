# Robots.txt Search Engine Optimization
Chercher des pages cachees.

## Comment obtenir le flag
* Le fichier d'indexation `robots.txt` est par convention disponible à la racine (*`ip`/robots.txt*).
* Il indique deux paths ne devant pas être indexés: */whatever* et */.hidden*.
* L'accès à */whatever* n'est pas protégé et contient le fichier *htpasswd*
* On trouve: `root:8621ffdbc5698829397d97767ac13db3` -> `dragon` en md5
* En accédant à la page *`ip`/admin/* et en entrant login: `root` et password: `dragon`, on obtient le flag

## Fix possible
* Interdir l'acces aux pages precisees dans le fichier aux utilisateurs n'ayant pas les droits.
* Ainsi une personne qui n'est pas identifiee en tant qu'admin tomberait sur un `403 Forbidden` en tentant d'acceder a *`ip`/wathever* ou a *`ip`/.hidden*

## Explication
Le fichier `robots.txt` permet de controler l'exploration et l'indexation des sites.
Les pages precisees ne seront pas explorees par les moteurs de recherches.
Etant donne que le fichier doit etre public, un utilisateur malveillant peut le consulter.
Il est donc important de veillier a proteger le contenu des pages precisees.
