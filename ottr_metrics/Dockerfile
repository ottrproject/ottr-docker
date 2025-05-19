# Usage: for running the analysis part of the AnVIL User Poll

FROM jhudsl/ottr_website
LABEL maintainer="itcrtrainingnetwork@gmail.com"

# Install metrics packages
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('cranlogs', 'metricminer'), \
    repos = 'https://cloud.r-project.org/')"
