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


### Exporter en HTML

Il suffit d'éxécuter le script `html.sh`

```sh
./html.sh
```

qui lui-même fait :

```sh
pandoc pagetitre.markdown *.md --css=html.css -o lelyceedesroutes.html --self-contained
```

* `pagetitre.markdown` contient des métadonnées.
* La décoration, définie dans `html.css`, est incluse dans la page HTML produite, grâce à l'option `--self-contained`

### Exporter en EPUB

Pandoc est assez agile pour créer un epub largement présentable avec seulement les fichiers markdown, des métadonnées, et de la décoration en CSS.
Il suffit d'exécuter le script `epub.sh`

```sh
./epub.sh
```

qui lui-même fait

```sh
pandoc --data-dir=. --toc-depth=1 metadata.yaml *.md --output lelyceedesroutes.epub
```

* `--data-dir=.` redirige pandoc vers `epub.css`
* `--toc-depth=1` pour que la table des matières (*Table Of Content*) ne prenne en compte que les titres de chapitres et n'aille pas plus profond (*depth*) dans l'arborescence.
* `metadata.yaml` est un fichier de métadonnées

### Exporter en PDF

Quand on demande ceci à pandoc :

```sh
pandoc document.md --output document.pdf
```

il se passe deux choses distinctes bien que l'utilisateur ne les percoive pas :

1. Pandoc produit un fichier LaTeX
2. Pandoc appelle un logiciel de mise en page (comme Xelatex par exemple) qui transforme ce fichier en joli PDF.

Bievenue dans le monde magique de LaTeX !  
Qu'est-ce qui peut égaler la satisfaction procurée par la fabrication d'un PDF à partir de quelques lignes de texte   
La suite du propos considère que vous connaissez un peu LaTeX, ne serait-ce que pour avoir partagé un café-clope avec lui en terrasse quand vous étiez encore à la fac.
Une bonne initiation se trouve [ici](https://fr.wikibooks.org/wiki/LaTeX).
Si vous n'êtes pas familier avec LaTeX, soyez prêt à vous cogner la tête contre votre clavier de nombreuses fois, et à y prendre plaisir.


#### Sous le capot

La commande vue plus haut fonctionne bien et vous donnera un PDF relativement élégant, mais sans page de titre, avec des marges franchement larges, et un format de papier américain ! Inacceptable.

Nous avons dit plus haut que Pandoc produit d'abord un fichier LaTeX avec une extension `.tex`. Cette étape est décomposable en faisant :

```sh
pandoc document.md --output --standalone document.tex
```

Pour produire `document.tex`, Pandoc a utilisé un fichier modèle, consultable ainsi :

```sh
pandoc -D latex
```

et qui est à peu près aussi lisible que l'annuaire de Shanghai. On peut néanmoins récupérer ce modèle en faisant

```sh
pandoc -D latex >> template.tex
```

puis le modifier, et une fois customisé, l'utiliser de la sorte :

```sh
pandoc document.md --template=template.tex -s -o test.tex
```

Le plus simple est d'ajouter à `template.tex` la ligne suivante :

```latex
\usepackage{mystyle}
```

qui appelle le fichier `mystyle.sty`, créé par votre serviteur, endroit privilégié pour appeler des packages et faire des réglages fins.

Suivre ces étapes permet de créer un fichier `test.tex` largement lisible, ce qui est plutôt rassurant. Le script `verstex.sh` est dédié à cette phase de débugage.

#### La commande complète

est présente dans `pdf.sh` et se présente ainsi :

```sh
pandoc pagetitre.markdown *.md \
--verbose --chapters \
--variable=indent \
--template=template.tex \
--latex-engine=xelatex \
--output lelyceedesroutes.pdf
```

* `--chapters` change la classe du document en `{book}`
* `--variable=indent` pour l'indentation des paragraphes
