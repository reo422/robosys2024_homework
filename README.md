# ヘボン式ローマ字変換

![Build Status](https://github.com/reo422/robosys2024_homework/actions/workflows/test.yml/badge.svg)

# 概要
ひらがなをヘボン式ローマ字に変換します．
例えば，ひらがなで書かれた日本語の文章をローマ字で表記したい時に役立ちます．

# 入力可能なひらがな
ローマ字に変換するには，以下のひらがなが対応しています．

　　あいうえお かきくけこ さしすせそ たちつてと なにぬねの はひふへほ

　　まみむめも やゆよ らりるれろ わをん がぎぐげご ざじずぜぞ

　　だぢづでど ばびぶべぼ ぱぴぷぺぽ

例:あしたのてんきははれです

入力に無効な文字（ひらがな以外の文字，数字，記号）が含まれている場合，エラーメッセージを出力して終了します．

# 使用方法

```bash
$ git clone https://github.com/reo422/robosys2024_homework.git
$ cd robosys2024_homework
$ echo おはよう | ./conversion
ohayou

$ ./conversion
あしたのてんきははれです.
ashitanotenkihaharedesu.

$ echo こんにちはworld | ./conversion
エラー: 無効な文字が含まれています. 
```
# 必要なソフトウェア
・Python - テスト済み: 3.7~3.11

# テスト環境
・Ubuntu 20.04

# ライセンスと著作権
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

© 2024 Reo Isaka
