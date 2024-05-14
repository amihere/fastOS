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
         vim
    ];
   programs.git = {
     enable = true;
     userName = "amihere";
     userEmail = "17128203+amihere@users.noreply.github.com";
   };
   programs.neovim = {
     enable = true;
     defaultEditor = true;
     plugins = with pkgs;[
        vimPlugins.plenary-nvim
	vimPlugins.telescope-nvim
	vimPlugins.gitsigns-nvim
	vimPlugins.nvim-lspconfig
	vimPlugins.rose-pine
	vimPlugins.nvim-treesitter.withAllGrammars
	vimPlugins.vim-tmux-navigator
	vimPlugins.vim-surround
	vimPlugins.comment-nvim
	vimPlugins.lualine-nvim
	vimPlugins.which-key-nvim
	vimPlugins.telescope-nvim
	vimPlugins.telescope-ui-select-nvim
	vimPlugins.telescope-fzf-native-nvim
	vimPlugins.nvim-cmp
	vimPlugins.cmp-buffer
	vimPlugins.cmp-path
	vimPlugins.luasnip
	vimPlugins.cmp_luasnip
	vimPlugins.friendly-snippets
	vimPlugins.mason-nvim
	vimPlugins.mason-lspconfig-nvim
	vimPlugins.nvim-lspconfig
	vimPlugins.cmp-nvim-lsp
	vimPlugins.harpoon
	vimPlugins.git-worktree-nvim
	vimPlugins.nvim-dap
	vimPlugins.nvim-dap-virtual-text
	vimPlugins.nvim-jdtls
	vimPlugins.twilight-nvim
	vimPlugins.undotree
     ];
   };
   programs.tmux = {
     enable = true;
   };
   programs.zsh = {
     enable = true;
     enableCompletion = true;
     syntaxHighlighting.enable = true;
     autocd = true;
     enableAutosuggestions = true;
     oh-my-zsh = {
       enable = true;
       plugins = ["git" "z"];
       theme = "philips";
     };
   };

   programs.home-manager.enable = true; 
}
