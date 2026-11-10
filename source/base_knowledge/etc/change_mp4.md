# 変換方法

## 導入

```bash
# arch
sudo pacman -Syu
sudo pacman -S ffmpeg
```

```bash
# ubuntu系(未確認)
sudo apt update
sudo apt install ffmpeg
```

## 実行

```bash
ffmpeg -i input.mov -c:v libx264 -c:a aac -movflags +faststart output.mp4
```
