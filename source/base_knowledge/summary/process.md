# CPUの高速化方式まとめ

| 方式                         | 内容                                                                     | 覚え方                   |
| ---------------------------- | ------------------------------------------------------------------------ | ------------------------ |
| **逐次制御方式**             | 1つの命令を最後まで処理してから、次の命令を処理する                      | 1命令ずつ                |
| **パイプライン方式**         | 命令の処理を複数の段階に分け、複数の命令を重ねて処理する                 | 処理を重ねる             |
| **スーパーパイプライン方式** | パイプラインの各段階をさらに細かく分割する                               | パイプラインを細かくする |
| **スーパースカラ方式**       | 複数のパイプラインを用意し、複数の命令を並列に処理する                   | パイプラインを複数化     |
| **分岐予測**                 | 条件分岐の結果が確定する前に、実行される可能性が高い分岐先を予測する     | 分岐先を予測             |
| **投機実行**                 | 分岐予測で予測した分岐先の命令を、分岐結果が確定する前に先行して実行する | 予測した方を先に実行     |

---

## 覚え方

逐次制御
→ 1つずつ

パイプライン
→ 重ねる

スーパーパイプライン
→ 細かくする

スーパースカラ
→ 増やす

分岐予測
→ 予測する

投機実行
→ 予測した方を先に実行する

【逐次制御方式】<br>
<br>
命令1：████████<br>
命令2：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;████████<br>
命令3：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;████████<br>

【パイプライン方式】<br>
<br>
命令1：████<br>
命令2：&nbsp;&nbsp;████<br>
命令3：&nbsp;&nbsp;&nbsp;&nbsp;████<br>
命令4：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;████<br>
<br>

【スーパーパイプライン方式】<br>
<br>
F1&nbsp;&nbsp;F2&nbsp;&nbsp;D1&nbsp;&nbsp;D2&nbsp;&nbsp;E1&nbsp;&nbsp;E2&nbsp;&nbsp;W1&nbsp;&nbsp;W2<br>
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;│<br>
└──┴──┴──┴──┴──┴──┴──┴──→<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↑<br>
&nbsp;&nbsp;&nbsp;1つのステージを細分化<br>

【スーパースカラ方式】<br>
<br>
パイプライン1：████████<br>
パイプライン2：████████<br>
パイプライン3：████████<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↑<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;パイプラインを複数化<br>

【分岐予測】<br>

             分岐
              │
        ┌─────┴─────┐
        ↓           ↓
       A             B
        ↑

「Aだろう」と予測

【投機実行】

             分岐
              │
              ↓
          Aと予測
              │
              ↓
        Aを先行実行
              │
              ↓
        結果が確定
         /        \
       Aだった    Bだった
         │          │
         ↓          ↓
      結果を利用   結果を破棄
                    ↓
                  Bを実行
