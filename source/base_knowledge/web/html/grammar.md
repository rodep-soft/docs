# html書き方&&記法まとめ

## パーツの役割

| 記法 | 役割 |
| --- | --- |
| &lt;!DOCTYPE html&gt; | この文章はHTML5規格で書かれていることを宣言するためのもの |
| &lt;html lang="ja"&gt; | 文章全体を囲む**最上位要素**""ja""でページの主言語が日本語であると示すことができる |
| &lt;head&gt; | ブラウザの画面のは直接表示されないメタデータを記述するためのもの(以下三つはこの中に記載する) |
| &lt;meta charset="UTF-8"&gt; | 文字コードを指定する |
| &lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt; | 画面幅に応じたレスポンシブ設定を行うための必須設定 |
| &lt;title&gt; | ブラウザのタブや検索結果に表示されるページタイトル |
| &lt;body&gt; | 実際にブラウザの画面上に表示されるコンテンツ（見出し、文章、画像、リンクなど）をすべて記述するエリアです |


閉じるときは例外な&lt;タグ名&gt;を用いる

## 骨組み(参考)

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ページのタイトル</title>
</head>
<body>
  <h1>大見出し</h1>
  <p>ここに本文が入ります。</p>
</body>
</html>
```
