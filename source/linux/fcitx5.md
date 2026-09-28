# 日本語環境の導入

## fcitx5の導入

まずfcitx5&mozcを導入します

<details>

<summary>ubuntu</summary>

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install fcitx5 fcitx5-mozc im-config -y
im-config -n fcitx5
```

</details>

<details>

<summary>arch</summary>

```bash
sudo pacman -Syu
sudo pacman -S fcitx5-im fcitx5-mozc fcitx5-configtool
```

</details>

## configtoolを用いた導入

terminalで以下のコマンドを実行し設定してください

```bash
fcitx5-configtool
```

1. GUIツールに入る
2. キー配置を設定する
3. mozcと検索する
4. 終了

これで導入が完了します

### 参考

[fcitx5_arch_pkg](https://archlinux.org/packages/extra/x86_64/fcitx5/)
[fcitx5_configtool_arch-pkg](https://archlinux.org/packages/extra/x86_64/fcitx5-configtool/)
[fcitx5_mozc_arch_pkg](https://archlinux.org/packages/extra/x86_64/fcitx5-mozc/)
