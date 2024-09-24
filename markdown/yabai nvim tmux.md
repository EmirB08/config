# Configuration Guide

## Tmux

- **Resize Panes**:
  - `Ctrl + j`: Resize pane down by 5 units
  - `Ctrl + k`: Resize pane up by 5 units
  - `Ctrl + l`: Resize pane right by 5 units
  - `Ctrl + h`: Resize pane left by 5 units

bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

yabai /skhdrc

# change window focus within space
alt - j : yabai -m window --focus south
alt - k : yabai -m window --focus north
alt - h : yabai -m window --focus west
alt - l : yabai -m window --focus east

#change focus between external displays (left and right)
alt - i: yabai -m display --focus west
alt - o: yabai -m display --focus east

# rotate layout clockwise
shift + alt - j : yabai -m space --rotate 90
#rotate layout anti-clockwise
shift + alt - h : yabai -m space --rotate 90-

# maximize a window
shift + alt - k : yabai -m window --toggle zoom-fullscreen

# balance out tree of windows (resize to occupy same area)
shift + alt - l : yabai -m space --balance

# stop/start/restart yabai
ctrl + alt - q : yabai --stop-service
ctrl + alt - s : yabai --start-service
ctrl + alt - r : yabai --restart-service

" Maps <C-h/j/k/l> to switch vim splits in the given direction. If there are
" no more windows in that direction, forwards the operation to tmux.
" Additionally, <C-\> toggles between last active vim splits/tmux panes.

if exists("g:loaded_tmux_navigator") || &cp || v:version < 700
  finish
endif
let g:loaded_tmux_navigator = 1

function! s:VimNavigate(direction)
  try
    execute 'wincmd ' . a:direction
  catch
    echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, CTRL-C quits: wincmd k' | echohl None
  endtry
endfunction

if !get(g:, 'tmux_navigator_no_mappings', 0)
  nnoremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
  nnoremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>


