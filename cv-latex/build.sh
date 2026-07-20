#!/bin/sh
# Build both CVs and install them where the site expects them.
set -e
cd "$(dirname "$0")"

for f in cv-en cv-pt; do
  xelatex -interaction=nonstopmode "$f.tex" > /dev/null
  xelatex -interaction=nonstopmode "$f.tex" > /dev/null   # second pass: links, layout
done

cp cv-en.pdf ../files/CV_Fredie_Didier_ENG.pdf
cp cv-pt.pdf ../files/CV_Fredie_Didier_PT.pdf
rm -f ./*.aux ./*.log ./*.out ./*.pdf

echo "Built and installed to files/"
