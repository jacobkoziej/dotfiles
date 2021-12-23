# match prefix to leader key
unbind 'C-b'
set -g prefix 'C-Space'

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
