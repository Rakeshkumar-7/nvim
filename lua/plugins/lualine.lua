return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"SmiteshP/nvim-navic",
		},
		lazy = false,
		config = function()
			local lualine = require("lualine")
			lualine.setup({
				options = {
					globalstatus = true,
				},
			})
		end,
	},
}
