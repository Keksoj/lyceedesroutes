#!/usr/bin/env bash

# Ce script convertit
pandoc pagetitre.markdown src/* --css=html.css -o lelyceedesroutes.html --self-contained
