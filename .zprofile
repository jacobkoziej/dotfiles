export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export GOPATH="${HOME}/.local/go"
export GOPRIVATE="git.jacobkoziej.xyz/*"

export PATH="${GOPATH}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

gpgconf --kill gpg-agent &&
gpg-agent --daemon --pinentry-program $HOME/.local/bin/pinentry-auto

export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
