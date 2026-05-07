ssh-add -l > /dev/null 2>&1

test "$?" -eq 2 && unset SSH_AUTH_SOCK

if [ -z "$SSH_AUTH_SOCK" ] && [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
