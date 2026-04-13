#!/usr/bin/env bash
set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MAIN_TEX="$REPO_ROOT/main.tex"

# Add TeX binaries to PATH (MacTeX location)
export PATH="/Library/TeX/texbin:$PATH"

# Verify pdflatex is available
if ! command -v latexmk &>/dev/null && ! command -v pdflatex &>/dev/null; then
  echo "Error: no LaTeX compiler found in PATH."
  echo "Try opening main.tex in VSCode and building via LaTeX Workshop (Cmd+Alt+B)."
  exit 1
fi

mkdir -p "$REPO_ROOT/.output"

if command -v latexmk &>/dev/null; then
  latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf \
    -outdir="$REPO_ROOT/.output" \
    -auxdir="$REPO_ROOT/.output" \
    "$MAIN_TEX"
else
  cd "$REPO_ROOT"
  pdflatex -output-directory=.output main.tex
  bibtex .output/main
  pdflatex -output-directory=.output main.tex
  pdflatex -output-directory=.output main.tex
fi

echo "Done: $REPO_ROOT/.output/main.pdf"
