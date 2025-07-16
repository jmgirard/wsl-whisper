#!/bin/bash
# install_whisper.sh

set -e

echo "Checking for audio.whisper installation..."

Rscript - <<EOF
pkg <- "audio.whisper"

is_installed <- requireNamespace(pkg, quietly = TRUE)

if (is_installed) {
    message(pkg, " version ", ver, " is already installed. Skipping.")
    quit(status = 0)
} else {
  message(pkg, " is not installed. Proceeding with installation.")
}

pak::pak("bnosac/audio.whisper")
EOF
