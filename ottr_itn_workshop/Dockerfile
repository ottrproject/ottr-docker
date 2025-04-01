# Usage: for running workshop activities for ITN at UMich 2025 Workshop

FROM jhudsl/base_ottr:main
LABEL maintainer="cansav09@gmail.com"

RUN Rscript -e "install.packages('BiocManager', repos = 'https://packagemanager.rstudio.com/all/__linux__/centos7/latest')"

## Install dependency
RUN Rscript -e "options(warn = 2);BiocManager::install(c('nloptr', 'RcppEigen'))"

# Install clinical activity packages
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('sqldf', 'survival', 'tidyverse', 'ggplot2', 'survminer'), \
    repos = 'https://cloud.r-project.org/')"

## Install devtools dependency
RUN Rscript -e "options(warn = 2);install.packages( \
    c('devtools'), \
    repos = 'https://cloud.r-project.org/')"

RUN Rscript -e "options(warn = 2);install.packages( \
    c('fftwtools'), \
    lib = "/usr/local/lib/R/site-library/")"

## Install other spatialGE dependencies
RUN Rscript -e "options(warn = 2);BiocManager::install( \
    c('GSVA', 'EBImage', 'DelayedMatrixStats', 'DelayedArray', 'ComplexHeatmap', 'BiocParallel'))"

# Install spatialGE
RUN Rscript -e "options(warn = 2);devtools::install_github('FridleyLab/spatialGE')"
