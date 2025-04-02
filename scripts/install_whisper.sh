#!/bin/bash
# install_whisper.sh

set -e

AW_VERSION=${1:-${AW_VERSION}}

# Install audio.whisper
R -q -e '    
    remotes::install_github("bnosac/audio.whisper", ref="'${AW_VERSION}'")
'
