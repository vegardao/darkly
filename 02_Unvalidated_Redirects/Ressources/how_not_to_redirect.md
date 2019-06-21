# Unvalidated Redirects
Acceder a une page non desiree via une redirection

## Comment obtenir le flag
* Copier l'adresse d'un des liens de bas de page, redirigeant vers les reseaux sociaux
* Modifier le site de redirection par `unsitefrauduleux`
* On obtient l'adresse: `ip`/index.php?page=redirect&site=`unsitefrauduleux`
(Tips: `unsitefrauduleux` peut etre remplace par ce que vous voulez !)

## Fix possible
* Eviter d'utiliser des redirections
* Verifier la validite de l'url a chaque redirection
* Utiliser une liste de site de redirection autorises
* Utiliser Sanitize pour eliminer les donnees malicieuses soumises par l'utilisateur
* Forcer les redirections a passer par une page qui indique a l'utilisateur qu'il va quitter le site, avec une confirmation

## Explication
Avec une redirection non verifiee, un utilisateur malvaillant peut rediriger l'utilisateur\
sur un site de pishing. On peut imaginer un site bancaire qui redirige vers une copie\
dans le but de subtiliser les identifiants de la personne avant de le rediriger de maniere\
transparente sur le vrai site.
