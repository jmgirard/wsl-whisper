# wsl-whisper

The audio.whisper R package allows users to easily use OpenAI's Whisper model (e.g., for automated transcription of audio files) from R. Significant speedups can be achieved on machines with CUDA-enabled graphics cards, but setting this up can be complicated. 
This docker image allows a user on Windows to easily install all the dependencies needed to run audio.whisper with CUDA support via Windows Subsystem for Linux (WSL2). Note that currently only the AMD64 architecture is supported.
It is built on top of the jmgirard/rstudio2u image, which means it comes with RStudio Server installed and `install.packages()` and `update.packages()` both pull precompiled binaries from r2u.

| Tag    | Base Image         | Operating System         | R ver | CUDA ver | AW ver |
|--------|--------------------|--------------------------|-------|----------|--------|
| latest | jmgirard/rstudio2u | Ubuntu 24.04 LTS (noble) | 4.4.3 | 12.8     | 0.4.1  |

