## tmux
##### session
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



