#activare maus
#set -g mouse on

#Mouse on-off cu m si M
bind m set -g mouse on
bind M set -g mouse off

set -g prefix2 C-a                        # GNU-Screen compatible prefix
bind C-a send-prefix -2


# reload configuration
bind r source-file ~/.tmux.conf

setw -g automatic-rename on   # rename window to reflect current program
set -g renumber-windows on    # renumber windows when a window is closed

set -g set-titles on          # set terminal title

set -g display-panes-time 3000 # slightly longer pane indicators display time
set -g display-time 3000      # slightly longer status messages display time

set -g status-interval 10     # redraw status line every 10 seconds

# split current window horizontally
bind ] split-window -v
# split current window vertically
bind [ split-window -h

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D


# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window


# pane resizing cu cifrele 2 4 6 8
bind -r 4 resize-pane -L 4
bind -r 2 resize-pane -D 4
bind -r 8 resize-pane -U 4
bind -r 6 resize-pane -R 4


# Theme
set-window-option -g window-status-current-style bold,bg=blue,fg=colour234
set-window-option -g window-status-style fg=colour35
set -g window-status-activity-style bold,bg=colour234,fg=white
set-option -g message-style bg=colour237,fg=colour231
set-option -g pane-border-style fg=colour36
set-option -g pane-active-border-style fg=colour35


# Set the base-index to 1 rather than 0
set -g base-index 1
set-window-option -g pane-base-index 1


# Allow the arrow key to be used immediately after changing windows
set-option -g repeat-time 0


# Change background color of a tab when activity occurs
setw -g monitor-activity on

# Do NOT reset the color of the tab after activity stops occuring
setw -g monitor-silence 0

# Status Bar
set -g status-justify centre
set -g status-bg black
set -g status-fg colour35
set -g status-interval 60
set -g status-left-length 50
set -g status-left "#[bg=colour35]💻#[fg=colour234,bold] #H#[bg=colour34]#[bg=colour35,nobold]#[fg=colour234] [#S] $tmux_target_lower"
set -g status-right '#[bg=colour35] 🕔 #[fg=colour234,bold]%H:%M '
