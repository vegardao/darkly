# Data-URI
Charger un script a travers un identifiant de ressource

## Comment obtenir le flag
* Cliquer sur le logo de la NSA, on se retrouve a l'adresse : `ip`/?page=media&src=nsa
* On observe alors que le logo est charge par rapport a un identifiant et non un emplacement (les images etant situees dans le dossier *`ip`/images/*)
* On peut donc utiliser un data-URI dans le but d'executer un script
* Le schema data-URI se decompose de cette facon : `data:[<MIME-type>][;charset=<encodage>][;base64],<data>`
- MIME-type : correspond au type du fichier (ex: image/png, text/plain, text/html)
- encodage : optionnel, permet de preciser l'encodage des caracteres
- base64 : optionnel, precise que la ressource est encodee en base64 et non seulement des caracteres ASCII (par defaut)
- data : la ressource a charger
* Nous tentons donc de charger un script suivant :
- `<script>alert('gpoblon&jmichaud')</script>` en base64 = *PHNjcmlwdD5hbGVydCgnZ3BvYmxvbiZqbWljaGF1ZCcpPC9zY3JpcHQ+*
* Adresse obtenue : *`ip`/?page=media&src=data:text/html;base64,PHNjcmlwdD5hbGVydCgnZ3BvYmxvbiZqbWljaGF1ZCcpPC9zY3JpcHQ+*
* On obtient alors le flag

## Fix possible
* Mettre les images dans une base de donnee plutot que d'indiquer leur identifiant

## Explication
A la difference d'une URL qui localise une ressource, une URI est un identifiant de ressource.
Avec une URI, on peut donc acceder a une ressource sans acceder a son emplacement.
En theorie, on peut donc utiliser n'importe quelle ressource et notamment des scripts.

Les data-URI peuvent permettre de regrouper plusieurs ressources dans un seul fichier.
Cela permet d'acceder a plusieurs ressources en une seule requete, et donc de limiter les requetes.
Ceci dit, les ressources identifiees par data-URI sont mises en cache, il faut donc ne selectionner que les fichiers dont la mise en cache est permise sur le long terme par le serveur (page HTML ou PHP)
