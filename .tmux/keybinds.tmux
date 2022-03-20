# match prefix to leader key
unbind 'C-b'
set -g prefix 'C-Space'
bind 'C-Space' send-prefix

# intuitive window splitting
unbind '%'
unbind '"'
unbind '-'
bind '-' splitw -v
bind '\' splitw -h
bind '_' splitw -vb
bind '|' splitw -hb

# nameless new windows
unbind 'c'
bind 'c' neww -n ''

# toggle status line
bind 'b' set status

# consistency with vi
unbind 'p'
bind 'N' prev

# vi pane movement
unbind 'Left'
unbind 'Down'
unbind 'Up'
unbind 'Right'
bind 'h' selectp -L
bind 'j' selectp -D
bind 'k' selectp -U
bind 'l' selectp -R
