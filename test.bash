#!/bin/bash
#SPDX-FileCopyrightText: 2024 Reo Isaka
#SPDX-License-Identifier: BSD-3-Clause


ng () {
        echo ${1}行目が違うよ
	res=1
}

res=0

### 正常な動作 ###
out=$(echo あいうえお | ./conversion)
[ "${out}" = "aiueo" ] || ng "$LINENO"

### 変な動作 ###
out=$(echo 12345 | ./conversion)
[ "${out}" = "12345" ] || ng "$LINENO"

out=$(echo あ123い | ./conversion)
[ "${out}" = "a123i" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
