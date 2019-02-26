#!/bin/bash
/bin/sleep 2

/usr/bin/tmux kill-session -t pioled
/usr/bin/tmux new -d -s pioled

/usr/bin/tmux send-keys -t pioled "bash" C-m
/usr/bin/tmux send-keys -t pioled "" C-m
