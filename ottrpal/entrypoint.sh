#!/bin/sh

## Do the thing depending on the command
if [ "$1" = "rmd" ]; then
  Rscript -e "bookdown::render_book('index.Rmd', output_format = 'all')"
elif [ "$1" = "quarto" ] || [ "$1" = "quarto_web" ]; then
  Rscript -e "quarto::quarto_render('.')"
elif [ "$1" = "rmd_web" ]; then
  Rscript -e "rmarkdown::render_site()"
elif [ "$1" = "spelling" ] || [ "$1" = "urls" ] || [ "$1" = "quiz_format" ]; then
  Rscript -e "ottrpal::ottr_check(check_type = '$1')"

  # Save output if we are on github
  if [ -n "$GITHUB_REPOSITORY" ]; then
    echo "error_name=$error_name" >> $GITHUB_OUTPUT 2>/dev/null
    echo "report_path=$report_path" >> $GITHUB_OUTPUT 2>/dev/null
    echo "chk_results=$chk_results" >> $GITHUB_OUTPUT 2>/dev/null
  fi
else
 echo Error: Viable options are "render_rmd", "render_quarto", "spelling", "urls", "quiz_format"
fi
