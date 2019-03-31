#!/usr/bin/env bash

# Ce script convertit
pandoc *.md --css=html.css metadata.yaml -o lelyceedesroutes.html --self-contained
