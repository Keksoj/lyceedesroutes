#!/usr/bin/env bash

# Ce script convertit
pandoc pagetitre.markdown *.md --css=html.css -o lelyceedesroutes.html --self-contained
