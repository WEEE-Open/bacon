#!/bin/sh

# this launches a 4-paned tmux session with the the dir, console, sd and fd in debug mode (-d 200)

tmux new-session -d "sudo docker exec -it bacula-dir /bin/bash -c 'service bacula-director stop && bacula-dir -d 200 && bash'"
tmux selectp -t 0
tmux splitw -h -p 50 "sudo docker exec -it bacula-dir /bin/bash -c 'bconsole -d 200 && bash'"
tmux selectp -t 0
tmux splitw -v -p 50 "sudo docker exec -it bacula-fd /bin/bash -c 'service bacula-fd stop && bacula-fd -d 200 && bash'"
tmux selectp -t 2
tmux splitw -v -p 50 "sudo docker exec -it bacula-sd /bin/bash -c 'service bacula-sd stop && bacula-sd -d 200 && bash'"
tmux selectp -t 0
tmux -2 attach-session -d
