{ pkgs, ... } :

{
   programs.zsh = {
     enable = true;
     enableCompletion = true;
     shellAliases = {
       tm = "tmux neww ~/.tmux-sessionizer";
     };
     syntaxHighlighting.enable = true;
     autocd = true;
     enableAutosuggestions = true;
     oh-my-zsh = {
       enable = true;
       plugins = ["git" "z"];
       theme = "philips";
     };
   };

}
