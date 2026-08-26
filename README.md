# Documentation

個人的な知見まとめとそれをdeployするためのrepo.

Sphinx, MyST-Parserを使用. ドキュメントはMarkdownで記述する.

[Github Pages URL](https://rodep-soft.github.io/docs/)

---

## Dev

`uv`必須.

### Command

```bash
# 依存解決
uv sync

# Preview
make serve

# build html
make html
```

---

## Edit

1. `source/`配下に`.md`を作成
2. 必要に応じて`toctree`に作成したファイルパスを追記
3. `main`ブランチにpush/mergeすると自動でPagesにデプロイ