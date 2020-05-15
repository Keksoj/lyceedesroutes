# Exporter en EPUB

Pandoc est assez agile pour créer un epub largement présentable avec seulement les fichiers markdown, des métadonnées, et de la décoration en CSS.
Il suffit d'exécuter le script `epub.sh`

```sh
./epub.sh
```



* `--data-dir=.` redirige pandoc vers `epub.css`
* `--toc-depth=1` pour que la table des matières (*Table Of Content*) ne prenne en compte que les titres de chapitres et n'aille pas plus profond (*depth*) dans l'arborescence.
* `metadata.yaml` est un fichier de métadonnées



