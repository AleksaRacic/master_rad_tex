#!/bin/bash
set -e

# Create build directory
mkdir -p build

echo "Building LaTeX document..."
pdflatex -output-directory=build -interaction=nonstopmode master_rad.tex

echo "Processing bibliography..."
bibtex build/master_rad

echo "Final compilation passes..."
pdflatex -output-directory=build -interaction=nonstopmode master_rad.tex
pdflatex -output-directory=build -interaction=nonstopmode master_rad.tex

echo "Copying final PDF..."
cp build/master_rad.pdf .

echo "Build complete: master_rad.pdf"
