FROM jhudsl/base_ottr:main
LABEL maintainer="cansav09@gmail.com"

# Install apt-getable packages to start
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils dialog

RUN apt-get install -y --no-install-recommends \
    libxt6 \
    libpoppler-cpp-dev \
    vim \
    libglpk40 \
    curl \
    gpg \
    subversion

# Install R
RUN apt-get update && apt-get install -y r-base curl

# Install R packages
RUN Rscript -e  "options(warn = 2);install.packages( \
	c('curl', \
	'chromote', \
	'webshot2'), \
	repos = 'https://cloud.r-project.org/')"

# Copy over git token
COPY git_token.txt .
COPY install_github.R .
COPY github_package_list.tsv .

# Install development version of ottrpal!
RUN Rscript install_github.R \
  --packages github_package_list.tsv \
  --token git_token.txt

RUN wget https://downloads.vivaldi.com/stable/vivaldi-stable_5.5.2805.35-1_amd64.deb 
RUN apt-get update && apt-get install -y ./vivaldi-stable_5.5.2805.35-1_amd64.deb && rm -rf /var/lib/apt/lists/*

RUN echo CHROMOTE_CHROME=/usr/bin/vivaldi >> .Renviron
