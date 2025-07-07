# Usage: for running the analysis part of the AnVIL User Poll

FROM jhudsl/base_ottr:main
LABEL maintainer="avamariehoffman@gmail.com"

# Install googlesheets4 and tidyverse
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('tidyverse', 'googlesheets4', 'jsonlite', 'kableExtra', 'ggVennDiagram'), \
    repos = 'https://cloud.r-project.org/')"
