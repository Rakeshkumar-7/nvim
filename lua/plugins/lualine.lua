return {
  {
    "fgheng/winbar.nvim",
    lazy = false,
    config = function()
      require("winbar").setup({
        enabled = true,
        show_file_path = true,
        show_symbols = true
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "SmiteshP/nvim-navic",
      "fgheng/winbar.nvim",
    },
    lazy = false,
    config = function()
      local lualine = require("lualine")
      lualine.setup({
        options = {
          globalstatus = true,
        },
        winbar = {
          lualine_c = {
            {
              "navic",
              color_correction = nil,
              navic_opts = nil,
            },
          },
        },
      })
    end,
  },
}
