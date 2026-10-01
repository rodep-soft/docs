# ポートが既に使われている

1. lsofコマンドでそのポートのpid(プロセスID)を調べる

```bash
lsof -i :<port_number>
```

2. killする

```bash
kill <PID_number>
```
