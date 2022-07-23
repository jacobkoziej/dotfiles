source "$HOME/.zsh/prompt.d/dir.zsh"
source "$HOME/.zsh/prompt.d/git.zsh"
source "$HOME/.zsh/prompt.d/venv.zsh"

prompt::ps1()
{
	echo "%B$(prompt::section::dir) $(prompt::section::git) $(prompt::section::venv)"
	echo -n "[ZSH] %F{magenta}%(!.#.>)%f%b "
}

prompt::ps2()
{
	echo -n "%B[ZSH] %F{cyan}%(!.#.>)%f%b "
}

PS1='$(prompt::ps1)'
PS2='$(prompt::ps2)'
