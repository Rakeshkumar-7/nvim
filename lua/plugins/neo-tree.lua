return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
  },
  config = function()
    vim.keymap.set("n", "<leader>e", ":Neotree position=float <CR>", { desc = "neo-tree floating" })
    vim.keymap.set("n", "<leader>E", ":Neotree toggle=true position=left <CR>", { desc = "neo-tree left" })
  end,
}
