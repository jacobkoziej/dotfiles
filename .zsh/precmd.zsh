precmd()
{
	if [[ -n "$TMUX" ]]; then
		tmux set-environment SSH_AUTH_SOCK "$SSH_AUTH_SOCK"
	fi
}
