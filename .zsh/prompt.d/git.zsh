GIT_STASHED_SYMBOL="$"
GIT_MODIFIED_SYMBOL="+"
GIT_UNTRACKED_SYMBOL="?"

prompt::section::git()
{
	local GIT_STATUS GIT_PROMPT
	local branch changes

	# gather status information if we're inside a git repository
	GIT_STATUS=$(command git status \
		--branch \
		--porcelain=2 \
		--show-stash \
		2> /dev/null) || return

	# get branch information
	branch=$(echo "$GIT_STATUS" | command grep '^# branch\.head' | command sed 's/^# branch\.head //')

	# get stashed files
	if $(echo "$GIT_STATUS" | command grep '^# stash' &> /dev/null); then
		changes="$changes$GIT_STASHED_SYMBOL"
	fi

	# get modified files
	if $(echo "$GIT_STATUS" | command grep '^[12]' &> /dev/null); then
		changes="$changes$GIT_MODIFIED_SYMBOL"
	fi

	# get untracked files
	if $(echo "$GIT_STATUS" | command grep '^\?' &> /dev/null); then
		changes="$changes$GIT_UNTRACKED_SYMBOL"
	fi

	[[ -n "$branch" ]] && GIT_PROMPT="$GIT_PROMPT on %F{green}$branch%f"
	[[ -n "$changes" ]] && GIT_PROMPT="$GIT_PROMPT %F{red}[$changes]%f"
	echo -n "$GIT_PROMPT"
}
