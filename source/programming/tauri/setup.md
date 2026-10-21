# setup

1. 依存関係のインストール

```zsh
# Manjaro

sudo pacman -Syu

sudo pacman -S --needed webkit2gtk-4.1 base-devel curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 librsvg libvips nodejs npm

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "$HOME/.cargo/env"
```

2.プロジェクトのディレクトリに移動する

```zsh
npm create tauri-app@latest
```
