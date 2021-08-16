-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "spacegray"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["vv"] = "<C-v>"
lvim.keys.normal_mode["<leader>u"] = "<C-o>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- lvim.builtin.which_key.mappings["g"] = {
--   name = "+Jump",
--   l = {"<Plug>(easymotion-overwin-line)","Jump Line"},
--   w = {"<Plug>(easymotion-overwin-w)","Jump Word"},
--   d = { "<cmd>lua vim.lsp.buf.definition()<CR>'", "Definitions" },
-- }
-- lvim.log.levels = "debug"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.telescope.defaults.path_display = {'tail'}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }
lvim.plugins = {
  {"easymotion/vim-easymotion"},
  {"skywind3000/asyncrun.vim"},
  {"puremourning/vimspector"}
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
local function setMakePrg()
  local fname = vim.fn.getcwd()
  local util = require("lspconfig").util
  local root_dir = util.root_pattern(".vscode", ".git")(fname)
  if(root_dir ~= nil)
    then
      return "setlocal makeprg="..root_dir.."/.vscode/build.sh"
    end
  return ""
end

local function setRun()
  local fname = vim.fn.getcwd()
  local util = require("lspconfig").util
  local root_dir = util.root_pattern(".vscode", ".git")(fname)
  if(root_dir ~= nil)
    then
      return "command! -bang -nargs=* -complete=file Run AsyncRun -mode=term -pos=bottom -rows=5 -close "..root_dir.."/.vscode/run.sh"
    end
  return ""
end
lvim.autocommands.custom_groups = {
  -- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  {"Filetype","objc",setMakePrg()},
  {"Filetype","objcpp",setMakePrg()},
  {"Filetype","objc",setRun()},
  {"Filetype","objcpp",setRun()},
}
-- vim.cmd("autocmd Filetype objc setlocal makeprg=/Users/bytedance/ios_bubble/.vscode/build.sh")
-- vim.cmd("autocmd Filetype objcpp setlocal makeprg=/Users/bytedance/ios_bubble/.vscode/build.sh")
vim.cmd("autocmd Filetype objcpp setlocal errorformat=%E[x]\\ %f:%l:%c:\\ %m,%-C%.%#")
vim.cmd("autocmd Filetype objc setlocal errorformat=%E[x]\\ %f:%l:%c:\\ %m,%-C%.%#")
vim.cmd("autocmd Filetype objcpp command! -bang -nargs=* -complete=file Kill silent !killall ios-deploy-custom")
vim.cmd("autocmd Filetype objc command! -bang -nargs=* -complete=file Kill silent !killall ios-deploy-custom")
vim.cmd("command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>")
vim.cmd("command! -bang -nargs=* -complete=file Stop AsyncStop!");
vim.cmd("let g:vimspector_enable_mappings = 'HUMAN'")
-- vim.cmd("nnoremap <leader>da :call vimspector#Launch() <CR>")
-- vim.cmd("nnoremap <leader>dx :call vimspector#Reset() <CR>")
-- vim.cmd("autocmd Filetype setlocal errorformat=)
