# Unprotected Submit - XSS
Sugmit une valeur pour un envoi de mail

## Comment obtenir le flag
* Acceder a la page `ip`/?page=recover
* Seul un bouton `submit` apparait, clic droit / examiner l'element
* Supprimer la `value` du champ `mail` (qui est `hidden`)
* Cliquer sur `Submit` : on obtient le flag.

## Fix possible
* La `value` de l'input `mail` ne doit pas etre transmise ou modifiable par le front
* Il faudrait integrer la valeur du mail en back

## Explication
Bien que le champ `type` soit `hidden`, ce formulaire est toujours contournable.
Une securite front ne suffit pas car l'utilisateur peut modifier la valeur du formulaire.
Utiliser le back pour valider ou non les donnees est la seule securite afin d'eviter un exploit.

Un utilisateur malvaillant pourrait alors utiliser ce champs `mail` pour faire du mail bombing.
