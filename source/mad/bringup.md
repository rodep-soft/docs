# セットアップ方法

##

### 1.コントローラーのスティックを用意する(e.g.HW-504)

**はっきりいいますがなくてもいけます**

`{image} ../../images/HW-504.webp
:width: 500px
:height: 300px
:align: center

````

### 2.ジャンパピンをつけていきます

```{image} ../../images/controller.webp
:width: 500px
:height: 300px
:align: center
````

反対で分かりづらいですがこのセットアップで必要なものは、**GND**、**5V**、**y**、3つがあればできます。
画像はそのうち訂正します。

そしてmad_motorとGNDは共通にします。

yのみanalogにつなぎほかはdigitalですがmad_motorは**チルダの付いたdigitalピンにつける必要があります**
(PWMを使うため)

```{image} ../../images/arduino.webp
:width: 500px
:height: 300px
:align: center
```

画像はモーターの回転が強すぎて荒れてますが参考までに。

### 3.キャリブレーションをする

ここでキャリブレーションをします。
このモーターのキャリブレーションは特殊で以下の手順を踏まなければなりませんが、強制的に読み込ませることもできる気がします。
中の人はplatformioを使っているので#include<Arduino.h>がありますがarduinoIDEはいりません。

<details>

<summary>コントローラーなし.version</summary>

※動作確認をしていない

```cpp

#include <Arduino.h>
#include <Servo.h>

Servo esc;

const int ESC_PIN = 9;

// テストするPWM範囲
const int ESC_MIN = 1000;
const int ESC_MAX = 2000;

void setup() {

    Serial.begin(115200);

    // ESC信号を開始
    esc.attach(ESC_PIN, 900, 2100);

    // 最初は必ず最小
    esc.writeMicroseconds(ESC_MIN);

    Serial.println();
    Serial.println("================================");
    Serial.println(" AMPX 30A ESC CALIBRATION TEST");
    Serial.println("================================");
    Serial.println();

    // 設定値を表示
    Serial.print("ESC PIN  = ");
    Serial.println(ESC_PIN);

    Serial.print("MIN PWM  = ");
    Serial.print(ESC_MIN);
    Serial.println(" us");

    Serial.print("MAX PWM  = ");
    Serial.print(ESC_MAX);
    Serial.println(" us");

    Serial.println();
    Serial.println("コントローラー不要");
    Serial.println();
    Serial.println("手順:");
    Serial.println("1. ArduinoをUSB接続");
    Serial.println("2. ESCの電源はまだ入れない");
    Serial.println("3. 'c' を送信");
    Serial.println("4. ESCの電源を入れる");
    Serial.println("5. 2回の短いBeepを待つ");
    Serial.println("6. 'l' を送信");
    Serial.println();

    Serial.print("現在の信号: ");
    Serial.print(ESC_MIN);
    Serial.println(" us");

    Serial.println();
}

void loop() {

    if (Serial.available()) {

        char command = Serial.read();

        // =================================
        // キャリブレーション開始
        // =================================
        if (command == 'c' || command == 'C') {

            Serial.println();
            Serial.println("=== CALIBRATION START ===");
            Serial.println();

            // 最大スロットルを送信
            esc.writeMicroseconds(ESC_MAX);

            Serial.print("ESC SIGNAL = ");
            Serial.print(ESC_MAX);
            Serial.println(" us");

            Serial.println();
            Serial.println(">>> ESCの電源を入れてください <<<");
            Serial.println();
            Serial.println("2回の短いBeepを待っています...");
            Serial.println("Beep後に 'l' を送信してください");
            Serial.println();

            // 最大信号を維持
            while (true) {

                if (Serial.available()) {

                    char input = Serial.read();

                    if (input == 'l' || input == 'L') {
                        break;
                    }
                }

                delay(10);
            }

            // =================================
            // 最小スロットル
            // =================================

            Serial.println();
            Serial.println("=== MINIMUM THROTTLE ===");

            esc.writeMicroseconds(ESC_MIN);

            Serial.print("ESC SIGNAL = ");
            Serial.print(ESC_MIN);
            Serial.println(" us");

            Serial.println();
            Serial.println("3秒間この信号を維持します...");

            delay(3000);

            Serial.println();
            Serial.println("================================");
            Serial.println(" CALIBRATION COMPLETED");
            Serial.println("================================");
            Serial.println();

            Serial.print("MIN = ");
            Serial.print(ESC_MIN);
            Serial.println(" us");

            Serial.print("MAX = ");
            Serial.print(ESC_MAX);
            Serial.println(" us");

            Serial.println();
            Serial.print("ESC信号は現在 ");
            Serial.print(ESC_MIN);
            Serial.println(" us です");

            Serial.println();
        }
    }
}
```

</details>

<details>

<summary>コントローラを使う.version</summary>

```cpp
#include <Arduino.h>
#include <Servo.h>

Servo esc;

const int ESC_PIN = 9;//mad_motorのPWMを吐くpin
const int VRY = A1;//yの出力をするピンの番号

const int JOY_MIN = 0;
const int JOY_MAX = 1023;

const int ESC_MIN = 1000;//pwm最小値
const int ESC_MAX = 2000;//pwm最大値

void setup() {
    Serial.begin(115200);

    esc.attach(ESC_PIN, 900, 2100);

    // 起動時は最小
    esc.writeMicroseconds(ESC_MIN);

    delay(2000);

    Serial.println("=== Y AXIS PWM TEST ===");
}

void loop() {

    int y = analogRead(VRY);

    int pwm = map(
        y,
        JOY_MIN,
        JOY_MAX,
        ESC_MIN,
        ESC_MAX
    );

    pwm = constrain(pwm, ESC_MIN, ESC_MAX);

    esc.writeMicroseconds(pwm);

    Serial.print("Y = ");
    Serial.print(y);

    Serial.print("    PWM = ");
    Serial.println(pwm);

    delay(50);
}
```
