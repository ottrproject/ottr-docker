FROM rocker/tidyverse:4.3.2
LABEL maintainer="cansav09@gmail.com"

COPY install_github.R .
COPY github_package_list.tsv .

# Install packages from github
RUN --mount=type=secret,id=gh_pat \
  Rscript install_github.R \
  --packages github_package_list.tsv \
  --token "$(sed -i s/GH_PAT=/GH_PAT=$(cat /run/secrets/gh_pat)/ .env.production)

WORKDIR /rocker-build/

# Install apt-getable packages to start
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils dialog
RUN apt-get install -y --no-install-recommends \
    libxt6 \
    libpoppler-cpp-dev \
    vim \
    libglpk40 \
    curl \
    gpg

# Install gh
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg;
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null;
RUN apt update && apt install -y gh;

# Uninstall old version of pandoc
RUN sudo apt-get purge pandoc pandoc-citeproc pandoc-data \
  && sudo apt-get autoremove --purge

# Install pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.14.1/pandoc-2.14.1-1-amd64.deb \
  && sudo apt-get install ./pandoc-2.14.1-1-amd64.deb

# Create new symlinks
RUN ln -s /usr/bin/pandoc /usr/lib/rstudio-server/bin/pandoc

# Add curl, bzip2
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    bzip2 \
    curl

RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e "remove.packages('rlang')"

RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

# Commonly used R packages
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('rlang', \
      'bookdown', \
      'emojifont', \
      'here', \
      'leanpubr', \
      'optparse', \
      'oro.nifti', \
      'qpdf', \
      'R.utils', \
      'rprojroot', \
      'rgoogleslides', \
      'googlesheets4', \
      'servr', \
      'spelling', \
      'styler', \
      'reticulate', \
      'gh', \
      'tibble', \
      'config', \
      'quarto', \
      'chromote', \
      'webshot2'), \
      repos = 'https://cloud.r-project.org/')"

# cow needs this dependency:
RUN Rscript -e  "devtools::install_version('gitcreds', version = '0.1.1', repos = 'http://cran.us.r-project.org')"

# Set final workdir for commands
WORKDIR /home/rstudio

RUN wget https://downloads.vivaldi.com/stable/vivaldi-stable_5.5.2805.35-1_amd64.deb 
RUN apt-get update && apt-get install -y ./vivaldi-stable_5.5.2805.35-1_amd64.deb && rm -rf /var/lib/apt/lists/*

RUN echo CHROMOTE_CHROME=/usr/bin/vivaldi >> .Renviron
