local keymap = vim.keymap.set
local saga = require("lspsaga")

saga.init_lsp_saga({
	border_style = "single",
	symbol_in_winbar = {
		enable = true,
	},
	code_action_lightbulb = {
		enable = true,
	},
	show_outline = {
		win_width = 50,
		auto_preview = false,
	},
})

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
-- Outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
