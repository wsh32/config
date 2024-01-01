return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    dependencies = "chriskempson/base16-vim",
    config = function()
      require("tokyonight").setup({
        style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day", -- The theme is used when the background is set to light
        transparent = false, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "moon", -- style for sidebars, see below
          floats = "moon", -- style for floating windows
        },
        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false, -- dims inactive windows
        lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        -- on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        -- on_highlights = function(highlights, colors) end,
      })

      vim.cmd([[colorscheme tokyonight]])

      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#00005f" })
      vim.api.nvim_set_hl(0, "LineNr", { fg = "lightyellow" })

      -- tokens
      vim.api.nvim_set_hl(0, "@lsp.type.comment", { link = "@comment" })
      vim.api.nvim_set_hl(0, "@lsp.typemod.variable.fileScope", { link = "Bold" })
      vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly", { link = "Underlined" })
      vim.api.nvim_set_hl(0, "@lsp.typemod.variable.functionScope", { fg = "#468a6d" })
      vim.api.nvim_set_hl(0, "@lsp.typemod.variable.local", { fg = "#468a6d" })
      vim.api.nvim_set_hl(0, "@lsp.typemod.variable.globalScope", { fg = "#b9675d" })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        -- colors = {
        --     palette = {},
        --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        -- },
        -- overrides = function(colors) -- add/modify highlights
        --     return {}
        -- end,
        -- theme = "wave",
        -- background = {
        --     dark = "wave",
        --     light = "lotus"
        -- },
      })

      vim.cmd([[colorscheme kanagawa-wave]])
    end,
    enabled = false,
  },
}
