for sh in $HOME/.profile.d/*.sh; do
	[[ -r "$sh" ]] && source "$sh"
done

export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
