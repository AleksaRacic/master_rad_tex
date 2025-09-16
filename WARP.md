# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## LaTeX Project Structure

This is a LaTeX thesis project using a custom Serbian academic template. The project follows specific formatting and technical requirements for University of Belgrade, Faculty of Electrical Engineering.

### Document Class and Template
- **Document Class**: `etf.cls` - Custom University of Belgrade ETF template
- **Class Options**: `[a4paper, 12pt, master, utf8]`
- **Template Type**: Master's thesis (`master` option)
- **Language**: Serbian Cyrillic (`serbianc`)

### Encoding and Language Configuration
```latex
\usepackage[T2A, T1]{fontenc}           % Cyrillic and Latin font encoding
\usepackage[english, main=serbianc]{babel}  % Serbian Cyrillic as main language
\usepackage{gentium}                    % Gentium font family
```

### Essential LaTeX Packages Used
```latex
% Page layout and geometry
\usepackage[a4paper, margin=25mm]{geometry}
\usepackage{setspace}                   % Line spacing control
\usepackage{titlesec}                   % Section title formatting

% Mathematics and equations
\usepackage{amsmath}                    % Advanced math environments
\usepackage{amssymb}                    % Mathematical symbols

% Tables and lists
\usepackage{array}                      % Enhanced tabular environments
\usepackage{enumitem}                   % Customizable lists
\usepackage[flushleft]{threeparttable}  % Tables with notes

% Graphics and figures
\usepackage{graphicx}                   % Image inclusion
\usepackage{rotating}                   % Rotating elements
\usepackage{float}                      % Float positioning

% Algorithms and pseudocode
\usepackage[linesnumbered, algoruled, longend]{algorithm2e}
\usepackage{algpseudocode}              % Alternative algorithm style

% Graphics creation (TikZ)
\usepackage{tikz}                       % Advanced graphics
\usepackage{pgfplots}                   % Plotting library
\usepackage{pgf-umlcd}                  % UML class diagrams
```

### Serbian Language Customization
```latex
\addto\extrasserbianc{\def\bibname{Литература}\let\refname\bibname}
\SetAlgorithmName{Псеудо код}{псеудо код}{Листа псеудо кодова}
```

### Document Structure Commands
```latex
% Custom commands for thesis metadata
\author{Алекса Рачић}
\title{Анализа проблема апстрактног резоновања у неуронским мрежама на примеру Рејвенових матрица}
\indeks{2019/0728}                      % Student ID
\mentor{доц др. Марко Мишић}           % Thesis supervisor
```

## Mathematical Content Formatting

### Equation Environments
```latex
% Numbered equations
\begin{equation}
    y = f\left(\sum_{i=1}^{n} w_i x_i + b\right)
    \label{eq:neuron}
\end{equation}

% Inline math: $mathematical\_expression$
% Display math: \[mathematical\_expression\]
```

### Mathematical Notation Conventions
- Variables in italics: `$x_i$`, `$w_i$`
- Functions: `$f(x)$`, `$\sigma(x)$`
- Matrices and vectors: Bold or uppercase notation
- Sets: `$\{[p, o, a]: p \in P, i \in O, a \in A\}$`

## Graphics and Figures

### Image Inclusion Patterns
```latex
% Standard figure with caption
\begin{figure}[h]
    \centering
    \includegraphics[width=0.7\textwidth]{images/filename.png}
    \caption{Caption text in Serbian}
    \label{fig:label_name}
\end{figure}

% Full-width figures
\includegraphics[width=\textwidth]{arhitekture/filename.pdf}

% Result plots from external directories
\includegraphics[width=0.7\textwidth]{../Results/folder_name/filename.png}
```

### TikZ Graphics Integration
```latex
\begin{tikzpicture}
    \begin{axis}[
        xlabel=$x$,
        ylabel=$f(x)$,
        axis lines=middle,
        samples=200
    ]
    \addplot[domain=-3:3,blue,thick] {function_expression};
    \end{axis}
\end{tikzpicture}
```

### UML Class Diagrams
```latex
\begin{tikzpicture}
    \begin{abstractclass}[text width=7cm]{BaseModel}{0,0}
        \operation{+ method\_name(params) : return\_type}
    \end{abstractclass}
    
    \begin{class}[text width=7cm]{ConcreteClass}{x,y}
        \inherit{BaseModel}
        \attribute{attribute : type}
        \operation{method(params) : type}
    \end{class}
\end{tikzpicture}
```

## Algorithm Presentation

### Algorithm2e Package Configuration
```latex
\SetAlgorithmName{Псеудо код}{псеудо код}{Листа псеудо кодова}
\SetInd{2mm}{3mm}  % Indentation settings

\begin{algorithm}[h]
    \caption{Algorithm title in Serbian}
    \label{alg:label}
    \DontPrintSemicolon
    \For{condition}{
        statement \;
    }
\end{algorithm}
```

### Algorithmic Environment Alternative
```latex
\begin{algorithm}[h]
    \caption{Algorithm title}
    \label{alg:label}
    \begin{algorithmic}[1]
    \Procedure{ProcedureName}{$parameters$}
        \State $statement$
        \Return $value$
    \EndProcedure
    \end{algorithmic}
\end{algorithm}
```

## Tables and Data Presentation

### Standard Table Format
```latex
\begin{table}[h]
    \centering
    \begin{tabular}{l | c}
    \hline
    Header 1 & Header 2\\
    \hline
        Row data & Values\\
    \end{tabular}
    \caption{Table caption in Serbian}
    \label{tab:label}
\end{table}
```

