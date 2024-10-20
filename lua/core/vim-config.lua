vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.cmd("set termencoding=utf-8")
vim.env.LANG = "en_US.UTF-8"
vim.env.LC_ALL = "en_US.UTF-8"
vim.env.LC_CTYPE = "en_US.UTF-8"

vim.opt.relativenumber = true
vim.lsp.set_log_level("debug")
