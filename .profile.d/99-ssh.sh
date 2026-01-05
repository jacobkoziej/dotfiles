ssh-add -l > /dev/null 2>&1

test "$?" -eq 2 && unset SSH_AUTH_SOCK
