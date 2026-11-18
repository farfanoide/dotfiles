md() {
  local dir="$*"
  mkdir -p "$dir" && cd "$dir"
}

reloadshell() {
  exec "$SHELL" -l
}
alias shellreload="reloadshell"

gcm() {
  git commit -m "$*"
}

grt() {
  local root
  root="$(git rev-parse --show-toplevel 2>/dev/null)" || return
  cd "$root"
}

fix_ssh_permissions() {
  chmod -R 700 "$HOME/.ssh" &&
    chmod 600 "$HOME"/.ssh/*rsa(N) &&
    chmod 644 "$HOME"/.ssh/*pub(N)
}

fixapp() {
  xattr -cr "$@"
}

pm() {
  local root
  root="$(git rev-parse --show-toplevel 2>/dev/null)" || root="$PWD"
  (cd "$root" && python ./manage.py "$@")
}

name_this() {
  echo "$(whoami)/$(basename "$PWD")"
}

wake_groot()
{
  wakeonlan -i 192.168.6.255 3c:52:82:71:79:38
}

wake_truenas()
{
  wakeonlan -i 192.168.6.255 3C:52:A1:29:6E:04
}
