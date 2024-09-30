local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- auto update when vim opens
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("autoupdate"),
	callback = function()
		if require("lazy.status").has_updates then
			require("lazy").update({ show = false })
		end
	end,
})

-- Function to totgle between relative and absolute line numbers
local function toggle_linenumber()
	if vim.o.relativenumber == true then
		vim.o.relativenumber = false
		vim.o.number = true
	else
		vim.o.relativenumber = true
		vim.o.number = true
	end
end

require("lazy").setup({
	spec = {
		{
			{ import = "plugins" },
			{ import = "plugins.coding" },
		},
	},
	checker = { enabled = true },

	-- Relative number toggle
	vim.keymap.set("n", "<leader>tl", toggle_linenumber, { desc = "Toggle relative/absolute line number" }),

	-- Move code around
	vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up by 1" }),
  vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down by 1" }),
	vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up by 1" }),
  vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down by 1" }),
})
