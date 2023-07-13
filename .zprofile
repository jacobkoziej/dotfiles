for sh in $HOME/.profile.d/*.sh; do
	[[ -r "$sh" ]] && source "$sh"
done

export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
