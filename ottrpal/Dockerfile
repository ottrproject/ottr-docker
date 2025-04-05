FROM jhudsl/base_ottr:dev
LABEL maintainer="cansav09@gmail.com"

WORKDIR /app/home

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

