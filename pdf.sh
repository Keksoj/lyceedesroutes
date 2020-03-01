#!/usr/bin/env bash
# Ce script doit éditer un PDF avec tous les fichiers markdown

# --chapters change la classe du document en {book}
# --variable=indent pour l'indentation des paragraphes


pandoc pagetitre.markdown *.md \
--verbose --chapters \
--variable=indent \
--latex-engine=xelatex \
--output lelyceedesroutes.pdf

evince lelyceedesroutes.pdf &

# --template=template.tex \
