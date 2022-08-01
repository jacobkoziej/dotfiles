set -g status-interval '1'
set -g status-position top

set -g status-style "bg=default"

TMUX_STATUS_LEFT_FORMAT="#[bg=blue] #S #[bg=default] "
set -g status-left-length '32'
set -g status-left-style "fg=black,bold"
set -g status-left "$TMUX_STATUS_LEFT_FORMAT"

TMUX_STATUS_RIGHT_FORMAT="#[bg=green] %F | %T #[bg=default] #[bg=blue] #H "
set -g status-right-length '64'
set -g status-right-style "fg=black,bold"
set -g status-right "$TMUX_STATUS_RIGHT_FORMAT"

# we do not want a space when the window name is an emptry string
TMUX_WINDOW_STATUS_FORMAT=" #[bold]#I#{?#{==:#W,},, #[none]#W} "
set -g window-status-current-style "bg=cyan,fg=black"
set -g window-status-current-format "$TMUX_WINDOW_STATUS_FORMAT"
set -g window-status-style "bg=black,fg=white"
set -g window-status-last-style "bg=black,fg=cyan"
set -g window-status-activity-style "bg=green,fg=black"
set -g window-status-bell-style "bg=white,fg=black"
set -g window-status-format "$TMUX_WINDOW_STATUS_FORMAT"
