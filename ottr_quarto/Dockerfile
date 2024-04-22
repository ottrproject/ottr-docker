FROM jhudsl/base_ottr:main
LABEL maintainer="cansav09@gmail.com"

RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

# Install quarto R package
RUN Rscript -e  "options(warn = 2);install.packages( \
    c('quarto')

# Set final workdir for commands
WORKDIR /home/rstudio
