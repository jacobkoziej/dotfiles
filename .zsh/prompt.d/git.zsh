prompt::section::git()
{
	local GIT_STASHED_SYMBOL="$"
	local GIT_MODIFIED_SYMBOL="+"
	local GIT_UNTRACKED_SYMBOL="?"

	local branch changes git_status

	# gather status information if we're inside a git repository
	git_status=$(command git status \
		--branch \
		--porcelain=2 \
		--show-stash \
		2> /dev/null) || return

	# get branch information
	branch=$(echo "$git_status" | command grep '^# branch\.head' | command sed 's/^# branch\.head //')

	# get stashed files
	if $(echo "$git_status" | command grep '^# stash' &> /dev/null); then
		changes="$changes$GIT_STASHED_SYMBOL"
	fi

	# get modified files
	if $(echo "$git_status" | command grep '^[12]' &> /dev/null); then
		changes="$changes$GIT_MODIFIED_SYMBOL"
	fi

	# get untracked files
	if $(echo "$git_status" | command grep '^\?' &> /dev/null); then
		changes="$changes$GIT_UNTRACKED_SYMBOL"
	fi

	[[ -n "$branch" ]] && echo -n "on %F{green}$branch%f" &&
		[[ -n "$changes" ]] && echo -n " %F{red}[$changes]%f"
}
