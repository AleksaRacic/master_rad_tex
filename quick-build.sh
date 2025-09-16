#!/bin/bash
set -e

mkdir -p build
echo "Quick LaTeX compilation..."
pdflatex -output-directory=build -interaction=nonstopmode master_rad.tex
cp build/master_rad.pdf .
echo "Quick build complete: master_rad.pdf"
