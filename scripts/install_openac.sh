#!/bin/bash
# install_openac.sh

set -e

R -q -e '    
    install.packages("pak")
    pak::pak("jmgirard/openac")
'
