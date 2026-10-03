FROM jhudsl/base_ottr:main-r4.4.0
LABEL maintainer="cansav09@gmail.com"

WORKDIR /app

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

WORKDIR /home
