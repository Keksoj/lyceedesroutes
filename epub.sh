#!/usr/bin/env bash
# Ce script doit compiler tous les fichiers markdown, avec les métadonnées et
# le CSS, et produire un epub.

pandoc --data-dir=. metadata.yaml *.md --output sortie.epub
