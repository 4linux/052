#!/bin/bash

IP="172.16.1.111"
PATH_KEY="$1"
USER="devops"


ssh -i "$PATH_KEY" "$USER"@"$IP" -o StrictHostKeyChecking=no

