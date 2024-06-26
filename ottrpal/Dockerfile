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
RUN Rscript -e  "install.packages(c('curl', 'chromote', 'webshot2'))"

# Copy over git token
COPY git_token.txt .
COPY install_github.R .

# Install development version of ottrpal!
RUN Rscript install_github.R \
  --packages ottrpal \
  --token git_token.txt

