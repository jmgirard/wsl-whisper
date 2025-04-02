#!/bin/bash
# install_openac.sh

set -e

R -q -e '    
    install.packages("remotes")
    remotes::install_github("jmgirard/openac")
'
