vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = {noremap = true,silent = true}

map('i', 'jj', '<ESC>', opts)
map('n', '<leader>q', ':q<cr>',opts)
map('n', '<leader>w', ':w<cr>',opts)
