# Documentation

個人的な知見まとめとそれをdeployするためのrepo.

Sphinx, MyST-Parserを使用. ドキュメントはMarkdownで記述する.

[Github Pages URL](https://rodep-soft.github.io/docs/)

---

## Dev

`uv`必須.

### Commands

```bash
# 初回セットアップ (依存関係 + pre-commitフック登録)
make setup

# ローカルプレビュー (ホットリロード)
make serve

# HTMLビルド
make build

# 自動整形 (フォーマッタ / リンタ一括実行)
make fmt

# コマンド一覧の確認
make help
```

---

## Edit

1. `source/`配下に`.md`を作成
2. 必要に応じて`toctree`に作成したファイルパスを追記
3. `main`ブランチにpush/mergeすると自動でPagesにデプロイ
