# Configuration Guide

## tmux

##### general
###### create new window:
`Ctrl-a + c`
###### Next Window:
`Ctrl-a + n`
###### previous window:
`Ctrl-a + p`
###### list windows:
`Ctrl-a + w`
###### Detach Session:
`Ctrl-a + d`
###### split pane horizontally:
`Ctrl-a + ø`
###### split pane vertically:
`Ctrl-a + æ`
###### rename window:
`Ctrl-a + ,`
###### save current session (tmux-resurrect):
`Ctrl-a + Ctrl-s`
###### restore last saved session (tmux-resurrect):
`Ctrl-a + Ctrl-r`

##### resize panes
###### decrease height:
`Ctrl-a + j`
###### increase height:
`Ctrl-a + k`
###### increase width:
`Ctrl-a + l`
###### decrease width:
`Ctrl-a + h`

##### navigation
###### Left Pane:
`Ctrl + h`
###### lower pane:
`Ctrl + j`
###### upper pane:
`Ctrl + k`
###### right pane:
`Ctrl + l`
###### previous pane:
`Ctrl + \`

##### copy mode
###### start selection:
`Ctrl-a + v`
###### copy selection:
`Ctrl-a + y`

##### commands
###### attach to session:
`tmux attach -t [session-name]`
###### detach from session:
`tmux detach`
###### create new session:
`tmux new -s [session-name]`
###### list sessions:
`tmux ls`
###### kill session:
`tmux kill-session -t [session-name]`
###### rename session:
`tmux rename-session -t [current-name] [new-name]`

## yabai/skhdrc

##### change window focus within space
###### focus south:
`alt - j`
###### focus north:
`alt - k`
###### focus west:
`alt - h`
###### focus east:
`alt - l`

##### change focus between external displays
###### focus west display:
`alt - i`
###### focus east display:
`alt - o`

##### window and space management
###### rotate layout clockwise:
`shift + alt - j`
###### rotate layout anti-clockwise:
`shift + alt - h`
###### maximize window:
`shift + alt - k`
###### balance windows:
`shift + alt - l`

##### yabai service management
###### stop yabai:
`ctrl + alt - q`
###### start yabai:
`ctrl + alt - s`
###### restart yabai:
`ctrl + alt - r`
