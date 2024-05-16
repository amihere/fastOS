{ config, pkgs, ... } :

{
  imports =
    [
      ./vim/vim.nix
      ./tmux/tmux.nix
      ./zsh/zsh.nix
      ./neovim/neovim.nix
    ];

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
         go
         htop
         lazygit
         maven
         neofetch
         rio
         ripgrep
         tree
         unzip
         xclip
    ];
   programs.git = {
     enable = true;
     userName = "amihere";
     userEmail = "17128203+amihere@users.noreply.github.com";
   };
   
   home.file = {
     ".tmux-sessionizer" = {
       source = ./tmux/.tmux-sessionizer;
     };
     ".i3" = {
       source = ./i3/i3-conf;
     };
   };
   programs.home-manager.enable = true; 
}
