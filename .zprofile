for sh in $HOME/.profile.d/*.sh; do
	[[ -r "$sh" ]] && source "$sh"
done

export PATH="$HOME/.local/bin:$PATH"
