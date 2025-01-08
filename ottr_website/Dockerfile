# Usage: for running the analysis part of the AnVIL User Poll

FROM jhudsl/base_ottr:main
LABEL maintainer="cansav09@gmail.com"

RUN Rscript -e "install.packages('BiocManager', repos = 'https://packagemanager.rstudio.com/all/__linux__/centos7/latest')" 

## Install ggpubr dependency
RUN Rscript -e "options(warn = 2);install.packages( \ BiocManager::install('nloptr')"

# Install googlesheets4 and plotting packages
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('ggpubr', 'patchwork', 'broom', 'googlesheets4'), \
    repos = 'https://cloud.r-project.org/')"
