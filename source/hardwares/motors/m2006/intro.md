# m2006のsetup

## 1. エンコーダーの種類を設定

1. VESC ToolでVESCに接続する。
2. 「Motor Settings → General → Sensors」を開く。
3. 「Sensor Port Mode」を「Sin/Cos Encoder」に変更する。
4. 右側の「Write Motor Configuration（↓ M）」で書き込む。

## 2. エンコーダー信号のキャリブレーション

振幅・オフセットはモーターごとに異なるため、使用するモーターで測定する。

1. 「VESC Dev Tools → LispBM Scripting」を開く。
2. 「Examples」から「encoder_sincos_cal.lbm」を選択する。
3. 上部の「Upload」でスクリプトを書き込む。
4. 「Poll All」にチェックを入れる。
5. 「raw-sin」「raw-cos」を選び、「Binding Plot」で波形を確認する。
6. モーターをゆっくり回転させ、両方の信号が変化することを確認する。
7. 複数回転させ、振幅・オフセットの計算値が安定するまで測定する。

「Motor Settings → General → Sensors」の
「Sin/Cos Encoder」欄に、測定値を入力する。

| スクリプトの測定項目 | 入力する設定項目 |
| --- | --- |
| s-amp | Sine Amplitude |
| c-amp | Cosine Amplitude |
| s-ofs | Sine Offset |
| c-ofs | Cosine Offset |
| Sin/cos Filter Constant|

入力後、「Write Motor Configuration（↓ M）」で書き込む。

測定した値は、モーターの識別名と対応させて記録する。
別のモーターに交換した場合は再測定する。

## 3. FOCのエンコーダー設定

測定中はモーターの周りに何もないことを確認する。

1. 「Motor Settings → FOC → General」を開く。
2. 「Sensor Mode」を「Encoder」に変更する。
3. 「RL」で抵抗・インダクタンスを測定する。
4. 「λ」で磁束鎖交数を測定する。
5. 測定成功後、「Apply」で結果を反映する。
6. エンコーダーの検出成功を確認し、「Apply Encoder」で反映する。
   未検出のエラーが出る場合は、エンコーダー検出を実施する。
7. 「Write Motor Configuration（↓ M）」で書き込む。

## 4. 電流・回転数制限の変更

### 電流制限

操作場所：
「Motor Settings → General → Current」

以下の値に変更した。

| 設定項目 | 設定値 |
| --- | --- |
| Motor Current Max | 1 A |
| Motor Current Max Brake | -1 A |

### 回転数制限

操作場所：
「Motor Settings → General → RPM」

以下の値に変更した。

| 設定項目 | 設定値 |
| --- | --- |
| Max ERPM | 126000 |

m2006のMax ERPMは500(物理的なモーターの回転数) * 7(対極数) * 36(減速比)で求まる。

※物理的なモーターの回転数は無負荷状態なことに注意すること！

変更後、「Write Motor Configuration（↓ M）」で書き込み、
「Read Motor Configuration」で読み直して保存値を確認する。

## 5. XMLファイルの保存

VESCから設定を読み出した後、Fileメニューから保存する。

- 「Save Motor Configuration XML as…」
  → config/vesc/m2006_motor.xml
- 「Save App Configuration XML as…」
  → config/vesc/m2006_app.xml

XMLはVESC Toolから出力したものをそのまま保存する。
複数台分を保存する場合は、ファイル名にモーターの識別名を付ける。


```{toctree}
:maxdepth: 1
:glob:
:hidden:

```
