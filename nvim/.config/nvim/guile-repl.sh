#!/usr/bin/env bash
set -xe
SOCKET="$HOME/.local/share/guile-repl.socket"
[ -f "$SOCKET" ] && rm -f "$SOCKET"
guile --listen="$SOCKET"
trap 'rm -f "$SOCKET"' EXIT

