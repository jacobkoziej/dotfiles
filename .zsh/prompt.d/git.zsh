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
	echo "$git_status" | command grep '^# stash' &> /dev/null &&
		changes="$changes$GIT_STASHED_SYMBOL"

	# get modified files
	echo "$git_status" | command grep '^[12]' &> /dev/null &&
		changes="$changes$GIT_MODIFIED_SYMBOL"

	# get untracked files
	echo "$git_status" | command grep '^\?' &> /dev/null &&
		changes="$changes$GIT_UNTRACKED_SYMBOL"

	[[ -n "$branch" ]] && echo -n "on %F{green}$branch%f" &&
		[[ -n "$changes" ]] && echo -n " %F{red}[$changes]%f"
}
