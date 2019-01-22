# Le Lycée des Routes
Un roman en langue française.

Pour éditer ce roman, je n'ai pas souhaité utiliser un outil de traitement de texte classique comme Word ou LibreOffice.
Ces outils sont puissants mais le format n'est pas très portable.
On peut éditer un roman dans LibreOffice, avec un sommaire, des chapitres, etc...
mais il faut refaire la mise en page entièrement selon qu'on veut par exemple :
* sortir un PDF en A4,
* envoyer le livre pour imprimer, en 11 * 18 cm par exemple
* éditer un epub (format proche du xml)
* publier en ligne (format html)

Afin d'éviter ce genre de manipulations, j'ai opté pour une solution modulaire.
D'un côté, la rédaction du texte, de l'autre, son édition.

| | rédaction | édition |
| :---: | :-------: | :-----: |
| **se concentre sur...** |  le fond | la forme |
| **doit être...** | la plus simple possible | la plus performante possible |
| **outil utilisé :** | mardown | pandoc |

### Rédiger en markdown

C'est un langage de balisage léger.
Dans un fichier texte avec l'extansion `.md`, on peux écrire *ceci* :
```
Une phrase avec du **gras** et de l'*italique*.
```
Et une fois interprété, le texte apparaîtra *ainsi* :
> Une phrase avec du **gras** et de l'*italique*.

Le livre est divisé en chapitres d'environ 2000 mots chacuns.
Il y a un fichier en markdown par chapitre, nommé par exemple `03 - Titre du chapitre.md`.

Autre avantage de markdown : il est natif de github, ce qui fait que le roman est lisible directement en naviguant dans le projet.


### Éditer avec pandoc

Pandoc est une bibliothèque en haskell, et un outil en ligne de commande associé.
Il est susceptible de recevoir du texte rédigé avec markdown et de le convertir :
* En **html** (pour une page web et les emails)
* En **epub** (pour une liseuse)
* En **pdf** (pour imprimer)
* En d'autres formats

#### Créer un epub à partir de markdown
Pandoc est assez agile pour créer un epub.
Il faut s'adresser à lui par ligne de commande :
```
pandoc *.md -o roman.epub
```
* `pandoc` appelle l'outil
* `*.md` signifie *tous les fichiers markdown*.
* `-o` est une option qui signifie *output*
* `roman.epub` est le fichier de sortie

Pandoc récupère donc tous les chapitres rédigés en markdown et génère un fichier `roman.epub`, immédiatement lisible par une liseuse.


###### Générer la première page
La page titre est générée par la combinaison de deux éléments :
* les métadonnées (titre, nom de l'auteur...) présentes dans le fichier `metadata.yaml`
* le fichier `epub.css` qui gère la décoration (centrer le titre...)

Il faut donc mettre à jour notre ligne de commande :
```
pandoc --data-dir=. metadata.yaml *.md -o roman.epub
```
* `--data-dir=.` pour que pandoc trouve `epub.css` dans le dossier courant ( `.` )
* `metadata.yaml` pour fournir les métadonnées.
