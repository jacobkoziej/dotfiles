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
