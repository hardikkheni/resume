#!/usr/bin/env bash
# Unstick latexmk: clear stale error state, force a clean rebuild.
set -euo pipefail

cd "$(dirname "$0")"
DOC="${1:-hardikkheni-resume.tex}"

echo ">> full clean"
latexmk -C "$DOC"

echo ">> rebuild"
latexmk -pdf -synctex=1 -interaction=nonstopmode -file-line-error "$DOC"

echo ">> done: ${DOC%.tex}.pdf"
