# usbのつなげ方

**これは下記のリポジトリの個人的な記事であります。**

[リポジトリリンク](https://github.com/dorssel/usbipd-win)

## 導入

まずはpowershell上で以下のコマンドを入力します。<br>
そして権限を許可するとinstallが成功したというログが表示されたらokです。成功したらターミナルを再起動させる必要があります。

```powershell
winget install usbipd
```

## 使い方(接続方法など)

1. helpの確認

```powershell
usbipd --help
```

2. 接続されたusbの確認

```powershell
usbipd list
```

3. bindする(管理者権限必須)

BUSIDはusbipd listを実行すると表示されます

```powershell
usbipd bind --busid=<BUSID>
```
