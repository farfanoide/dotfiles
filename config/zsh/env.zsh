export MUSIC_DIR="$HOME/Music/iTunes/iTunes Media/Music/"
export DOWN_DIR="$HOME/Downloads"
export SRC_DIR="$HOME/Develop"
export APPS_DIR="$HOME/Develop/apps"
export YATSH_DIR="$HOME/.tmux/yat.sh"

export VISUAL="nvim"
export EDITOR="nvim"

[[ -d /opt/homebrew/lib ]] && export DYLD_FALLBACK_LIBRARY_PATH="/opt/homebrew/lib:${DYLD_FALLBACK_LIBRARY_PATH:-}"
[[ -d /opt/homebrew/opt/postgresql@15/bin ]] && path=(/opt/homebrew/opt/postgresql@15/bin $path)
[[ -d "$HOME/.lmstudio/bin" ]] && path=("$HOME/.lmstudio/bin" $path)
[[ -d "$HOME/.antigravity/antigravity/bin" ]] && path=("$HOME/.antigravity/antigravity/bin" $path)

_mac_osx() { [[ "$(uname)" == "Darwin" ]]; }
_linux() { [[ "$(uname)" == "Linux" ]]; }
