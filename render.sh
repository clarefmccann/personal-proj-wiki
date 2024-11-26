#!/bin/bash

# usage: ./render.sh

PROJECT_DIR="$(pwd)" 
OUTPUT_DIR="$PROJECT_DIR/docs"

if ! command -v Rscript &> /dev/null; then
  echo "error: Rscript is not installed. please install R to proceed."
  exit 1
fi

render_gitbook() {
  echo "starting Bookdown GitBook rendering..."
  Rscript -e "bookdown::render_book('$PROJECT_DIR', output_format = 'bookdown::gitbook', output_dir = 'docs')"

  if [ $? -eq 0 ]; then
    echo "GitBook rendered successfully. output is in: $OUTPUT_DIR"
  else
    echo "error: GitBook rendering failed. check the logs for details."
    exit 1
  fi
}

# Execute the rendering function
render_gitbook
