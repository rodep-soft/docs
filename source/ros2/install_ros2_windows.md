# ros2 install windows

powershellを用いる

## 1.ディレクトリ作成

```powershell
 md C:\dev
 cd C:\dev
```

## 2. ROS Lyrical Luth の Download

[ROS2 Lyrical luth - patch release 2](https://github.com/ros2/ros2/releases#release-release-lyrical-20260807)

上記サイトからros2-lyrical-2026-08-07-windows-AMD64.zipをDownload

## 3. 展開

```powershell
Expand-Archive "$env:USERPROFILE\Downloads\ros2-lyrical-2026-08-07-windows-AMD64.zip" -DestinationPath C:\dev
```

## 4. 展開したディレクトリ名をlyricalに変更

```powershell
 Rename-Item C:\dev\ros2-windows C:\dev\lyrical
```

## 5.pixiのinstall

```powershell
# pixi download
 powershell -ExecutionPolicy ByPass -c "irm -useb https://pixi.sh/install.ps1 | iex"

# 現在のターミナル上でpixiを使えるようにする
 $env:Path += ";$env:USERPROFILE\.pixi\bin"

# 確認
 pixi --version
```

## 6.pixi install

```powershell
  cd  C:.\lyrical\
  pixi install
```

## 7.preinstall setup script

```powershell
  pixi run python preinstall_setup_windows.py

# 権限を一時的に指定して付与(違うターミナル上なら実行不要)
  powershell -ExecutionPolicy Bypass -Command "pixi shell"

# cmdに入る
  cmd

# pixi環境に入る
  pixi shell

# 実行(実行時に出るDDS関連のログは正常)
  call C:\dev\lyrical\local_setup.bat

```

## 8. 確認

別のターミナルで実行する

```powershell
  ros2 run demo_nodes_cpp talker
```

```powershell
  ros2 run demo_nodes_py listener
```

## setup

```powershell
    cmd
    cd C:\dev\lyrical
    pixi shell
    call C:\dev\lyrical\local_setup.bat
```

# 参考

[ros2 lyrical document](https://docs.ros.org/en/lyrical/Get-Started/Installation/Windows-Install-Binary.html#id12)

[ros2 lyrical install zip](https://github.com/ros2/ros2/releases#release-release-lyrical-20260807)
