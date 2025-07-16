#!/bin/bash
set -e

# Run the whisper installer
/rocker_scripts/install_whisper.sh

# Exec the main process (e.g., /init or user-specified)
exec "$@"
