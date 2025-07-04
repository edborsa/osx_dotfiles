#!/usr/bin/env bash
set -euo pipefail

HISTFILE="${HOME}/.zsh_history"
BACKUP="${HISTFILE}.$(date +%Y%m%d_%H%M%S).bak"
TMPFILE="$(mktemp)"

echo "Backing up  ${HISTFILE} → ${BACKUP}"
cp -- "${HISTFILE}" "${BACKUP}"

echo "Deduping history (keeping first occurrence)…"
tac "${HISTFILE}" \
  | awk 'BEGIN { FS=";" }
         { cmd = $2
           if (!seen[cmd]++) print }
        ' \
  | tac \
  > "${TMPFILE}"

mv -- "${TMPFILE}" "${HISTFILE}"
chmod 600 "${HISTFILE}"

echo "Reloading cleaned history into shell…"
exec zsh

echo "Done! 🎉"
