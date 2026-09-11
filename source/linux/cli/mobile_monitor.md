# Mobile Monitor使い方

## ASUS ZenScreenについて

[ZenScreen](https://www.asus.com/displays-desktops/monitors/zenscreen/)

`ASUS`が出しているモバイルモニター. USB Type-C経由でPCと接続することができる. Windows/macOS/Linux対応.

## 接続

Linux/Windows PCとモニターをType-cケーブルで接続する. PC側はType-Aで問題ない(C to A).

### CAUTION

たまにデータ転送に対応していないケーブルがあるので注意

## Linuxでの設定

ここではLinuxでモニターを使う際の設定を解説する.

PC側で映像出力ができないポートに接続している場合、`DisplayLink`を使う必要がある. その際、ドライバが必要なので公式サイトから入手する.

[ドライバ入手サイト](https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu)

`Ubuntu`を使用している場合は上記サイトを参考. `Archlinux`を使用している際は以下手順で導入可能.

```bash
# linux headerのインストール
# zen kernelの場合はlinux-zen-headers
$ sudo pacman -S linux-headers

# AUR helperでドライバをインストール
# yay or paru
$ paru -S displaylink

# DisplayLinkデーモンを登録&起動
$ sudo systemctl enable --now displaylink.service

# kernel moduleをload
$ sudo modprobe evdi

# check
$ lsmod | grep evdi

# 確認できたら、自動設定
$ echo "evdi" | sudo tee /etc/modules-load.d/evdi.conf
```

手順を終えたら、PCを再起動 or USB再接続

例えばGnomeのDisplay設定で画面が増えていたら成功.
