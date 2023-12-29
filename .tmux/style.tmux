set -g status-interval '1'
set -g status-position top

set -g status-style 'bg=default'

set -g @status-left-format '[#S] '
set -g status-left-length '32'
set -g status-left-style 'fg=blue,bold'
set -g status-left '#{E:@status-left-format}'

set -g @status-right-format '['
if '$HOME/.scripts/battery-check.sh' {
	set -ag @status-right-format '#($HOME/.scripts/battery.sh) | '
}
set -ag @status-right-format '%F | %T | #h'
set -ag @status-right-format ']'
set -g status-right-length '64'
set -g status-right-style 'fg=blue,bold'
set -g status-right '#{?#{e|>=:#{client_width},80},#{E:@status-right-format},}'

set -g @window-status-format '#I#{?#{==:#W,},,:#W}#{?window_zoomed_flag,*,}#{?window_last_flag,!,}'
set -g window-status-current-style 'fg=white,bold'
set -g window-status-current-format '#{E:@window-status-format}'
set -g window-status-style 'fg=grey,bold'
set -g window-status-last-style 'fg=grey,bold'
set -g window-status-activity-style 'fg=green,bold'
set -g window-status-bell-style 'fg=red,bold'
set -g window-status-format '#{E:@window-status-format}'
