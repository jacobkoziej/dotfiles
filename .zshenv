export HISTFILE="$HOME/.zshhist"
export HISTSIZE=16777216
export SAVEHIST=16777216

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$HOME/.local/run}"

export HOSTALIASES="$HOME/.hosts"

export SSH_AUTH_SOCK="${SSH_AUTH_SOCK:-$XDG_RUNTIME_DIR/ssh_auth_sock}"

export GOPATH="$HOME/.local/go"
export GOPRIVATE="git.jacobkoziej.xyz/*"

export PIP_REQUIRE_VIRTUALENV=true
export PYTHONSTARTUP="$HOME/.pythonrc.py"
export PYTHONVENV="$HOME/.local/python/venv"
export VIRTUAL_ENV_DISABLE_PROMPT=true

export BROWSER="librewolf"
export EDITOR="nvim"
export TERMINAL="alacritty"
export THEME="nord"
