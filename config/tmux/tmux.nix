{ pkgs, ... } :

{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    escapeTime = 0;
    extraConfig = ''
        ${builtins.readFile ./tmux.conf}
    '';
    plugins = with pkgs.tmuxPlugins; [ vim-tmux-navigator continuum resurrect];
  };
}