### Custom Column Types
```latex
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}  % Centered paragraph columns
```

## Bibliography and Citations

### Bibliography Setup
```latex
\bibliographystyle{ieeetr}              % IEEE transaction style
\bibliography{master_rad.bib}            % BibTeX file
```

### Citation Types in BibTeX File
- `@article{}` - Journal articles
- `@misc{}` - Web resources, arXiv preprints
- `@phdthesis{}` - PhD dissertations  
- `@book{}` - Books
- `@inproceedings{}` - Conference papers
- `@web{}` - Web-specific resources

### Citation Style Examples
```bibtex
@misc{example_arxiv,
    title = {Title},
    url = {http://arxiv.org/abs/xxxx.xxxxx},
    author = {Author, Name},
    year = {2023},
    note = {arXiv:xxxx.xxxxx [cs]},
    file = {Local file path}
}
```

## Development Commands

### Clean Build System
This project uses a clean build system that stores all auxiliary files in a `build/` directory, keeping the root directory clean with only source files and the final PDF.

### LaTeX Compilation
```bash
# Create build directory
mkdir -p build

# Full compilation with bibliography (recommended)
pdflatex -output-directory=build master_rad.tex
bibtex build/master_rad
pdflatex -output-directory=build master_rad.tex
pdflatex -output-directory=build master_rad.tex
cp build/master_rad.pdf .

# Quick compilation (no bibliography update)
pdflatex -output-directory=build master_rad.tex
cp build/master_rad.pdf .

# Clean build (remove all auxiliary files)
rm -rf build/

# Alternative with XeLaTeX (for better Unicode support)
xelatex -output-directory=build master_rad.tex
cp build/master_rad.pdf .
```

### Automated Build Scripts
```bash
# Create a build script for convenience
cat > build.sh << 'EOF'
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
EOF

chmod +x build.sh

# Quick build script (no bibliography)
cat > quick-build.sh << 'EOF'
#!/bin/bash
set -e

mkdir -p build
echo "Quick LaTeX compilation..."
pdflatex -output-directory=build -interaction=nonstopmode master_rad.tex
cp build/master_rad.pdf .
echo "Quick build complete: master_rad.pdf"
EOF

chmod +x quick-build.sh

# Clean script
cat > clean.sh << 'EOF'
#!/bin/bash
echo "Cleaning build files..."
rm -rf build/
rm -f master_rad.pdf
echo "Clean complete"
EOF

chmod +x clean.sh
```

### File Dependencies
- `master_rad.tex` - Main document file
- `etf.cls` - University template class file
- `master_rad.bib` - Bibliography database
- `LogoETF.png` - University logo for title page
- `Univerzitet_u_Beogradu.jpg` - University image asset

### Build Directory Structure
The build system keeps the project organized by separating source files from build artifacts:

```
master_rad/
├── master_rad.tex         # Main LaTeX file (source)
├── master_rad.bib         # Bibliography database (source)
├── etf.cls                # Document class template (source)
├── WARP.md                # Build instructions (source)
├── LogoETF.png           # University logo (source)
├── Univerzitet_u_Beogradu.jpg  # University image (source)
├── master_rad.pdf         # Final output (copied from build/)
├── build/                # Build directory (auxiliary files)
│   ├── master_rad.aux     # LaTeX auxiliary file
│   ├── master_rad.bbl     # Bibliography file
│   ├── master_rad.log     # Compilation log
│   ├── master_rad.out     # Hyperref bookmarks
│   ├── master_rad.toc     # Table of contents
│   └── master_rad.pdf     # PDF output
├── build.sh              # Full build script (optional)
├── quick-build.sh        # Quick build script (optional)
└── clean.sh              # Clean script (optional)
```

### Build Management
```bash
# Check compilation status
ls -la build/              # View build artifacts
tail build/master_rad.log   # Check for errors

# View PDF info
pdfinfo master_rad.pdf      # PDF metadata
ls -lh master_rad.pdf       # File size

# Archive project (excluding build files)
tar -czf thesis-backup.tar.gz --exclude='build' --exclude='*.pdf' .
```

### Required Directory Structure
```
master_rad/
├── master_rad.tex         # Main LaTeX file
├── master_rad.bib         # Bibliography database
├── etf.cls                # Document class template
├── LogoETF.png           # University logo
├── Univerzitet_u_Beogradu.jpg  # University image
├── images/               # images for intructory sections
├── graphs/          # research results
└── tables/         # csv tables 
```

## Document Formatting Guidelines

### General
Рад је написан на српском језику и ћирилици

### Format
- All domain teminology must be transalated to serbian language and english verison left in (енг. \textit{english_version})

### Chapter and Section Structure
```latex
\chapter{Chapter Title}
\label{sec:number}

\section{Section Title}  
\label{sec:number}

\subsection{Subsection Title}
\subsubsection{Subsubsection Title}
```

### Spacing and Layout
- Line spacing: `\onehalfspacing` (1.5 spacing)
- Page margins: 25mm all sides
- Font: Gentium family
- Chapter titles: Custom formatting via `titlesec`

### Reference and Label Conventions
- Equations: `eq:descriptive_name`
- Figures: `fig:descriptive_name` 
- Tables: `tab:descriptive_name`
- Sections: `sec:number`
- Algorithms: `alg:descriptive_name`

This LaTeX project requires Serbian Cyrillic language support and several specialized packages for mathematics, algorithms, and technical diagrams. The custom ETF class handles university-specific formatting requirements.