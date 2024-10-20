return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Borrowed from https://github.com/sachinsenal0x64/dotfiles/blob/c8038c4d68db5be349da63e27072b715795bb374/nvim/init.lua#L2057

		-- DASHBOARD HEADER
		local function getGreeting(name)
			local tableTime = os.date("*t")
			local hour = tableTime.hour
			local greetingsTable = {
				[1] = "🦉  Night owl",
				[2] = "🌅  Good morning",
				[3] = "🕛  Good afternoon",
				[4] = "🌇  Good evening",
				[5] = "🌃  Night owl",
			}
			local greetingIndex = 0
			if hour == 23 or hour < 7 then
				greetingIndex = 1
			elseif hour < 12 then
				greetingIndex = 2
			elseif hour >= 12 and hour < 18 then
				greetingIndex = 3
			elseif hour >= 18 and hour < 21 then
				greetingIndex = 4
			elseif hour >= 21 then
				greetingIndex = 5
			end
			return greetingsTable[greetingIndex] .. ", " .. name
		end

		local logo = [[

⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠤⠤⠄⢀⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⠔⠈⠄⠀⠀⠀⠀⠀⠀⠑⢄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡐⠁⢠⢰⣊⣄⣤⣄⣀⠀⠀⠀⠀⠑⡀⠀⠀⠀
⠀⠀⠀⠀⢀⠰⠐⠂⠉⠉⠉⣀⠉⠉⠛⠛⠶⣄⠀⠀⢱⠀⠀⠀
⠀⠀⡠⢐⠕⠁⠀⣠⣶⢿⡟⠘⣿⣿⣶⣤⡀⠈⠙⢄⢸⠀⠀⠀
⠀⠌⠀⠀⠀⢠⣾⣿⠏⢸⠇⠀⠘⣿⠹⣿⣿⣖⢄⢀⠑⠄⠀⠀
⠸⠀⢀⡘⡀⣿⣿⢿⢀⠈⠄⠈⠀⠇⣀⢽⣿⣿⣧⠡⠀⠈⢂⠀
⠀⠣⠈⣌⡰⢻⣿⠸⢎⡉⠣⠀⠈⠐⢡⡈⠸⣿⣿⡆⠰⠀⠀⡆
⠀⠀⠉⠢⣐⠁⢿⡆⠢⠥⠂⡃⠀⠐⠠⠔⠁⣿⢭⡟⠺⠀⢀⠇
⠀⠀⠀⠀⠀⠉⠊⢿⠀⢂⠤⡤⠀⠰⡀⠠⡰⠾⣋⣈⠶⠐⠊⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠑⠤⢀⡀⢁⣀⠬⠊⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣧⢀⠀⡀⣨⣿⣶⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠠⠁⣿⣿⣿⣧⠀⣰⣿⣿⣿⡇⡑⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢡⠀⠀⠀⠀

    ]]

		local userName = "Rakesh"
		local greeting = getGreeting(userName)
		local marginBottom = 0

		-- Split logo into lines
		local logoLines = {}
		for line in logo:gmatch("[^\r\n]+") do
			table.insert(logoLines, line)
		end

		-- Calculate padding for centering the greeting
		local logoWidth = logo:find("\n") - 1 -- Assuming the logo width is the width of the first line
		local greetingWidth = #greeting
		local padding = math.floor((logoWidth - greetingWidth) / 2)

		-- Generate spaces for padding
		local paddedGreeting = string.rep(" ", padding) .. greeting

		-- Add margin lines below the padded greeting
		local margin = string.rep("\n", marginBottom)

		-- Concatenate logo, padded greeting, and margin
		local adjustedLogo = logo .. "\n" .. paddedGreeting .. margin

		dashboard.section.header.val = vim.split(adjustedLogo, "\n")

		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
			dashboard.button("s", "  Settings", ":e $HOME/AppData/Local/nvim/init.lua<CR>"),
			dashboard.button("p", "  Projects", ":e D:/Projects <CR>"),
			dashboard.button("d", "󱗼  Dotfiles", ":e $HOME/dotfiles <CR>"),
			dashboard.button("q", "󰿅  Quit", "<cmd>qa<CR>"),
		}

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			desc = "Add Alpha dashboard footer",
			once = true,
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val =
					{ " ", " ", " ", " Loaded " .. stats.count .. " plugins  in " .. ms .. " ms " }
				dashboard.section.header.opts.hl = "DashboardFooter"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
