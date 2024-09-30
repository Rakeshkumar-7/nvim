-- Clears search highlight
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>", { desc = "clears search highlights" })

-- Keep the cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
