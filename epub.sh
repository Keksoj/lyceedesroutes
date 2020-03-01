#!/usr/bin/env bash
# Ce script doit compiler tous les fichiers markdown, avec les métadonnées et
# le CSS, et produire un epub.

# --data-dir=. signifie : le CSS se trouve dans le dossier local (.)
# --toc-depth=1 permet de ne générer une table des matières qu'avec une
# profondeur de 1 (évite les titres intermédiaires)
# metadata.yaml contient les métadonnées

pandoc --data-dir=. --toc-depth=1 metadata.yaml *.md --output lelyceedesroutes.epub
