#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 asnm1208 <otomo6475@gmail.com>
# SPDX-License-Identifier: GPL-3.0-only

import sys

WEEK_NAMES = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

def is_leap_year(y: int) -> bool:
    return (y % 4 == 0 and y % 100 != 0) or (y % 400 == 0)

def is_valid_date(y: int, m: int, d: int) -> bool:
    if y <= 0:
        return False
    if m < 1 or m > 12:
        return False
    if d < 1:
        return False
    mdays = [31, 29 if is_leap_year(y) else 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return d <= mdays[m - 1]

def zeller_weekday(y: int, m: int, d: int) -> int:
    if m <= 2:
        m += 12
        y -= 1
    q = d
    K = y % 100
    J = y // 100
    h = (q + (13 * (m + 1)) // 5 + K + K // 4 + J // 4 + 5 * J) % 7
    return h

def format_date(y: int, m: int, d: int) -> str:
    return f"{y:04d}-{m:02d}-{d:02d}"

def process_line(line: str):
    line = line.strip()
    if not line:
        return
    parts = line.split()
    if len(parts) < 3:
        print(f"ERROR: 入力は 'YYYY M D' の形式で1行に1件指定してください: '{line}'")
        return 1
    try:
        y = int(parts[0])
        m = int(parts[1])
        d = int(parts[2])
    except ValueError:
        print(f"ERROR: 年/月/日は整数で指定してください: '{line}'")
        return 1

    date_str = format_date(y, m, d)
    if not is_valid_date(y, m, d):
        print(f"invalid date")
        return 0

    h = zeller_weekday(y, m, d)
    weekday_en = WEEK_NAMES[h]
    print(f" {weekday_en}")

def main():
    data = sys.stdin.read().strip().splitlines()
    if not data:
        print("Usage: 標準入力から 'YYYY M D' を1行に1件で与えてください。複数行を受け付けます。")
        print("例:\n2025 1 1\n2100 2 29\n(EOFで実行)")
        return 0
    for line in data:
        process_line(line)

if __name__ == "__main__":
    main()
