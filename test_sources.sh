#!/usr/bin/env bash
# Quick IPTV source checker for name,url formatted lists (default: bbxx.txt)

set -euo pipefail

LIST_FILE=${1:-bbxx.txt}
MAX_HEAD_TIME=${MAX_HEAD_TIME:-5}
FFPROBE_TIMEOUT_US=${FFPROBE_TIMEOUT_US:-5000000} # 5s

if [[ ! -f "$LIST_FILE" ]]; then
  echo "List file not found: $LIST_FILE" >&2
  exit 1
fi

if command -v ffprobe >/dev/null 2>&1; then
  HAVE_FFPROBE=1
else
  HAVE_FFPROBE=0
  echo "ffprobe not found; only HTTP status will be checked." >&2
fi

while IFS=, read -r name url rest; do
  # skip blanks and comments
  [[ -z "${name}${url}" ]] && continue
  [[ "$name" =~ ^# ]] && continue
  [[ "$url" != http* ]] && continue

  echo ">> $name"
  code=$(curl -I --max-time "$MAX_HEAD_TIME" -o /dev/null -w "%{http_code}" "$url" || echo "000")
  if [[ "$code" =~ ^[0-9]+$ ]] && (( code >= 200 && code < 400 )); then
    if [[ $HAVE_FFPROBE -eq 1 ]]; then
      if ffprobe -v error -stats -timeout "$FFPROBE_TIMEOUT_US" -i "$url" -show_streams -of json >/dev/null; then
        echo "HTTP $code; ffprobe: OK"
      else
        echo "HTTP $code; ffprobe: FAIL"
      fi
    else
      echo "HTTP $code"
    fi
  else
    echo "HTTP fail: $code"
  fi
done < "$LIST_FILE"
