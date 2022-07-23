VENV_GENERIC_NAMES=(
	'.venv'
	'venv'
	'virtualenv'
)

prompt::section::venv()
{
	[[ -n "$VIRTUAL_ENV" ]] || return

	local name

	if [[ "${VENV_GENERIC_NAMES[(i)$VIRTUAL_ENV:t]}" -le "${#VENV_GENERIC_NAMES}" ]]; then
		name="$VIRTUAL_ENV:h:t"
	elif [[ "$VIRTUAL_ENV" != "${VIRTUAL_ENV#$PYTHONVENV/}" ]]; then
		name="${VIRTUAL_ENV#$PYTHONVENV/}"
	else
		name="$VIRTUAL_ENV:t"
	fi

	echo -n "py %F{yellow}$name%f"
}
