#!/bin/sh
# Compile the presentation and export the matching .pdfpc speaker-notes
# sidecar file. Open main.pdf in pympress afterwards — it auto-loads
# main.pdfpc when both files share a basename and live in the same folder.
set -e
cd "$(dirname "$0")"

typst compile main.typ main.pdf
typst eval 'query(<pdfpc-file>).first().value' --root . --in main.typ --format json > main.pdfpc

echo "Built main.pdf + main.pdfpc"
