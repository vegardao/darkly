# Cookie - Session Management
Se faire passer pour un admin qui mange des cookies

## Comment obtenir le flag
* Sur la page d'accueil, faire inspecter l'element et se rendre dans `stockage`
* Le cookie present possede un champ `Name` a `I_am_admin` et un champ `Value` a `68934a3e9455fa72420237eb05902327`
* `68934a3e9455fa72420237eb05902327` = `false` en md5
* On code alore `true` en md5 = `b326b5062b2f0e69046810717534cb09`
* Remplacer alors la `Value` par la nouvelle
* Actualiser le site et on obtient le flag

## Fix possible

## Explication
