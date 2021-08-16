"set secure
"set number
"set hidden
"set noexpandtab
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set autoindent
"set scrolloff=4
"set ttimeoutlen=0
"set notimeout
"set viewoptions=cursor,folds,slash,unix
"set wrap
"set tw=0
"set indentexpr
"set foldmethod=indent
"set foldlevel=99
"set foldenable
"set formatoptions-=tc
"set splitright
"set splitbelow
"set noshowmode
"set showcmd
"set wildmenu
"set ignorecase
"set smartcase
"set shortmess+=c
"set inccommand=split
"set completeopt=longest,noinsert,menuone,noselect,preview
"set visualbell
"set updatetime=100
"set virtualedit=block
"set signcolumn=yes
"let mapleader = ","
"set clipboard=unnamedplus
"set mouse=a
"set syntax=on
"set lazyredraw "same as above
"set ttyfast "should make scrolling faster

function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

""plug
call plug#begin('~/.vim/plugged')
Plug 'brglng/vim-im-select', Cond(exists('g:vscode'), { 'as': 'vsc-im-select' })
                 
""Plug 'jiangmiao/auto-pairs'
""Plug 'gcmt/wildfire.vim' 
""Plug 'derekwyatt/vim-fswitch'
""Plug 'neoclide/coc.nvim',Cond(!exists('g:vscode'),{'branch': 'release'})
""Plug 'preservim/nerdtree', Cond(!exists('g:vscode'))
""Plug 'junegunn/fzf', Cond(!exists('g:vscode'),{'do':{ -> fzf#install()}})
""Plug 'junegunn/fzf.vim', Cond(!exists('g:vscode'))


"Plug 'hrsh7th/nvim-compe' 
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'tpope/vim-surround'
"Plug 'wellle/targets.vim'
"Plug 'preservim/nerdcommenter'
"Plug 'vim-airline/vim-airline'
"Plug 'airblade/vim-gitgutter'
"Plug 'puremourning/vimspector'
"Plug 'easymotion/vim-easymotion'
call plug#end()

""color
"let g:terminal_color_0  = '#000000'
"let g:terminal_color_1  = '#FF5555'
"let g:terminal_color_2  = '#50FA7B'
"let g:terminal_color_3  = '#F1FA8C'
"let g:terminal_color_4  = '#BD93F9'
"let g:terminal_color_5  = '#FF79C6'
"let g:terminal_color_6  = '#8BE9FD'
"let g:terminal_color_7  = '#BFBFBF'
"let g:terminal_color_8  = '#4D4D4D'
"let g:terminal_color_9  = '#FF6E67'
"let g:terminal_color_10 = '#5AF78E'
"let g:terminal_color_11 = '#F4F99D'
"let g:terminal_color_12 = '#CAA9FA'
"let g:terminal_color_13 = '#FF92D0'
"let g:terminal_color_14 = '#9AEDFE'


""back dir
"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
""silent !mkdir -p ~/.config/nvim/tmp/sessions
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
	"set undofile
	"set undodir=~/.config/nvim/tmp/undo,.
"endif


""debug
"let g:vimspector_enable_mappings = 'HUMAN'
"nnoremap <leader>da :call vimspector#Launch() <CR>
"nnoremap <leader>dx :call vimspector#Reset() <CR>

""easymotion
"nmap ss <Plug>(easymotion-overwin-line)
"nmap nn <Plug>(easymotion-overwin-w)
"nmap vv <C-v>

"inoremap <expr> <cr> pumvisible() ? (complete_info()["selected"] != "-1" ? "\<C-y>" : "\<Down>\<C-y>"): "\<C-g>u\<CR>"
"nmap <leader>u <C-o>

""nnoremap <silent> gd :Lspsaga preview_definition<CR>
""nnoremap <silent> gs :Lspsaga signature_help<CR>

"nnoremap <leader>o <cmd>Telescope find_files<cr>
"nnoremap <leader>l <cmd>Telescope current_buffer_fuzzy_find<cr>
"nnoremap <leader>hh <cmd>Telescope oldfiles<cr>
"let g:compe = {}
"let g:compe.enabled = v:true
"let g:compe.autocomplete = v:true
"let g:compe.debug = v:false
"let g:compe.min_length = 1
"let g:compe.preselect = 'enable'
"let g:compe.throttle_time = 80
"let g:compe.source_timeout = 200
"let g:compe.resolve_timeout = 800
"let g:compe.incomplete_delay = 400
"let g:compe.max_abbr_width = 100
"let g:compe.max_kind_width = 100
"let g:compe.max_menu_width = 100
"let g:compe.documentation = v:true
"let g:compe.source = {}
"let g:compe.source.nvim_lsp = v:true


""edit position
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""ban auto #
"augroup Format-Options
	"autocmd!
	"autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	"" This can be done as well instead of the previous line, for setting formatoptions as you choose:
	"autocmd BufEnter * setlocal formatoptions=crqn2l1j
"augroup END

"lua << EOF
"local on_attach = function(client, bufnr)
  "local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  "local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  "buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  "local opts = { noremap=true, silent=true }
  "buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
"end
"lspconfig = require'lspconfig'
"lspconfig.clangd.setup{
	"cmd = {
		""clangd",
		""--compile-commands-dir=.vscode",
		""--completion-style=detailed",
		""--background-index",
		""-j=12",
		""--query-driver=/usr/local/opt/llvm/bin/clang++",
		""--clang-tidy",
		""--clang-tidy-checks=performance-*,bugprone-*",
		""--all-scopes-completion",
		""--header-insertion=iwyu",
		""--pch-storage=disk"
	"},
	"filetypes = { "c", "cpp", "objc", "objcpp" },
	"on_attach = on_attach,
	"root_dir = lspconfig.util.root_pattern(".vscode",".git")
"}
"lspconfig.vimls.setup{}
"require('telescope').setup{
"defaults = {
	"path_display = {
		"'tail'
		"},
	"}
"}

"EOF
