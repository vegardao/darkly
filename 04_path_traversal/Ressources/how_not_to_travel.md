# Path Traversal
Acceder a du contenu normalement inaccessible via les liens symboliques `..`

## Comment obtenir le flag
* Naviguer dans le serveur a l'aide de l'adresse `ip`/?page=
* En ajoutant des `../` on obtient des messages nous invitant a continuer
* Une fois a `ip`/?page=../../../../../../../../ le message nous invitea trouver le fichier pour obtenir le flag
* On obtient le flag en testant le fichier `etc/passwd`

## Fix possible
* Refuser l'acces aux utilisateurs des pages situees en dessous de la racine du sit\ 
* Mettre en place une protection sur les repertoires contenant des donnees sensibles

## Explication
On peut imaginer qu'un webmaster securise son site par mot de passe avec les fichiers `.ht*`\ 
On pourrait trouver le .htaccess en testant l'adresse `../admin/.htaccess`\
Il pourrait nous donner l'emplacement d'un `.htpasswd`\
En accedant alors a ce fichier, on aurait acces aux mots de passes\

On pourrait imaginer, dans un site ou les utilisateurs peuvent poster des articles et\
que ces articles soient stocke sur le serveur avec un nom de fichier egal au nom de l'article,\
qu'un utilisateur malvaillant nomme son article `../index.html` dans le but de modifier le site\
dans le but de le pirater par la suite.
