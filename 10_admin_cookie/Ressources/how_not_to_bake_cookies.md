# Cookie - Session Management
Se faire passer pour un admin qui mange des cookies

## Comment obtenir le flag
* Sur la page d'accueil, faire inspecter l'element et se rendre dans `stockage`
* Le cookie présent possède un champs `Name` défini sur `I_am_admin` et un champs `Value` défini sur `68934a3e9455fa72420237eb05902327`
* `68934a3e9455fa72420237eb05902327` = `false` en md5
* On code alore `true` en md5 = `b326b5062b2f0e69046810717534cb09`
* Remplacer alors la `Value` par la nouvelle
* Actualiser le site et on obtient le flag

## Fix possible
Il est très important de ne pas exposer au public des données sensibles via les cookies, et de coupler la vérification de l'authenticité d'un utilisateur avec avec des clés d'authentification stockées par exemple dans la session ou dans des JWT (Json Web Tokens)

## Explication
Ici le cookie est sérialisé mais c'est une sécurité anecdotique, le md5 étant décryptable très rapidement. L'accès à une page (au flag en l'occurence) est simplement conditionné par la valeur décryptée du cookie *je suis admin*, or il est trop simple d'en modifier ladite valeur et de détourner les droits administrateurs par ce biais, ce qui consitue une faille évidente de sécurité.
