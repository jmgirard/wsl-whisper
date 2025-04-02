FROM jmgirard/rstudio2u:noble

LABEL org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/jmgirard/wsl-whisper" \
      org.label-schema.vendor="Girard Consulting" \
      maintainer="Jeffrey Girard <me@jmgirard.com>"

# Set Environmental Variables
ENV AW_VERSION=0.4.1
ENV PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64
ENV CUDA_PATH=/usr/local/cuda
ENV WHISPER_CUBLAS=1

# Install CUDA Toolkit and openac
COPY scripts /rocker_scripts
RUN chmod -R +x /rocker_scripts/ \
    && /rocker_scripts/install_cuda.sh \
    && /rocker_scripts/install_openac.sh

EXPOSE 8787
CMD ["/init"]
