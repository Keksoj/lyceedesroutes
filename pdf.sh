#!/usr/bin/env bash
# Ce script doit éditer un PDF avec tous les fichiers markdown

# --chapters fait des chapitres classes
# --toc-depth=1 pour ne récupérer que les titres de chapitres dans l'arborescence


pandoc pagetitre.markdown *.md \
--verbose --chapters \
--variable=indent \
--template=template.latex \
--latex-engine=xelatex \
--variable=lang:french \
--output lelyceedesroutes.pdf

evince lelyceedesroutes.pdf &
# --toc-depth=1 -V  \

# --data-dir=. \
