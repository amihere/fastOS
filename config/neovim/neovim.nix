{ pkgs, ... } :

{
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
}
