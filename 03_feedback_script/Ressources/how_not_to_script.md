# SQL - Injection de script
Lancer un script via un formulaire

## Comment obtenir le flag
* se rendre a `ip`/?page=feedback
* remplir le champ `Name` avec :
* soit `alert`, soit `script`
* n'importe quelle lettre de ces 2 mots cles fonctionne egalement
* cliquer sur `sign guestbook` pour obtenir le flag

## Fix possible
* La faille est etrange car on ne devrait pas reussir seulement avec une des lettres de `alert` ou `script`.\
Dans le back de cette faille, il doit y avoir un `.includes()` qui proc si le champ est entierement compris dans les deux mots cles.
De plus, le champ *message* n'est en pratique pas obligatoire.
* Si on part du principe que la faille est reussi seulement avec le lancement d'un `script` ou d'une `alert`,\
alors les methodes suivantes permettent efficacement de se proteger contre les injections de code (XSS) dans les formulaires :
- `mysql_real_escape_string` (concernant les db),
- `htmlentities()`,
- `htmlspecialchars()`,
- `strip_tags()`,
- `addslashes()`,
- et globalement en utilisant la PDO

## Explication
Il semblerait qu'il y ait eu une tentative de protection des champs, mais elle n'est pas qualitative.
Les caracteres semblent bien échappés, mais la restriction sur les strings nous donnent acces a la faille.
En pratique, un script pourrait etre injecte dans le but de modifier du code, ou pour inviter l'utilisateur a realiser une action malveillante (ex: redirection, message de phishing, ...)
