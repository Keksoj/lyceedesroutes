# Exporter le Lycée des Routes

default:
    @just --list

# (Ré)exporte la version web avec mdbook
web:
    @command -v mdbook >/dev/null || { echo "Veuillez installer mdbook"; exit 1; }
    cp -v src/* mdbook/src/
    mdbook build mdbook

# (Ré)exporte l'EPUB
epub:
    @command -v pandoc >/dev/null || { echo "Veuillez installer pandoc"; exit 1; }
    pandoc --data-dir=epub \
        --toc-depth=1 \
        epub/metadata.yaml \
        src/* \
        --output exports/lelyceedesroutes.epub

# Génère le fichier LaTeX
latex:
    @command -v pandoc >/dev/null || { echo "Veuillez installer pandoc"; exit 1; }
    pandoc latex/pagetitre.md \
        src/* \
        --verbose --top-level-division=chapter \
        --variable=indent \
        --template=latex/template.tex \
        --standalone \
        --output exports/lelyceedesroutes.tex

# (Ré)exporte le PDF
pdf: latex
    @command -v lualatex >/dev/null || { echo "Veuillez installer lualatex"; exit 1; }
    cd exports && lualatex lelyceedesroutes.tex

