#!/bin/sh

set -e
set -x

rm -rf docs
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
cp -Rf assets/reproducibility-collaboration-eha-tools.html docs/reproducibility-collaboration-eha-tools.html
cp -Rf assets docs/
