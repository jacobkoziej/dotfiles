# changing directories
set -o AUTO_CD

# completion
set +o AUTO_REMOVE_SLASH
set -o GLOB_COMPLETE
set +o LIST_BEEP

# expansion and globbing
set -o GLOB_DOTS

# history
set -o EXTENDED_HISTORY
set +o HIST_BEEP
set -o HIST_EXPIRE_DUPS_FIRST
set -o HIST_FCNTL_LOCK
set -o HIST_IGNORE_DUPS
set -o HIST_IGNORE_SPACE
set -o HIST_REDUCE_BLANKS
set -o HIST_VERIFY
set -o SHARE_HISTORY

# input/output
set -o INTERACTIVE_COMMENTS

# job control
set -o LONG_LIST_JOBS
