FROM jhudsl/ottr_python:main
LABEL maintainer="kisaac@fredhutch.org"

# Remove broken Vivaldi repo
RUN rm -f /etc/apt/sources.list.d/vivaldi.list \
    && rm -f /etc/apt/sources.list.d/vivaldi*.sources

# System dependencies for R packages
RUN apt-get update && apt-get install -y \
    cmake \
    xz-utils \
    libgmp-dev \
    libudunits2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff-dev \
    libcairo2-dev \
    libgit2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install BiocManager
RUN Rscript -e "install.packages('BiocManager', repos='https://cloud.r-project.org')"

# Install nloptr early (compiled dependency)
RUN Rscript -e "BiocManager::install('nloptr')"

# Core R infrastructure (pinned versions)
RUN Rscript -e "install.packages( \
    c('Rcpp', 'xfun', 'htmltools', 'rmarkdown', 'knitr'), \
    repos='https://cloud.r-project.org')"

# Plotting ecosystem (pinned versions)
RUN Rscript -e "install.packages( \
    c('ggpubr','patchwork','broom','ggrepel','ggtext','ggrain','ggridges', \
      'networkD3','scales','survival','survMisc','survminer','ggVennDiagram', \
      'UpSetR','naniar','palmerpenguins'), \
    repos='https://cloud.r-project.org')"

# remotes + GitHub packages
RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_github('davidsjoberg/ggsankey')"

# Python packages
RUN pip3 install adjustText==1.3.0
