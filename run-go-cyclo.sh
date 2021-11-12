#!/usr/bin/env bash
# shellcheck disable=SC2006

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    echo "Please add `args: [-over=15]` in your pre-commit config"
    exit 1
fi

exec gocyclo "$@"
