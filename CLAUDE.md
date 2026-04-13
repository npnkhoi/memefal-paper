# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LaTeX paper repository for "MemeFal: Detecting Logical Fallacies of Arguments in Memes", an ACL-format NLP paper on vision-language logical fallacy detection.

## Build Commands

```bash
# Compile the paper (PDF output goes to .output/)
mkdir -p .output && pdflatex -output-directory=.output main.tex && bibtex .output/main && pdflatex -output-directory=.output main.tex && pdflatex -output-directory=.output main.tex

# Quick single-pass compile (no bibliography update)
mkdir -p .output && pdflatex -output-directory=.output main.tex

# Clean build artifacts
rm -rf .output
```

## File Structure

- `main.tex` — single source file containing the entire paper
- `acl.sty` — ACL conference style file (do not modify)
- `acl_natbib.bst` — ACL bibliography style (do not modify)
- `custom.bib` — bibliography entries for references

## Paper Modes

The ACL package supports three modes, set at line 7 of `main.tex`:
- `\usepackage[review]{acl}` — anonymous review version (default)
- `\usepackage[final]{acl}` — camera-ready version with author info
- `\usepackage[preprint]{acl}` — non-anonymous with page numbers

## Content Structure

The paper sections follow this order in `main.tex` (currently stubs):
1. Abstract
2. Introduction
3. Related Work
4. Task definition
5. Dataset (MemeFal)
6. Experiments
7. Conclusion
8. Appendix

The custom macro `\corpus` is defined as `{\tt MemeFal}` — use it instead of writing the dataset name directly.
