return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			-- make sure to install it with Mason too
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,
				-- javascript
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.formatting.prettier,
        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort, -- for formatting import
			},
		})

		vim.keymap.set("n", "<leader>fm", function ()
		  vim.lsp.buf.format {timeout = 5000}
    end, { desc = "format code" })
	end,
}
