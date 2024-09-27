return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- General
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Symbol Info / Doc" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definitions" })
      vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "Goto declaration" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto references" })
      vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, { desc = "Goto type def" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Code Diagnostics" })
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {},
    opts = {
      auto_install = true,
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "ts_ls" },
        automatic_installation = true,
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
}
