#!/usr/bin/env bash
SOCKET="$HOME/.local/share/guile-repl.socket"
rm -f "$SOCKET"
guile --listen="$SOCKET"
trap "rm -f $SOCKET" EXIT
