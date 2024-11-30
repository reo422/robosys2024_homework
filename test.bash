#!/bin/bash -xv
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

out=$(echo かきくけこ | ./conversion)
[ "${out}" = "kakikukeko" ] || ng "$LINENO"

out=$(echo さしすせそ | ./conversion)
[ "${out}" = "sashisuseso" ] || ng "$LINENO"

out=$(echo たちつてと | ./conversion)
[ "${out}" = "tachitsuteto" ] || ng "$LINENO"

out=$(echo なにぬねの | ./conversion)
[ "${out}" = "naninuneno" ] || ng "$LINENO"

out=$(echo はひふへほ | ./conversion)
[ "${out}" = "hahifuheho" ] || ng "$LINENO"

out=$(echo まみむめも | ./conversion)
[ "${out}" = "mamimumemo" ] || ng "$LINENO"

out=$(echo やゆよ | ./conversion)
[ "${out}" = "yayuyo" ] || ng "$LINENO"

out=$(echo らりるれろ | ./conversion)
[ "${out}" = "rarirurero" ] || ng "$LINENO"

out=$(echo わをん | ./conversion)
[ "${out}" = "wawon" ] || ng "$LINENO"


### 変な動作 ###
out=$(echo 12345 | ./conversion)
[ "${out}" = "12345" ] || ng "$LINENO"

out=$(echo あ123い | ./conversion)
[ "${out}" = "a123i" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
