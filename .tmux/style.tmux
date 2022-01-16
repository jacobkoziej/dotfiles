set -g status-interval '1'
set -g status-position top

set -g status-style "bg=default"

set -g status-left-length '32'
set -g status-left-style "fg=black,bold"
set -g status-left "#[bg=blue] #S #[bg=default] "

set -g status-right-length '64'
set -g status-right-style "fg=black,bold"
set -g status-right "#[bg=cyan] %F | %T #[bg=default] #[bg=blue] #H "
