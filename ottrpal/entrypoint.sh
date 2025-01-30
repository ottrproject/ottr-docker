#!/bin/sh

Rscript -e "ottrpal::ottr_check(check_type = '$1', path = '$2')"

# Save output
echo "error_name=$error_name" >> $GITHUB_OUTPUT
echo "report_path=$report_path" >> $GITHUB_OUTPUT
echo "chk_results=$chk_results" >> $GITHUB_OUTPUT
