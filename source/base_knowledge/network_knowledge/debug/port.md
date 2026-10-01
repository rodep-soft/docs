# ポートが既に使われている

1. lsofコマンドでそのポートのpid(プロセスID)を調べる

```bash
lsof -i :<port_number>
```

[lsofコマンドについて](../../../linux/cli/commands/lsof.md)

2. killする

```bash
kill <PID_number>
```

[killコマンドについて](../../../linux/cli/commands/kill.md)
