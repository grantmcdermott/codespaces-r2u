#!/bin/sh

if [ -f install.R ]
then
    echo "installing R packages..."
    Rscript install.R
fi