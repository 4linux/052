#!/bin/bash

WEBHOOK="https://hooks.slack.com/services/xxxxxxxxxxxxxxxx"
PARAMS="$1"

curl -s -X POST "$WEBHOOK"  \
        -H "Content-Type: application/json" \
        -H "Accept: */*" \
        -d '{"text": "'"$PARAMS"'"}'