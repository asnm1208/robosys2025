#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 asnm1208 <otomo6475@gmail.com>
# SPDX-License-Identifier: GPL-3.0-only

ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0

### NORMAL INPUT ###
out=$(echo "2025 1 1" | ./weekday)
expected=" Wednesday"
[ "$out" = "$expected" ] || ng "$LINENO"

### INVALID INPUT ###
out=$(echo "2025 2 29" | ./weekday)
expected="invalid date"
[ "$out" = "$expected" ] || ng "$LINENO"


### FORMAT ERROR ###
out=$(echo "abc def" | ./weekday 2>/dev/null)
ret=$?
[ "$ret" = 1 ]      || ng "$LINENO"
[ "$out" = "" ]     || ng "$LINENO"


### EMPTY INPUT ###
out=$(echo "" | ./weekday)
ret=$?
[ "$ret" = 0 ]       || ng "$LINENO"
[ "$out" != "" ]     || ng "$LINENO"


[ "$res" = 0 ] && echo "OK"
exit $res
