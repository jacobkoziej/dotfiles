prompt::section::dir()
{
	local GIT_GENERIC_NAME='.git'
	local RO_SYMBOL='ro'

	local dir git_dir git_prefix

	if git_prefix=$(git rev-parse --show-toplevel 2> /dev/null); then
		# determine true path to git directory
		git_dir=$(git rev-parse \
			--path-format=absolute \
			--git-common-dir \
			2> /dev/null)

		# determine repo name
		[[ "$git_dir:t" = "$GIT_GENERIC_NAME" ]] &&
			dir="$git_dir:h:t" || dir="$git_dir:t"

		# remove non-git path components
		dir="$dir${${PWD:A}#$~~git_prefix}"
	else
		dir="%~"
	fi

	echo -n "%F{cyan}${dir}%f"
	[[ ! -w . ]] && echo -n " %F{red}$RO_SYMBOL%f"
}
