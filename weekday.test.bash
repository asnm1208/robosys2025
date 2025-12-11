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
expected="Wednesday"
[ "$out" = "$expected" ] || ng "$LINENO"


### MULTI INPUT ###
out=$(printf "2024 12 31\n2025 1 1\n" | ./weekday)
expected="Tuesday
Wednesday"
[ "$out" = "$expected" ] || ng "$LINENO"


### LEAP YEAR / NOT LEAP YEAR ###
out=$(echo "2000 2 29" | ./weekday)
expected="Tuesday"
[ "$out" = "$expected" ] || ng "$LINENO"

out=$(echo "1900 2 29" | ./weekday)
expected="invalid date"
[ "$out" = "$expected" ] || ng "$LINENO"


### MONTH BOUNDARY ###
out=$(echo "2025 12 31" | ./weekday)
expected="Wednesday"
[ "$out" = "$expected" ] || ng "$LINENO"

out=$(echo "2025 1 0" | ./weekday)
expected="invalid date"
[ "$out" = "$expected" ] || ng "$LINENO"


### INVALID INPUT ###
out=$(echo "2025 2 29" | ./weekday)
expected="invalid date"
[ "$out" = "$expected" ] || ng "$LINENO"


### FORMAT ERROR (文字列入力) ###
out=$(echo "abc def" | ./weekday 2>/dev/null)
ret=$?
[ "$ret" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"


### FORMAT ERROR（項目不足） ###
out=$(echo "2025 1" | ./weekday 2>/dev/null)
ret=$?
[ "$ret" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"


### EXTRA SPACES ###
out=$(echo "   2025    1   1  " | ./weekday)
expected="Wednesday"
[ "$out" = "$expected" ] || ng "$LINENO"


### ZERO / NEGATIVE VALUES ###
out=$(echo "0 1 1" | ./weekday)
expected="invalid date"
[ "$out" = "$expected" ] || ng "$LINENO"

out=$(echo "-1 12 1" | ./weekday)
expected="invalid date"
[ "$out" = "$expected" ] || ng "$LINENO"


### EMPTY INPUT ###
out=$(echo "" | ./weekday)
expected="invalid input"
[ "$out" = "invalid input" ]     || ng "$LINENO"


### STDERR CHECK: invalid date が stderr に出力されているか ###
err=$(echo "2025 2 29" | ./weekday 2>&1 >/dev/null)
expected="invalid date"
[ "$err" = "$expected" ] || ng "$LINENO"


[ "$res" = 0 ] && echo "OK"
exit $res
