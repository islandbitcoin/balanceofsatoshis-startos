#!/bin/bash

bos peers &>/dev/null
RES=$?
if test "$RES" != 0; then
    echo "Connection to lnd not responding" >&2
    exit 1
fi
