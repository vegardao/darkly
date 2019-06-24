# root user brutefore
Utiliser une base de donnees de mots de passe

## Comment obtenir le flag
* Sur la page d'accueil, cliquer sur *signin*
* Deux champs sont proposés, `username` et `password`.
* La page wikipedia suivante indique les mots de passe les plus utilisés :
- *https://fr.wikipedia.org/wiki/Liste_des_mots_de_passe_les_plus_courants*
- Nous avons repris l'integralite des mots de passe de 2011 a 2018 et supprime les doublons.
* Nous supposons depuis la faille 06 qu'il existe un utilisateur `root`
* En testant tous les mots de passe de la liste avec le script `brutefore.sh`
* On trouve le flag avec le mot de passe : `shadow`

## Fix possible
* Utiliser de meilleurs mots de passe : éviter les mots de passe courants, inclure minuscules, majuscules, caractères spéciaux, numériques...
* Intégrer une clé de sécurité sur le site (code à usage unique par exemple) ou au moins un validateur captcha pour décourager et éviter l'utilisation de scripts basiques
* Bloquer le nombre de requetes par utilisateur par minute pour eviter le bruteforce

## L'exploiter
Deux moyens a disposition :
- inscrire les mots de passe sur la page directement a la main (pas d'explications nécessaires)
- rédiger un script appelant curl et envoyant les requetes pour les différents mots de passe

### Concernant le script:
Il s'agit d'un simple get, sans header particulier requis, itérant sur les éventuels logins et une liste de mots de passe.
L'exécuter `bash csrf.sh *ip*`.
Les réponses html du site ne proposant pas l'expression `The flag is : {alnum values}` sont considérées comme des échecs.
En revanche si le flag est trouvé, il est affiché (ainsi que la combinaison gagnante).
Le script peut etre vérifié en testant directement sur le site.
