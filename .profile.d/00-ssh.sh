if [ -n "$SSH_CONNECTION" ]; then
	test -S "$SSH_AUTH_SOCK" &&
		[ "$(realpath "$SSH_AUTH_SOCK")" != "$(realpath "$HOME/.ssh/auth.sock")" ] &&
		ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/auth.sock"

	export SSH_AUTH_SOCK="$HOME/.ssh/auth.sock"
fi
