return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"andrew-george/telescope-themes",
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("themes") -- Theme selector via Telescope (telescope-themes)

			-- Keymaps for telescope
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find in file" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find with live grep" })
			vim.keymap.set(
				"n",
				"<leader>fb",
				builtin.current_buffer_fuzzy_find,
				{ desc = "Find in current buffer with grep" }
			)
			vim.keymap.set("n", "<leader>fB", builtin.buffers, { desc = "Find in buffer" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorted = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")
		end,
	},
	-- clipboard registry manager
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
		end,
	},
}
