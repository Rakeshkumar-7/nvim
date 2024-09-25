return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic/" },
  config = function()
    local lualine = require("lualine")
    -- local navic = require("nvim-navic")

    lualine.setup({
      options = {
        globalstatus = true,
      },
    --  sections = {
    --    lualine_c = {
    --      {
    --        function()
    --          return navic.get_location()
    --        end,
    --        cond = navic.is_available,
    --      },
    --    },
    --  },
    })
  end,
}
