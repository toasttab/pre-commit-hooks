#!/bin/bash

markdownlint -f "$@"

returncode=$?
if [ $returncode -ne 0 ]; then
  echo "Markdownlint failed, or couldn't auto-fix issues"
  exit 1
fi
