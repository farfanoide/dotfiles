# dotfiles

Stow-managed dotfiles. The active configs live under `config/`, which links
into `~/.config`.

Current configs:

- `config/nvim` links to `~/.config/nvim`
- `config/tmux` links to `~/.config/tmux`
- `config/zsh` links to `~/.config/zsh`
- `config/ghostty` links to `~/.config/ghostty`
- `home/.zshrc` links to `~/.zshrc`
- `home/.gitconfig` links to `~/.gitconfig`
- `home/.git-pager` links to `~/.git-pager`
- `home/.gitignore_global` links to `~/.gitignore_global`
- `home/.git_template` links to `~/.git_template`
- `home/.bin` links to `~/.bin`

## Link configs

```sh
./link.sh
```

## Install editor tools

The Neovim config expects editor runtimes and language tools to come from
`mise`, not from Mason's first-run installer.

```sh
brew install mise
./link.sh
mise install
```

Optional GUI apps:

```sh
brew install --cask ghostty
```

Optional Git helpers:

```sh
brew install git-lfs universal-ctags
```

Restart the shell after installing `mise` so `eval "$(mise activate zsh)"` is
active before launching `nvim`.

Optional zsh plugins still come from Homebrew:

```sh
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-completions
```

## Project-specific tools

The global `~/.config/mise/config.toml` is the fallback toolbox. Individual
projects can add a `mise.toml` at the project root to override versions or add
extra tools:

```toml
[tools]
node = "22"
python = "3.12"

"npm:prettier" = "3.3.3"
"npm:eslint_d" = "latest"
"pypi:ruff" = "0.6.9"
```

Then run this once in that project:

```sh
mise install
```

Launch Neovim from the project shell so it inherits that project's tools:

```sh
cd ~/Develop/some-project
nvim .
```

Keep shared project choices in `mise.toml`. Put private experiments or machine
specific overrides in `mise.local.toml`, which is ignored by this repo.

Examples:

```toml
# Vue/TypeScript project
[tools]
node = "24"
"npm:@vue/language-server" = "latest"
"npm:@vtsls/language-server" = "latest"
"npm:prettier" = "latest"
"npm:eslint_d" = "latest"
```

```toml
# Python/Django project
[tools]
python = "3.13"
uv = "latest"
"npm:pyright" = "latest"
"pypi:ruff" = "latest"
"pypi:djlint" = "latest"
```

## Unlink configs

```sh
./unlink.sh
```

Both scripts use GNU Stow with `~/.config` as the target.
