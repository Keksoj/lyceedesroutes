# Readme : Le Lycée des Routes
Une nouvelle rédigée en markdown, exportée avec pandoc.

Pour rédiger ce récit, je n'ai pas souhaité utiliser un outil de traitement de texte classique comme Word ou LibreOffice.
Ces outils sont puissants mais le format n'est pas très portable.
On peut éditer un roman dans LibreOffice, avec un sommaire, des chapitres, etc...
mais il faut refaire la mise en page entièrement selon qu'on veut par exemple :

* sortir un PDF en A4,
* envoyer le livre pour imprimer, en 11 * 18 cm par exemple
* éditer un epub (format proche du xml)
* publier en ligne (format html)

Afin d'éviter ce genre de manipulations, j'ai opté pour une solution modulaire.
D'un côté, la rédaction du texte, de l'autre, son édition.

| | rédaction | exportation |
| :---: | :-------: | :-----: |
| **se concentre sur...** |  le fond | la forme |
| **doit être...** | la plus simple possible | la plus performante possible |
| **outil utilisé :** | mardown | pandoc |

***

## Rédiger en markdown

C'est un langage de balisage léger qui produit du html avec un grand confort d'écriture.
Dans un fichier texte avec l'extension `.md`, on peux écrire *ceci* :

```
Une phrase avec du **gras** et de l'*italique*.
```

Et une fois interprété, le texte apparaîtra *ainsi* :

> Une phrase avec du **gras** et de l'*italique*.

Le livre est divisé en chapitres d'environ 2000 mots chacuns.
Il y a un fichier en markdown par chapitre, nommé par exemple `03 - Titre du chapitre.md`.  
Les balises markdown les plus utilisées dans le projet :


* `#` et `##` pour créér les titres (`<h1>` et `<h2>` en html). Les titres ainsi balisés seront automatiquement listés dans le sommaire.
* `>` pour introduire des citations (quand un personnage lit un livre par exemple)
* *un retour à la ligne* entre chaque phrase n'impacte pas la forme finale du texte. Rédiger une phrase par ligne facilite l'utilisation de git et le confort d'écriture en général (si, si..)
* *deux retours à la ligne* créent un nouveau paragraphe (délimité par `<p>` et `</p>` en html).
* `***` pour créer une ligne horizontale qui sépare les paragraphes.

Un avantage de markdown : il est natif de github, ce qui fait que le roman est lisible directement en naviguant dans le projet.

***

## Exporter avec pandoc

Pandoc est une bibliothèque en haskell, et un outil en ligne de commande associé.
Il est susceptible de recevoir du texte rédigé avec markdown et de le convertir :

* En **html** (pour une page web et les emails)
* En **epub** (pour une liseuse)
* En **pdf** (pour imprimer)
* En d'autres formats

Les commandes ont en général cet aspect :

```sh
pandoc *.md --output lelyceedesroutes.format
```

Avec `*.md`, pandoc concatène tous les fichiers mardown, repère les titres balisés `# Titre`, en fait des chapitres, une table des matières. Rien que ça !

### Je veux essayer aussi !

Certes. Il vous faut récupérer le dépôt avec git en faisant

```sh
git clone https://github.com/Keksoj/lyceedesroutes.git
cd lelyceedesroutes
```





