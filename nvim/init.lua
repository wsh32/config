-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "chriskempson/base16-vim" },
})

vim.cmd([[syntax on]])

vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.mouse = "a"
vim.opt.hidden = true

-- disable bells
vim.opt.errorbells = false
vim.opt.visualbell = false

-- tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = vim.fn.expand("$HOME") .. "/.vimfiles/undodir"
vim.opt.undofile = true
vim.opt.showmatch = true
vim.opt.scrolloff = 1
vim.opt.termguicolors = true

-- base16 colorscheme
vim.g.base16colorspace = 256
local base16_shell_path = vim.fn.expand("~/.config/base16-shell")
if vim.fn.isdirectory(base16_shell_path) == 1 then
    vim.g.base16_shell_path = base16_shell_path
end
if vim.fn.filereadable(vim.fn.expand("~/.vimrc_background")) == 1 then
    vim.cmd([[source ~/.vimrc_background]])
end

vim.opt.updatetime = 300
vim.opt.ttimeoutlen = 10

vim.opt.cmdheight = 1
vim.opt.shortmess = vim.opt.shortmess + "c"

vim.opt.nrformats = vim.opt.nrformats + "alpha"
vim.opt.formatoptions = vim.opt.formatoptions + "j"

-- show whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "▷▷⋮", trail = "•", extends = "❯", precedes = "❮" }
vim.opt.shiftround = true
vim.o.showbreak = "↪ "

-- searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"

vim.opt.number = true
vim.opt.signcolumn = "yes"

vim.opt.foldlevel = 99

-- use // comment style in C/C++
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "cpp", "c" },
    command = [[set commentstring=//\ %s]],
})
