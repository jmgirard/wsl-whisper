# wsl-whisper

The [audio.whisper](https://github.com/bnosac/audio.whisper) R package allows users to easily use OpenAI's Whisper model (e.g., for automated transcription of audio files) from R. Significant speedups can be achieved on machines with CUDA-enabled graphics cards, but setting this up can be complicated. 
This docker image allows a user on Windows to easily install all the dependencies needed to run audio.whisper with CUDA support via Windows Subsystem for Linux (WSL2). Note that currently only the AMD64 architecture is supported.
It is built on top of the [jmgirard/rstudio2u](https://github.com/jmgirard/rstudio2u) image, which means it comes with RStudio Server installed and `install.packages()` and `update.packages()` both pull precompiled binaries from [r2u](https://github.com/rocker-org/r2u).

| Tag    | Base Image         | Operating System         | R ver | CUDA ver | AW ver |
|--------|--------------------|--------------------------|-------|----------|--------|
| latest | jmgirard/rstudio2u | Ubuntu 24.04 LTS (noble) | 4.4.3 | 12.8     | 0.4.1  |

## Usage
1. Verify that your machine's graphics card supports CUDA: <https://developer.nvidia.com/cuda-gpus>
2. On Windows, install the latest game-ready driver from NVIDIA: <https://www.nvidia.com/Download/index.aspx#>
3. On Windows, install the latest version of Docker Desktop: <https://www.docker.com/products/docker-desktop/>
4. Open Docker Desktop and click the Terminal button on the bottom of the screen
5. In the Terminal, type `docker pull jmgirard/wsl-whisper` 
6. In the Terminal, type `docker run --gpus all -it -e PASSWORD=pass -p 8787:8787 jmgirard/wsl-whisper`
7. In Docker Desktop, click the Containers tab on the left and click the "8787:8787" link
8. Your browser should show a login page, enter "rstudio" as the username and "pass" for the password
9. You should now be shown the RStudio page, so enter `library(audio.whisper)` 
10. Now you can download and load whisper models via, e.g., `model <- whisper("tiny", use_gpu = TRUE)`
11. You can now use the `model` object and the `predict()` function with great speed
