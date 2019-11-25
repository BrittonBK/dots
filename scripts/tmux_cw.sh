#!/bin/sh

tmux new-session -d
tmux rename-window "cw"
tmux split-window -v -p 30
tmux split-window -h -p 30
tmux split-window -h -p 90

tmux select-pane -t 2
tmux split-window -v

tmux select-pane -t 0
tmux send-keys -t cw "$1;gs" C-m

tmux select-pane -t 1
tmux send-keys -t cw 'cw;vagrant up;vagrant ssh' C-m

tmux select-pane -t 2
tmux send-keys -t cw 'cw;cd commotion;yarn start' C-m

tmux select-pane -t 3
tmux send-keys -t cw 'cw;cd jscommon;yarn start' C-m

tmux select-pane -t 4
tmux send-keys -t cw "$1;clear" C-m

tmux -2 attach-session -d

