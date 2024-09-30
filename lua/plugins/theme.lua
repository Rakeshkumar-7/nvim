return {
  -- For transparent background
  { "xiyaowong/transparent.nvim", lazy = false,       priority = 1000 },
  -- Themes
  { "Tsuzat/NeoSolarized.nvim",   lazy = false,       priority = 1000 },
  { "morhetz/gruvbox",            lazy = false,       priority = 1000 },
  { "EdenEast/nightfox.nvim",     lazy = false,       name = "theme",      priority = 1000 },
  { "catppuccin/nvim",            lazy = false,       name = "catppuccin", priority = 1000 },
  { "rose-pine/neovim",           name = "rose-pine", priority = 1000 },
  -- Theme selector
  {
    "https://github.com/zaldih/themery.nvim",
    config = function()
      local themery = require("themery")
      themery.setup({
        themes = {
          {
            name = "peachpuff",
            colorscheme = "peachpuff",
          },

          {
            name = "ron",
            colorscheme = "ron",
          },
          {
            name = "carbonfox",
            colorscheme = "carbonfox",
          },
          {
            name = "nightfox",
            colorscheme = "nightfox",
          },
          {
            name = "catppuccin",
            colorscheme = "catppuccin",
          },
          {
            name = "rose pine main",
            colorscheme = "rose-pine-main",
          },
          {
            name = "rose pine moon",
            colorscheme = "rose-pine-moon",
          },
          {
            name = "rose pine dawn",
            colorscheme = "rose-pine-dawn",
          },
          {
            name = "NeoSolarized",
            colorscheme = "NeoSolarized",
          },
          {
            name = "gruvbox",
            colorscheme = "gruvbox",
          },
        },
        livePreview = true,
      })

      vim.keymap.set("n", "<leader>ft", ":Themery<CR>", { desc = "Find/Change theme" })
    end,
  },
}
