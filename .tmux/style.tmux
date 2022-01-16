set -g status-interval '1'
set -g status-position top

set -g status-style "none"

set -g status-left-length '32'
set -g status-left "#[fg=black,bg=blue,bold] #S #[bg=default] "

set -g status-right-length '64'
set -g status-right  "#[fg=black,bold]"
set -ag status-right "#[bg=cyan] %F | %T #[bg=default] #[bg=blue] #H "
