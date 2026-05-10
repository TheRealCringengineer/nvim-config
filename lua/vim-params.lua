vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set signcolumn=yes:1")      -- Fucking auto looks like shit
vim.cmd("set clipboard=unnamedplus") -- Enables copy paste from os

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Relative + absolute
vim.opt.relativenumber = true
vim.wo.number = true -- Or relativenumber

vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("", "<esc>", "<esc><cmd>noh<CR>", { noremap = true })

