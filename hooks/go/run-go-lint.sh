#!/usr/bin/env bash

failed=false

if ! which golint > /dev/null; then
    go get -u golang.org/x/lint/golint
fi

for file in "$@"; do
    # redirect stderr so that violations and summaries are properly interleaved.
    if ! golint -set_exit_status "$file" 2>&1
    then
        failed=true
    fi
done

if [[ $failed == "true" ]]; then
    exit 1
fi
