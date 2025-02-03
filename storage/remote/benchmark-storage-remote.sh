#!/usr/bin/env bash

set -Eeuxo pipefail

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <count> <output_file>"
  exit 1
fi

# Assign arguments to variables
COUNT=$1
OUTPUT_FILE=$2

# Run the benchmark with the specified count and output to the file
go test \
  -v \
  -test.bench='^\QBenchmarkBuildV2WriteRequest\E$' \
  -test.run='^$' \
  -test.benchmem \
  -test.timeout=60m \
  -test.count="$COUNT" \
  ./... | tee -a "$OUTPUT_FILE"

