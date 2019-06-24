# Unrestricted file upload
Envoyer du code sur le serveur, qui pourra éventuellement être exécuté par la suite.

## Comment obtenir le flag
* La page *`ip`/?page=upload* permet d'upload des photos
* Etant limités par le formulaire du site, on tente de modifier la requête directement via curl
* On utilisera notre script : `bash upload.sh *ip*`.
* Il va envoyer au serveur le formulaire rempli d'upload d'une "image" (qui n'en est en réalité pas une)
* Il trie alors la page html retournée à curl par le serveur et affiche le flag s'il y en a un

Note: les champs `-F "value=..." correspondent aux inputs du fichier a upload et du submit

* En envoyant un fichier quelconque (script js ou autre, y compris vide, possiblement malveillant) tout en indiquant que le type transmis est une image (*jpg*), le serveur va accepter le formulaire et nous renvoyer le flag

## Fix possible
Pour éviter ce genre de problèmes il est nécessaire de disposer d'une liste restrictive d'extensions autorisées ; et vérifier au moins que l'extension reçue soit autorisée et corresponde bien au `type` transmis par l'input.
Echapper les caractères du nomdufichier.
Vérifier le contenu du fichier en utilisant des paquets disponibles sur internet.
Sauvegarder quand c'est possible le contenu du fichier en db plutot que sur le site
S'assurer que les fichiers uploadés ne sont pas exécutables

## Explication
Le formulaire d'envoi de données multimédia se contente d'une sécurité simple en se fiant uniquement au type de donnée transmis par le formulaire (`type=image/jpeg`) au lieu de vérifier aussi l'extension du fichier reçu.
Il est donc très simple de transmettre des fichiers malveillants qui pourraient etre exécutés directement sur le serveur. C'est donc très dangereux.
