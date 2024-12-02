#!/bin/bash -xv
#SPDX-FileCopyrightText: 2024 Reo Isaka
#SPDX-License-Identifier: BSD-3-Clause


ng () {
        echo ${1}行目が違うよ
	res=1
}

res=0

### 正常な動作 ###

#あ行の確認
out=$(echo あいうえお | ./conversion)
[ "${out}" = "aiueo" ] || ng "$LINENO"

#か行の確認
out=$(echo かきくけこ | ./conversion)
[ "${out}" = "kakikukeko" ] || ng "$LINENO"

#さ行の確認
out=$(echo さしすせそ | ./conversion)
[ "${out}" = "sashisuseso" ] || ng "$LINENO"

#た行の確認
out=$(echo たちつてと | ./conversion)
[ "${out}" = "tachitsuteto" ] || ng "$LINENO"

#な行の確認
out=$(echo なにぬねの | ./conversion)
[ "${out}" = "naninuneno" ] || ng "$LINENO"

#は行の確認
out=$(echo はひふへほ | ./conversion)
[ "${out}" = "hahifuheho" ] || ng "$LINENO"

#ま行の確認
out=$(echo まみむめも | ./conversion)
[ "${out}" = "mamimumemo" ] || ng "$LINENO"

#や行の確認
out=$(echo やゆよ | ./conversion)
[ "${out}" = "yayuyo" ] || ng "$LINENO"

#ら行の確認
out=$(echo らりるれろ | ./conversion)
[ "${out}" = "rarirurero" ] || ng "$LINENO"

#わ行の確認
out=$(echo わをん | ./conversion)
[ "${out}" = "wawon" ] || ng "$LINENO"

#が行の確認
out=$(echo がぎぐげご | ./conversion)
[ "${out}" = "gagigugego" ] || ng "$LINENO"

#ざ行の確認
out=$(echo ざじずぜぞ | ./conversion)
[ "${out}" = "zajizuzezo" ] || ng "$LINENO"

#だ行の確認
out=$(echo だぢづでど | ./conversion)
[ "${out}" = "dajizudedo" ] || ng "$LINENO"

#ば行の確認
out=$(echo ばびぶべぼ | ./conversion)
[ "${out}" = "babibubebo" ] || ng "$LINENO"

#ぱ行の確認
out=$(echo ぱぴぷぺぽ | ./conversion)
[ "${out}" = "papipupepo" ] || ng "$LINENO"

#空文字の確認
out=$(echo "" | ./conversion)
[ "${out}" = "" ] || ng "$LINENO"


### 変な動作 ###

#数字が入力されたとき
out=$(echo 12345 | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#英語が入力されたとき
out=$(echo hello | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#カタカナが入力されたとき
out=$(echo コンニチハ | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#記号があるとき
out=$(echo ./ | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなと数字があるとき
out=$(echo "こんにちは12345" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなと英語があるとき
out=$(echo "こんにちはworld" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなとカタカナがあるとき
out=$(echo "こんにちはコンニチハ" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなと記号があるとき
out=$(echo "こんにちは。" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#数字とひらがながあるとき
out=$(echo "12345こんにちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#英語とひらがながあるとき
out=$(echo "worldこんにちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#カタカナとひらがながあるとき
out=$(echo "コンニチハこんにちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#記号とひらがながあるとき
out=$(echo "./こんにちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなと数字があるとき
out=$(echo "こんに12345ちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなと英語があるとき
out=$(echo "こんにworldちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなとカタカナがあるとき
out=$(echo "こんにコンニチハちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなと記号があるとき
out=$(echo "こんに，ちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"

#ひらがなと空文字があるとき
out=$(echo "こんに ちは" | ./conversion)
[ "${out}" = "エラー: 無効な文字が含まれています．" ] || ng "$LINENO"



[ "${res}" = 0 ] && echo OK
exit $res
