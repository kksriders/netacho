# げんチャんねる ネタ帳
企画ネタ収集システムのネタ帳サイト。
- ページ: https://kksriders.github.io/netacho/
- 状態データの正: data/state.json（2026-10-11 から。毎日便・土曜便が直接 push する。Drive の netacho_state は使わない）
- 便の保存: `bash scripts/push_state.sh <便ID>`
- 仕分けデータ: data/sorting/ (ページの[反映する]から書き込み)
- ソース登録: data/sources/ (ページの[鉄板に追加]/[外す]から書き込み)

旧方式（Drive → GitHub Actions sync-state.yml で30分ごとに取り込み）は 2026-10-11 に廃止。
state が120KBを超え、便が Drive に書き出せなくなったため（10/1〜10/10 停止）。
