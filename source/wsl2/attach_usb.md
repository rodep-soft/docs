# windowsに接続したUSB デバイスにwsl2 からアクセスできるように認識させる

## コマンドのインストール
``` bash
winget install --interactive --exact dorssel.usbipd-win
```

## バスに接続されたUSB デバイスの一覧を表示する
``` bash
usbipd list
```
`STATE` が`Not shared` のデバイスは wsl から認識できない

# バスに接続されたUSB をwslにつなぐ一連の操作
``` bash
usbipd bind busid <bus-id>
```
``` bash
usbipd bind busid <bus-id> 
```
``` bash 
usbipd attach --wsl --busid <bus-id>
```
<bus-id>の部分はusbipd listで表示されたBUSIDをそのまま入力する
例）1-1

# 接続成功の確認
もう一度 `usbipd list`を実行して`STATE`が`Shared`であればよい
もしくは，
wsl2側で`lsusb` で対象のデバイスが表示されればok


