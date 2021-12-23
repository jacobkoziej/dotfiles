unbind C-b
unbind c

set -g prefix C-Space

bind b set status
bind c neww -n ""


# intuitive window splitting
unbind '%'
unbind '"'
unbind '-'
bind '-' splitw -v
bind '\' splitw -h
bind '_' splitw -vb
bind '|' splitw -hb
