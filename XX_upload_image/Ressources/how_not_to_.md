La page *`ip`/index.php?page=upload#* permet d'upload des photos
Etant limités par le formulaire du site, on tente de modifier la requête directement via curl
(note: les champs `-F "value=..." correspondent saux inputs du fichier a upload et du submit)
En envoyant un fichier quelconque (script js ou autre, y compris vide, possiblement malveillant) tout en indiquant que le type transmis est une image (*jpg*), le serveur va accepter le formulaire