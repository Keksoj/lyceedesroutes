#!/usr/bin/env bash
# Ce script édite le fichier interfédiaire test.tex,

pandoc pagetitre.md ../src/* \
--verbose --chapters \
--variable=indent \
--template=template.tex \
--standalone --output test.tex

# --variable=indent pour l'indentation des paragraphes
# --chapters change la classe du document en {book}
