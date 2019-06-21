# Survey option value - XSS
Modifier une valeur d'un sondage pour la trafiquer

## Comment obtenir le flag
* Acceder a la page `ip`/?page=survey
* Sur la selectBox d'un *Subject*, clic droit / examiner l'element
* Modifier l'attribut `value` de l'une des options du container select
* Selectionner l'option correspondante va automatiquement submit : on obtient le flag

## Fix possible
* Ajouter une verification en back afin de limiter la valeur transmise par le front
* On pourrait ajouter en HTML un `min` et un `max` mais il faudrait quand meme avoir une verification en back
* Une facon un peu plus securisee que l'HTML serait de le gerer en JavaScript (plus difficile a modifier par l'utilisateur)

## Explication
Un utilisateur malvaillant peut corompre le sondage en envoyant de mauvaise valeur.
En back, n'accepter que les valeurs dans le champ 1 a 10 evite les problemes.
