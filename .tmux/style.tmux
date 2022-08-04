set -g status-interval '1'
set -g status-position top

set -g status-style "bg=default"

set -g @status-left-format '#[bg=blue] #S #[bg=default] '
set -g status-left-length '32'
set -g status-left-style "fg=black,bold"
set -g status-left '#{E:@status-left-format}'

set -g @status-right-format ''
if "$HOME/.scripts/battery-check.sh" {
	set -ag @status-right-format '#[bg=cyan] #($HOME/.scripts/battery.sh) #[bg=default] '
}
set -ag @status-right-format '#[bg=green] %F | %T #[bg=default] #[bg=blue] #H '
set -g status-right-length '64'
set -g status-right-style "fg=black,bold"
set -g status-right '#{E:@status-right-format}'

# we do not want a space when the window name is an emptry string
set -g @window-status-format ' #[bold]#I#{?#{==:#W,},, #[none]#W} '
set -g window-status-current-style "bg=cyan,fg=black"
set -g window-status-current-format '#{E:@window-status-format}'
set -g window-status-style "bg=black,fg=white"
set -g window-status-last-style "bg=black,fg=cyan"
set -g window-status-activity-style "bg=green,fg=black"
set -g window-status-bell-style "bg=white,fg=black"
set -g window-status-format '#{E:@window-status-format}'
