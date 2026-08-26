# RODEP Documentation (Docs)

RODEP の技術知見・教材・仕様書をまとめたドキュメントリポジトリです。

Sphinx と MyST-Parser を使用しており、Markdown で記述されたドキュメントを静的サイトとしてビルド・公開します。

- **公開URL**: GitHub Pages (例: `https://rodep-soft.github.io/docs/`)

---

## 🛠 開発・プレビュー方法

### 前提条件
- [uv](https://docs.astral.sh/uv/) がインストールされていること

### 1. 依存関係のセットアップ
```bash
uv sync
```

### 2. ローカルでのプレビュー（ライブリロード）
ファイルを保存すると自動で再ビルド・ブラウザが更新されます。
```bash
make serve
# または
uv run sphinx-autobuild source build/html --port 8000
```
ブラウザで `http://localhost:8000` を開きます。

### 3. 静的HTMLのビルド
```bash
make html
```
`build/html/` に HTML ファイルが出力されます。

---

## ✍️ ドキュメントの追加・編集方法

1. `source/` 配下の該当カテゴリ（または新規ディレクトリ）に `.md` ファイルを作成します。
2. 必要に応じて `source/index.md` などの `toctree` に作成したファイルのパスを追記します。
3. `main` ブランチに push / merge されると、GitHub Actions により自動で GitHub Pages にデプロイされます。
