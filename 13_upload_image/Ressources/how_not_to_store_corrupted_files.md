# 

## Comment obtenir le flag
La page *`ip`/index.php?page=upload#* permet d'upload des photos
Etant limités par le formulaire du site, on tente de modifier la requête directement via curl, au sein du script suivant: `bash upload.sh *ip*`.
Le script va envoyer au serveur le formulaire rempli d'upload d'une "image" (qui n'en est en réalité pas une) et afficher le flag (si flag il y a) en triant la page html retournée à curl par le serveur

Note: les champs `-F "value=..." correspondent saux inputs du fichier a upload et du submit

En envoyant un fichier quelconque (script js ou autre, y compris vide, possiblement malveillant) tout en indiquant que le type transmis est une image (*jpg*), le serveur va accepter le formulaire et nous renvoyer le flag

## Fix possible
Il est très important de ne pas exposer au public des données sensibles via les cookies, et de coupler la vérification de l'authenticité d'un utilisateur avec avec des clés d'authentification stockées par exemple dans la session ou dans des JWT (Json Web Tokens)

## Explication
Le formulaire d'envoi de données multimédia se contente d'une sécurité simple en se fiant uniquement au type de donnée transmis par le formulaire (`type=image/jpeg`)
