

set -g prefix2 C-a                        # GNU-Screen compatible prefix
bind C-a send-prefix -2


# reload configuration
bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

setw -g automatic-rename on   # rename window to reflect current program
set -g renumber-windows on    # renumber windows when a window is closed

set -g set-titles on          # set terminal title

set -g display-panes-time 800 # slightly longer pane indicators display time
set -g display-time 1000      # slightly longer status messages display time

set -g status-interval 10     # redraw status line every 10 seconds


# create session
bind C-c new-session


# split current window horizontally
bind ] split-window -v
# split current window vertically
bind [ split-window -h

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

#schimba panelurile intre ele cu , .
bind . swap-pane -D       # swap current pane with the next one
bind , swap-pane -U       # swap current pane with the previous one


# pane resizing cu cifrele 2 4 6 8
bind -r 4 resize-pane -L 2
bind -r 2 resize-pane -D 2
bind -r 8 resize-pane -U 2
bind -r 6 resize-pane -R 2


# toggle mouse
bind m run "cut -c3- ~/.tmux.conf | sh -s _toggle_mouse"


# copy to X11 clipboard
if -b 'command -v xsel > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | xsel -i -b"'
if -b '! command -v xsel > /dev/null 2>&1 && command -v xclip > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | xclip -i -selection clipboard >/dev/null 2>&1"'
# copy to macOS clipboard
if -b 'command -v pbcopy > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | pbcopy"'
if -b 'command -v reattach-to-user-namespace > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | reattach-to-user-namespace pbcopy"'
# copy to Windows clipboard
if -b 'command -v clip.exe > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | clip.exe"'
if -b '[ -c /dev/clipboard ]' 'bind y run -b "tmux save-buffer - > /dev/clipboard"'
