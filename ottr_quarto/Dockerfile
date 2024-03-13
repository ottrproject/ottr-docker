FROM jhudsl/base_ottr:main
LABEL maintainer="cansav09@gmail.com"

RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

# Set final workdir for commands
WORKDIR /home/rstudio
