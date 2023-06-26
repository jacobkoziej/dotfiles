preexec()
{
	[[ -n "$TMUX" ]] && eval "$(tmux show-environment -s)"
}
