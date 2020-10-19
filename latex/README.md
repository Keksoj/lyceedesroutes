
# Exporter en PDF

Quand on demande ceci à pandoc :

```sh
pandoc document.md --output document.pdf
```

il se passe deux choses distinctes bien que l'utilisateur ne les percoive pas :

1. Pandoc produit un fichier LaTeX
2. Pandoc appelle un logiciel de mise en page (comme Xelatex par exemple) qui transforme ce fichier en joli PDF.

Bievenue dans le monde magique de LaTeX !  
Qu'est-ce qui peut égaler la satisfaction procurée par la fabrication d'un PDF à partir de quelques lignes de code ?  
La suite du propos considère que vous connaissez un peu LaTeX, ne serait-ce que pour avoir partagé un café-clope avec lui en terrasse quand vous étiez encore à la fac.
Une bonne initiation se trouve [ici](https://fr.wikibooks.org/wiki/LaTeX).
Si vous n'êtes pas familier avec LaTeX, soyez prêt à vous cogner la tête contre votre clavier de nombreuses fois, et à y prendre plaisir.


## Sous le capot

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
pandoc document.md --template=template.tex -s -o document.tex
```

Le plus simple est d'ajouter à `template.tex` la ligne suivante :

```latex
\usepackage{mystyle}
```

qui appelle le fichier `mystyle.sty`, créé par votre serviteur, endroit privilégié pour appeler des packages et faire des réglages fins.

Suivre ces étapes permet de créer un fichier `lelyceedesroutes.tex` largement lisible, ce qui est plutôt rassurant.

On peut ensuite demander à `pdflatex` de convertir en PDF :

```   
pdflatex lelyceedesroutes.tex
```

Le script `export pdf` effectue ces deux étapes séparément pour faciliter le débugage.