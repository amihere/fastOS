{ config, pkgs, ... } :

{
  home = {
    username = "g";
    homeDirectory = "/home/g";
    stateVersion = "23.11";  
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
   home.packages = with pkgs; [
         clipmenu
         delta
         fd
         fzf
         firefox
         git
         gnumake
         htop
         lazygit
         maven
         neofetch
         neovim
         rio
         ripgrep
         tmux
         tree
         unzip
         xclip
         vim
         zsh
    ];
   programs.git = {
     enable = true;
     userName = "amihere";
   };
   programs.home-manager.enable = true; 
}
