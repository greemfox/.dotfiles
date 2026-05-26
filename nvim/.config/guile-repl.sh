#!/usr/bin/env bash
SOCKET="$HOME/.local/share/guile-repl.socket"
trap "rm -f $SOCKET" EXIT
rm -f "$SOCKET"
guile --listen="$SOCKET"
