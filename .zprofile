[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && tbsm

export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export GOPATH="${HOME}/.local/go"
export GOPRIVATE="git.jacobkoziej.xyz/*"
