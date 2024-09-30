return {
	-- Creates pairs of (){}[]""''
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
  -- Highlights the word under the cursor
	{
		"echasnovski/mini.cursorword",
		version = false,
		config = function()
			require("mini.cursorword").setup()
		end,
	},
  -- Draws indent scope line on the left
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			local indentscope = require("mini.indentscope")
			indentscope.setup({
				draw = {
          animation = indentscope.gen_animation.none(),
					-- animation = indentscope.gen_animation.cubic({ easing = "out", duration = 50, unit = "total" }),
				},
			})
		end,
	},
}
