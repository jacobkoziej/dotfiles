if [ -n "$SSH_CONNECTION" ]; then
	test -S "$SSH_AUTH_SOCK" &&
		[ "$(realpath "$SSH_AUTH_SOCK")" != "$(realpath "$HOME/.ssh/auth_sock")" ] &&
		ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/auth_sock"

	export SSH_AUTH_SOCK="$HOME/.ssh/auth_sock"
fi
