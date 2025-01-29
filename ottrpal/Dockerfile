FROM jhudsl/base_ottr
LABEL maintainer="cansav09@gmail.com"

RUN installGithub.r \
  jhudsl/ottrpal \
  jhudsl/cow


ARG CHECK_TYPE
ENV CHECK_TYPE=${INPUT_CHECK_TYPE}

ENTRYPOINT ["Rscript -e 'ottrpal::check(check_type == ${INPUT_CHECK_TYPE})'"]
