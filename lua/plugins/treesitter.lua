return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"c", "cpp", "lua", "python", "java"},
        auto_install = true,
        hightlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
