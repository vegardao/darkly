`ip`/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c

En examinant le code source, on trouve en commentaire:
`You must cumming from : "https://www.nsa.gov/" to go to the next step`
`Let's use this browser : "ft_bornToSec". It will help you a lot`

Il faut donc réaliser une requete ayant pour `User-agent: ft_bornToSec` et pour `Referer: https://www.nsa.gov`.
Cela peut-être fait soit en modifiant l'en-tête depuis l'onglet Réseau de firefox et en selectionnant un lien, ou en exécutant une requete curl (`bash csrf.sh *ip*`)

Le flag est contenu dans la reponse.
