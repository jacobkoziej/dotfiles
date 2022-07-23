RO_SYMBOL="ro"

prompt::section::dir()
{
	local dir

	dir="${dir}%F{cyan}%~%f"

	[[ ! -w . ]] && dir="${dir} %F{red}$RO_SYMBOL%f"

	echo -n "$dir"
}
