# grep

grepは基本的にはパイプを用いて任意の単語のみを抽出したりするときに使います。

```bash
# example
lsmod | grep -i sc230ai
```

## 使ったオプション


- -i  :大文字と小文字に関係なくhitするようになります。
- -A N:指定された文字の後ろN行も表示します。
- -B N:指定された文字の前N行も表示します。
- -C N:指定された文字の前後N行を表示します。
- -R  :指定したディレクトリ以下に該当する文字があるかどうかを探します。
- -E  :拡張正規表現を使いたいときに使います。
- -n  :行番号を表示します。
- -l  :当てはまるファイル名のみ表示します。

※Nは正の整数

## -R(-r)の構文

```bash
# grep -R "任意の文字" 指定のディレクトリ
grep -R "example" .
```

## -Eの構文

or検索をしたいときに使う

```bash
grep -E "error|false|failed" access.log
```
## -n

```bash
# example
#入力
grep -n "error" app.log

#出力
42: [2026-10-19 12:00:00] error: failed to connect
105: [2026-10-19 12:05:12] error: retry failed
```

# -l

```bash
#example
# logs ディレクトリ配下で "ERROR" が1回でも出たファイル名だけを抽出
grep -l -R "ERROR" ./logs/

#出力
./logs/app.log
./logs/db.log
```
