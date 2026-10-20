# ポートが既に使われている

1. lsofコマンドでそのポートのpid(プロセスID)を調べる

```bash
sudo lsof -i :<port_number>
```

[lsofコマンドについて](../../../linux/cli/commands/ss_and_lsof.md)

```bash
sudo ss -plunt | grep <port_number>
```

2. killする

```bash
kill <PID_number>
```

[killコマンドについて](../../../linux/cli/commands/kill_and_pkill.md)
