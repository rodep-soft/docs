# 使用方法

# 1.platformioをvscodeに導入する

vsCodeの拡張機能でplatformioを検索して追加

# 2.通常のterminalでpioのcommandsを利用できるようにする

<details>
<summary>zsh</summary>

```zsh
echo 'export PATH="$HOME/.platformio/penv/bin:$PATH"' >> ~/.zshrc

# zshでも可
source ~/.zshrc

pio --version
```

</details>

<details>
<summary>bash</summary>

```bash
echo 'export PATH="$HOME/.platformio/penv/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

pio --version
```

</details>

<details>
<summary>fish</summary>

```fish
fish_add_path "$HOME/.platformio/penv/bin"

pio --version
```

</details>
