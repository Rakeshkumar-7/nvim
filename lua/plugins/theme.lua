return {
  { "EdenEast/nightfox.nvim", lazy = false, name = "theme",      priority = 1000 },
  { "catppuccin/nvim",        lazy = false, name = "catppuccin", priority = 1000 },
  {
    "https://github.com/zaldih/themery.nvim",
    config = function()
      local themery = require("themery")
      themery.setup({
        themes = {
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
        },
        livePreview = true,
      })

      vim.keymap.set("n", "<leader>ft", ":Themery<CR>", { desc = "Find/Change theme" })
    end,
  },
}
