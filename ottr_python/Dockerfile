FROM jhudsl/base_ottr:main
LABEL maintainer="cansav09@gmail.com"

# Install python
RUN apt-get -y --no-install-recommends install \
    python3-pip  python3-dev

# Install some python packages
RUN pip3 install \
    numpy==2.0.1 matplotlib==3.9.2 pandas==2.2.2 seaborn==0.13.2 plotnine==0.13.6 scikit-learn==1.5.1 scipy==1.14.0
