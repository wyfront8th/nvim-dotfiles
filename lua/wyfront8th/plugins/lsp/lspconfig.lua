local nvim_lsp = require("lspconfig")

local protocol = require("vim.lsp.protocol")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- emmet
nvim_lsp.emmet_ls.setup({})
-- html服务
nvim_lsp.html.setup({
	capabilities = capabilities,
})
-- css
nvim_lsp.cssls.setup({
	capabilities = capabilities,
})
-- 添加typescripte javascript 服务
nvim_lsp.tsserver.setup({
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})
--添加tailwindcss
nvim_lsp.tailwindcss.setup({
	capabilities = capabilities,
})
-- 配置lua LSP服务
nvim_lsp.sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})
