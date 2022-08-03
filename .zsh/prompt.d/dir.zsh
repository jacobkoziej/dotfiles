prompt::section::dir()
{
	local RO_SYMBOL='ro'

	local dir

	dir="${dir}%F{cyan}%~%f"

	[[ ! -w . ]] && dir="${dir} %F{red}$RO_SYMBOL%f"

	echo -n "$dir"
}
