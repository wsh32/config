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

    -- buffer tabs
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local bufferline = require("bufferline")

            local function close_buf(buf)
                if buf == 0 then buf = vim.api.nvim_get_current_buf() end
                local current = vim.api.nvim_buf_get_name(0)
                local target = vim.api.nvim_buf_get_name(buf)
                if current ~= target then
                    vim.api.nvim_buf_delete(buf, {})
                    return
                end
                local last = vim.fn.bufnr("#")
                if vim.api.nvim_buf_is_valid(last) then
                    vim.cmd("buffer " .. last)
                elseif #vim.api.nvim_list_bufs() > 1 then
                    bufferline.cycle(-1)
                else
                    vim.cmd("buffer " .. vim.api.nvim_create_buf(true, false))
                end
                vim.api.nvim_buf_delete(buf, {})
            end

            bufferline.setup({
                options = {
                    close_command = close_buf,
                    right_mouse_command = close_buf,
                    left_mouse_command = "buffer %d",
                    max_name_length = 18,
                    max_prefix_length = 15,
                    tab_size = 5,
                    diagnostics = false,
                    show_buffer_icons = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    persist_buffer_sort = true,
                    sort_by = "relative_directory",
                    separator_style = "slant",
                },
            })

            local map = vim.keymap.set
            map("n", "<leader>q", function() close_buf(0) end)
            map("n", "<S-Tab>", "<CMD>BufferLineCycleNext<CR>")
            map("n", "<leader><S-Tab>", "<CMD>BufferLineCyclePrev<CR>")
            map("n", "<leader><S-L>", "<CMD>BufferLineMoveNext<CR>")
            map("n", "<leader><S-H>", "<CMD>BufferLineMovePrev<CR>")
            map("n", "gb", "<CMD>BufferLinePick<CR>")
        end,
    },

    -- git signs in gutter
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add          = { text = "│" },
                    change       = { text = "│" },
                    delete       = { text = "_" },
                    topdelete    = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked    = { text = "┆" },
                },
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text_pos = "eol",
                    delay = 1000,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            })
        end,
    },

    -- inline git blame
    {
        "APZelos/blamer.nvim",
        config = function()
            vim.g.blamer_enabled = 0
            vim.g.blamer_delay = 1000
            vim.g.blamer_show_in_insert_modes = 0
            vim.g.blamer_prefix = " > "
            vim.g.blamer_template = "<committer>, <committer-time> • <summary>"
            vim.g.blamer_date_format = "%y/%m/%d"
            vim.api.nvim_set_hl(0, "Blamer", { fg = "lightgrey" })
            vim.keymap.set("n", "<leader>gb", "<CMD>BlamerToggle<CR>")
        end,
    },

    -- diff viewer
    { "sindrets/diffview.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- conflict markers
    "rhysd/conflict-marker.vim",
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
