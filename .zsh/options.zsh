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

# expansion and globbing
set -o GLOB_DOTS

# history
set -o EXTENDED_HISTORY
