#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v stow >/dev/null 2>&1; then
  echo "stow is required but was not found in PATH." >&2
  exit 1
fi

cd "$ROOT_DIR"
mkdir -p "$HOME/.config"

stow --ignore='(?i)^\.ds_store$' --target="$HOME/.config" --verbose config
stow --ignore='(?i)^\.ds_store$' --target="$HOME" --verbose home
