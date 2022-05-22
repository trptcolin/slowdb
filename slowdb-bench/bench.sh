#!/usr/bin/env bash

script_name=$0
script_dir=$(dirname "$0")

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  echo 1>&2 "Usage: bench.sh PATH_TO_SQLITE_EXECUTABLE"
  exit 2
fi

sql_executable_path=$1

cat "$script_dir/sample.sql" | while read line; do
  echo "Running: '$line'"
  start_time="$(gdate -u +%s.%N)"
  echo "$line" | $sql_executable_path /tmp/fun.db
  end_time="$(gdate -u +%s.%N)"
  elapsed="$(bc <<<"$end_time-$start_time" | awk '{printf "%f", $0}')"
  echo "previous command took $elapsed seconds"
done
