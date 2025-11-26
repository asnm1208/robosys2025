# robosys2025
本リポジトリは千葉工業大学 未来ロボティクス学科 2025年度 ロボットシステム学内で行った内容に基づいて作成された練習用リポジトリです。

[README](https://github.com/asnm1208/robosys2025/blob/main/README.md)は、[akajaika](https://github.com/akajaika)の[robosys2024](https://github.com/akajaika/robosys2024/blob/main/README.md)(© 2024 Kai Nonaka)を参考に作られています。
# weekday
## 概要
Zellerの公式を用いて、入力された日付の曜日を判定するコマンドです。  
![CI](https://github.com/asnm1208/robosys2025/actions/workflows/test.yml/badge.svg)

## テスト環境
OS            : Ubuntu 24.04.3 LTS / Windows 11  
python-version: 3.7 ~ 3.12  
確認環境      : Ubuntu 24.04.3 LTS + GitHub Actions (CI)

## インストール方法
下記のコマンドを使用し、クローンを行ってください。  

```shell
$ git clone https://github.com/asnm1208/robosys2025.git
$ cd robosys2025
```

## 使い方
標準入力から以下の形式で日付を与えます。

```
MMMM YY DD
```

実行例

```shell
$ echo "2025 1 1" | ./weekday.py
 Wednesday
```

複数行にも対応しています。

```shell
$ printf "2025 1 1\n2024 2 29\n" | ./weekday.py
 Wednesday
 Thursday
```

## 入力仕様
- 年: 1 以上の整数  
- 月: 1〜12  
- 日: 各月の暦に従う（閏年判定あり）  

不正な日付は以下のように出力されます。    

- 範囲外の日付    : `invalid date`  
- フォーマット不正: なし  
- 入力なし        : Usage表示

## 著作権・ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- [README](https://github.com/asnm1208/robosys2025/blob/main/README.md)は、[akajaika](https://github.com/akajaika)の[robosys2024](https://github.com/akajaika/robosys2024/blob/main/README.md)(© 2024 Kai Nonaka)を参考に作られています。
- © 2025 asnm1208
