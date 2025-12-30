if [ -d "$HOME/.nix-profile/etc/profile.d" ]; then
	for sh in $HOME/.nix-profile/etc/profile.d/*.sh; do
		[ -r "$sh" ] && . "$sh"
	done
fi
