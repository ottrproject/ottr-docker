#!/bin/sh

if [ "$1" = "rmd" ]; then
  Rscript -e "bookdown::render_book('index.Rmd', output_format = 'all')"
elif [ "$1" = "quarto" ]; then
  Rscript -e "quarto::quarto_render('.')"
elif [ "$1" = "spelling" ] || [ "$1" = "urls" ] || [ "$1" = "quiz_format" ]; then
  Rscript -e "ottrpal::ottr_check(check_type = '$1')"
  # Save output
  echo "error_name=$error_name" >> $GITHUB_OUTPUT
  echo "report_path=$report_path" >> $GITHUB_OUTPUT
  echo "chk_results=$chk_results" >> $GITHUB_OUTPUT
else
 echo Viable options are "render_rmd", "render_quarto", "spelling", "urls", "quiz_format"
fi
