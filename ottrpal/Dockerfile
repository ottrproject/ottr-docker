FROM jhudsl/base_ottr:dev
LABEL maintainer="cansav09@gmail.com"

WORKDIR /app

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
