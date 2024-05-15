{ pkgs, ... } :

{
  programs.vim = {
    enable = true;
    extraConfig = ''
	set nocompatible

	syntax on
	filetype plugin on

	noremap <Up> <Nop>
	noremap <Down> <Nop>
	noremap <Left> <Nop>
	noremap <Right> <Nop>

	"search all paths
	set path+=**

	"display matching files after tab
	set wildmenu

	colo retrobox

	"line numbers
	set relativenumber
	set number

	"tabs & indentation
	set tabstop=2
	set shiftwidth=2
	set expandtab
	set autoindent

	"line wrapping
	set nowrap

	"search settings
	set ignorecase
	set smartcase

	"cursor line
	set guicursor=""

	"appearance
	set background=dark
	set signcolumn=yes

	"backspace
	set backspace=indent,eol,start

	"clipboard
	"set clipboard+=unnamedplus

	"split windows
	set splitright
	set splitbelow

	"the prime aegean
	set incsearch
	set nohlsearch
	set scrolloff=8

	"TJ
	set list
	set listchars=tab:»\ ,trail:·,nbsp:␣
    '';
    plugins = with pkgs.vimPlugins; [ vim-dadbod vim-dadbod-ui vim-dadbod-completion ];
  };
}
