#!/bin/bash
set -euo pipefail

if ! pgrep -x niri >/dev/null; then
  echo '{"text":"N/A","tooltip":"Niri not running"}'
  exit 0
fi

WINDOWS_JSON="$(niri msg -j windows 2>/dev/null || true)"
WORKSPACES_JSON="$(niri msg -j workspaces 2>/dev/null || true)"
FOCUSED_WINDOW_JSON="$(niri msg -j focused-window 2>/dev/null || true)"

if [[ -z "${WINDOWS_JSON}" || -z "${WORKSPACES_JSON}" ]]; then
  echo '{"text":"...","tooltip":"Waiting for Niri..."}'
  exit 0
fi

ACTIVE_WS_ID="$(
  echo "$WORKSPACES_JSON" | jq -r '.[] | select(.is_focused == true) | .id // empty' | head -n1
)"
[[ -z "${ACTIVE_WS_ID}" ]] && ACTIVE_WS_ID=""

FOCUSED_WIN_ID="$(
  echo "${FOCUSED_WINDOW_JSON:-}" | jq -r 'if type=="object" then (.id // empty) else empty end' 2>/dev/null | head -n1
)"

WINDOW_ICONS="$(
  echo "$WINDOWS_JSON" | jq -r --argjson ws_id "${ACTIVE_WS_ID:-0}" --arg fw "${FOCUSED_WIN_ID:-}" '
    [
      .[]
      | select(.workspace_id == $ws_id)
      | if (.is_focused == true) or ($fw != "" and (.id|tostring) == $fw)
        then "▮"
        else "▯"
        end
    ] | join("")
  '
)"

if [[ -n "$WINDOW_ICONS" ]]; then
  TEXT="$WINDOW_ICONS"
else
  TEXT=""
fi

TOOLTIP="Windows: ${#WINDOW_ICONS}"
echo "{\"text\":\"${TEXT}\",\"tooltip\":\"${TOOLTIP}\"}"
