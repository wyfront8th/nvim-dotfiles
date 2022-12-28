require("bufferline").setup({})
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<leader>bn", "<Cmd>BufferLinePick<CR>", {})
-- vim.keymap.set("n", "<leader>bd", "<Cmd>BufferLinePickClose<CR>", {})

vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", {})
