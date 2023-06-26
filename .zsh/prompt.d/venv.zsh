prompt::section::venv()
{
	[[ -n "$VIRTUAL_ENV" ]] || return

	echo -n "py"
}
