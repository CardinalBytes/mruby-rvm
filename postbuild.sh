#!/bin/bash
search_dir="src/rubies"
build_dir="build"
compiler="./vendor/mruby/bin/mrbc"

echo "postbuild tasks ran at $(date)"

echo "copy of the rubies"

for entry in "$search_dir"/*.rb; do
  echo "copy ruby_file: $entry"
  cp "$entry" "$build_dir"
done

for item in "$build_dir"/*.rb; do
    echo "compile $item"
    "$compiler" "$item"
    rm "$item"
done
