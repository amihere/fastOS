{ pkgs, ... } :

{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    escapeTime = 0;
    extraConfig = ''
	set -ga terminal-overrides ",screen-256color*:Tc"
	set-option -g default-terminal "screen-256color"

	set -g mouse on

	set-option -g detach-on-destroy off

	set -g renumber-windows on # renumber windows

	set -g prefix C-a
	unbind C-b
	bind-key C-a send-prefix
	set -g status-style 'bg=#333333 fg=#5eacd3'

	bind Tab last-window

	unbind %
	bind | split-window -fh -c "#{pane_current_path}"
	bind-key "\\" split-window -h -c "#{pane_current_path}"

	unbind '"'
	bind - split-window -v
	bind-key "_" split-window -fv -c "#{pane_current_path}"

	set-window-option -g mode-keys vi
	bind -T copy-mode-vi v send-keys -X begin-selection
	bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"

	# vim-like pane switching
	bind -r k select-pane -U
	bind -r j select-pane -D
	bind -r h select-pane -L
	bind -r l select-pane -R

	bind -r M resize-pane -Z
	bind -r m resize-pane -D 15
	# bind -r C-M resize-pane -U 15
	bind -r C-M select-layout tiled

	bind c new-window -c "#{pane_current_path}"
	bind-key & kill-window
	bind-key X kill-pane

	# bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"

	bind Q confirm-before -p "shutdown? (y/n)" kill-server

	# plugin setup
	set -g @resurrect-strategy-nvim 'session'
        
        #tmux theme
        ${builtins.readFile ./tmux.theme}
    '';
    plugins = with pkgs.tmuxPlugins; [ vim-tmux-navigator continuum resurrect];
  };
}
