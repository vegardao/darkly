# Cross Side Request Forgery
Modifier le header d'une requete

## Comment obtenir le flag
* Cliquer sur `© BornToSec` en bas de page
* `ip`/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c
* fun fact: e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c = TAMERE (en sha256)...

* En examinant le code source, on trouve en commentaire:
- `You must cumming from : "https://www.nsa.gov/" to go to the next step`
- `Let's use this browser : "ft_bornToSec". It will help you a lot`

* Il faut donc réaliser une requete ayant pour `User-agent: ft_bornToSec` et pour `Referer: https://www.nsa.gov`.
* Cela peut-être fait soit en modifiant l'en-tête depuis l'onglet Réseau de firefox et en selectionnant un lien, ou en exécutant une requete curl (`bash csrf.sh *ip*`)

* Le flag est contenu dans la reponse.

## Fix possible
* Verifier le referer dans les pages sensibles.
* Bloquer la requête si la valeur du referer differe de la page d'ou l'utilisateur doit théoriquement provenir.
* Verifier l'user-agent via une liste des user-agent acceptes

## Explication
L'envoi de requete HTTP peut etre fait a l'insu de l'utilisateur, et cela peut declencher des actions non desirees.
Peut permettre une authentification qui ne serait normalement pas acceptee.
