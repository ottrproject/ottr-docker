# Usage: for running the analysis part of the AnVIL User Poll

FROM jhudsl/base_ottr:main
LABEL maintainer="cansav09@gmail.com"

# Install cmake

RUN apt-get update && apt-get install -y cmake

# Install googlesheets4 and plotting packages
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('ggpubr', 'patchwork', 'broom', 'googlesheets4'), \
    repos = 'https://cloud.r-project.org/')"
