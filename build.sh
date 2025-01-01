#!/bin/bash
shopt -s extglob

CWD="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"

# zip -r "$(dirname "$CWD")/$(basename "$CWD").ftl" !(build.sh)
git archive -o "$(dirname "$CWD")/$(basename "$CWD").ftl" main
