const axios = require('axios');
var http = require('http');
const htmlParser = require('node-html-parser');

http.globalAgent.maxSockets = ${process.argv[3]};

async function printReadme(path) {
    return axios.get(path + 'README')
    .then(res => {
        if (!res.data.includes("Tu veux de l'aide ? Moi aussi !") &&
            !res.data.includes("Demande à ton voisin de droite") &&
            !res.data.includes("Demande à ton voisin de gauche") &&
            !res.data.includes("Demande à ton voisin du dessus") &&
            !res.data.includes("Demande à ton voisin du dessous") &&
            !res.data.includes("Toujours pas tu vas craquer non ?") &&
            !res.data.includes("Non ce n'est toujours pas bon ...")) {
                console.log(res.data)
                process.exit(0);
            }
    })
    .catch(err => console.log(err))
}

async function readLinkDir(path) {
    return axios.get(path)
    .then(res => {
        const htmlRes = htmlParser.parse(res.data, {pre: true});
        const links = htmlParser.parse(htmlRes.querySelector("pre").childNodes[0].rawText);
        links.querySelectorAll("a").forEach(element => {
            linkValue = element.childNodes[0].rawText
            if (linkValue == 'README')
                return printReadme(path);
            else if (linkValue != '../') {
                return readLinkDir(path + linkValue)
            }
        });
    })
    .catch(err => console.log(err))
}

readLinkDir(`http://${process.argv[2]}/.hidden/`)
