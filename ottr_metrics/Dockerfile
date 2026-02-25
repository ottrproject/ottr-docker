# Usage: for running the analysis part of the AnVIL User Poll

FROM jhudsl/ottr_website
LABEL maintainer="itcrtrainingnetwork@gmail.com"

# Install metrics packages from CRAN
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('cranlogs'), \
    repos = 'https://cloud.r-project.org/')"

# Install the remotes package
RUN R -e "install.packages('remotes', repos = 'https://cran.rstudio.com/')"

# Install the R package from a specific GitHub branch
RUN R -e "remotes::install_github('ottrproject/metricminer', ref = 'kweav-contributors-type')"

