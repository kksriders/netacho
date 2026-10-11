#!/usr/bin/env bash
# 便が data/state.json を更新したあとに呼ぶ。使い方: bash scripts/push_state.sh D20261012
# state.json は Write ツールで丸ごと書かず、python で json.load → 変更 → json.dump すること
# （120KB超を一度に出力すると出力上限で止まる。2026-10 にこれで11日間停止した）
set -euo pipefail
cd "$(dirname "$0")/.."
RUN="${1:?便IDを渡してください（例 D20261012）}"
python3 -c "import json;d=json.load(open('data/state.json'));assert d['last_run']['id']=='$RUN', 'last_run.id が便IDと違う'"
git add data/state.json
git -c user.name=netacho-bin -c user.email=actions@users.noreply.github.com commit -m "state: $RUN"
for i in 1 2 3 4; do
  if git pull --rebase origin main && git push origin HEAD:main; then echo "pushed $RUN"; exit 0; fi
  sleep $((2**i))
done
echo "push失敗 $RUN" >&2; exit 1
