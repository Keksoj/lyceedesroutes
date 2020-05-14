#!/usr/bin/env bash
# Ce script doit éditer un PDF avec tous les fichiers markdown

pandoc pagetitre.markdown src/* \
--verbose --chapters \
--variable=indent \
--template=template.tex \
--standalone --output test.tex

# --variable=indent pour l'indentation des paragraphes
# --chapters change la classe du document en {book}
