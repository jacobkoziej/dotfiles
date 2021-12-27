# changing directories
set -o AUTO_CD

# completion
set -o ALWAYS_LAST_PROMPT
set -o AUTO_LIST
set -o AUTO_MENU
set -o AUTO_PARAM_KEYS
set -o AUTO_PARAM_SLASH
set +o AUTO_REMOVE_SLASH
set -o GLOB_COMPLETE
set -o HASH_LIST_ALL
set -o LIST_AMBIGUOUS
set +o LIST_BEEP
set -o LIST_TYPES

# expansion and globbing
set -o BAD_PATTERN
set -o BARE_GLOB_QUAL
set -o CASE_GLOB
set -o CASE_MATCH
set +o CSH_NULL_GLOB
set +o EQUALS
set -o GLOB
set +o GLOB_ASSIGN
set -o GLOB_DOTS
set +o GLOB_SUBST
set +o KSH_GLOB
set -o NOMATCH
set +o SH_GLOB
set -o UNSET

# history
set -o APPEND_HISTORY
set -o BANG_HIST
set -o EXTENDED_HISTORY
set +o HIST_BEEP
set -o HIST_EXPIRE_DUPS_FIRST
set -o HIST_FCNTL_LOCK
set -o HIST_IGNORE_DUPS
set -o HIST_IGNORE_SPACE
set -o HIST_REDUCE_BLANKS
set -o HIST_SAVE_BY_COPY
set -o HIST_VERIFY
set -o SHARE_HISTORY

# input/output
set -o ALIASES
set -o CLOBBER
set +o FLOW_CONTROL
set -o INTERACTIVE_COMMENTS
set -o HASH_CMDS
set -o HASH_DIRS
set +o PATH_SCRIPT
set +o RM_STAR_SILENT
set -o SHORT_LOOPS

# job control
set -o BG_NICE
set -o CHECK_JOBS
set -o CHECK_RUNNING_JOBS
set -o HUP
set -o LONG_LIST_JOBS
set -o NOTIFY
set +o POSIX_JOBS
