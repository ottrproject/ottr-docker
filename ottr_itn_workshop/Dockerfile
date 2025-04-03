# Usage: for running workshop activities for ITN at UMich 2025 Workshop

FROM jhudsl/base_ottr:main

RUN Rscript -e "install.packages('BiocManager', repos = 'https://packagemanager.rstudio.com/all/__linux__/centos7/latest')"

## Install dependency
RUN Rscript -e "options(warn = 2);BiocManager::install('nloptr')"

# Install clinical activity packages
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('sqldf', 'survival', 'tidyverse', 'ggplot2', 'survminer'), \
    repos = 'https://cloud.r-project.org/')"
