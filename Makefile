# Makefile for RODEP Docs
.DEFAULT_GOAL := help

# Variables
UV           ?= uv
SPHINXBUILD  ?= $(UV) run sphinx-build
SPHINXAUTO   ?= $(UV) run sphinx-autobuild
SOURCEDIR    = source
BUILDDIR     = build
PORT         ?= 8000

.PHONY: help setup html build build-all serve preview linkcheck fmt format lint clean clean-all

## help: 利用可能なコマンド一覧を表示
help:
	@echo "RODEP Docs - Development Commands:"
	@echo ""
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' | sed -e 's/^/ /'
	@echo ""

## setup: 依存関係をインストール & Git hooksを設定
setup:
	$(UV) sync
	$(UV) run pre-commit install

## fmt: 全ファイルを自動整形 (pre-commit / ruff)
fmt:
	$(UV) run pre-commit run --all-files

## format: fmtのエイリアス
format: fmt

## lint: コードおよび設定ファイルのリントチェック
lint:
	$(UV) run ruff check .


## build: HTMLドキュメントをビルド
build:
	$(SPHINXBUILD) -M html $(SOURCEDIR) $(BUILDDIR) -W

## html: buildのエイリアス
html: build

## build-all: キャッシュを破棄して全ファイルをフルビルド
build-all:
	$(SPHINXBUILD) -M html $(SOURCEDIR) $(BUILDDIR) -E -a -W

## serve: ローカルプレビューサーバを起動 (ホットリロード対応)
serve:
	$(SPHINXAUTO) $(SOURCEDIR) $(BUILDDIR)/html --port $(PORT) --open-browser --watch $(SOURCEDIR)

## preview: serveのエイリアス
preview: serve

## linkcheck: 内部・外部リンクのデッドリンクをチェック
linkcheck:
	$(SPHINXBUILD) -b linkcheck $(SOURCEDIR) $(BUILDDIR)/linkcheck

## clean: ビルド成果物 (build/) を削除
clean:
	rm -rf $(BUILDDIR)

## clean-all: ビルド成果物と仮想環境 (.venv/) を完全削除
clean-all: clean
	rm -rf .venv
