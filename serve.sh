#!/bin/bash

# usage: ./serve_bookdown.sh

PROJECT_DIR="$(pwd)"  
OUTPUT_DIR="$PROJECT_DIR/_book"

if ! command -v Rscript &> /dev/null; then
  echo "Error: Rscript is not installed. Please install R to proceed."
  exit 1
fi

serve_gitbook() {
  echo "Starting Bookdown GitBook serving..."
  Rscript -e "bookdown::serve_book(dir = '$PROJECT_DIR', output_dir = '$OUTPUT_DIR', preview = TRUE, in_session = TRUE, quiet = FALSE)"

  if [ $? -eq 0 ]; then
    echo "GitBook is being served. Access it in your browser."
  else
    echo "Error: GitBook serving failed. Check the logs for details."
    exit 1
  fi
}

# Execute the serving function
serve_gitbook
