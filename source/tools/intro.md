# ツール・開発環境

開発効率を高めるためのツール選定と運用プラクティス。Git、Docker、WSL2、CI/CDなど日常の開発を支える基盤をまとめている。

| 記事 | 概要 |
|---|---|
| [Git](git/intro.md) | ブランチ運用、リベース、Hooks、トラブルシューティングなどチーム開発の実践。 |
| [Docker](docker/intro.md) | ロボット開発におけるDockerベストプラクティスと活用法。 |
| [CI/CD ワークフロー](cicd_workflows.md) | GitHub Actions を活用したビルド・テスト・デプロイの自動化。 |
| [Dev Container 活用](devcontainer_advanced.md) | VS Code Dev Containers を用いた統一開発環境の構築。 |
| [WSL2 ベストプラクティス](wsl2_best_practices.md) | Windows 上での Linux 開発環境構築とハードウェアパススルー。 |
| [Proxmox VE](proxmox.md) | 自宅・研究室サーバでの仮想化環境構築と運用。 |

```{toctree}
:maxdepth: 1
:glob:
:hidden:

*
docker/intro
git/intro
```
