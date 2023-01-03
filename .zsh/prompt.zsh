source "$HOME/.zsh/prompt.d/dir.zsh"
source "$HOME/.zsh/prompt.d/git.zsh"
source "$HOME/.zsh/prompt.d/jobs.zsh"
source "$HOME/.zsh/prompt.d/venv.zsh"

prompt::ps1()
{
	local section_git="$(prompt::section::git)"
	local section_jobs="$(prompt::section::jobs)"
	local section_venv="$(prompt::section::venv)"

	[[ -n "$section_git" ]] && section_git=" $section_git"
	[[ -n "$section_jobs" ]] && section_jobs=" $section_jobs"
	[[ -n "$section_venv" ]] && section_venv=" $section_venv"

	echo "%B$(prompt::section::dir)$section_git$section_venv"
	echo -n "[ZSH]$section_jobs %F{magenta}%(!.#.>)%f%b "
}

prompt::ps2()
{
	echo -n "%B[ZSH] %F{cyan}%(!.#.>)%f%b "
}

PS1='$(prompt::ps1)'
PS2='$(prompt::ps2)'
