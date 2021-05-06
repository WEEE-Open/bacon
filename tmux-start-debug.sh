#!/bin/sh

tmux new-session -d "sudo docker exec -it bacula-dir /bin/bash -c 'service bacula-director stop && bacula-dir -d 200 && bash'"
tmux selectp -t 0    # select the first (0) pane
tmux splitw -h -p 50 "sudo docker exec -it bacula-dir /bin/bash -c 'bconsole -d 200 && bash'"
tmux selectp -t 0    # select the first (0) pane
tmux splitw -v -p 50 "sudo docker exec -it bacula-fd /bin/bash -c 'service bacula-fd stop && bacula-fd -d 200 && bash'"

tmux selectp -t 2    # select the new, second (2) pane
tmux splitw -v -p 50 "sudo docker exec -it bacula-sd /bin/bash -c 'service bacula-sd stop && bacula-sd -d 200 && bash'"
tmux selectp -t 0    # go back to the first pane
tmux -2 attach-session -d
