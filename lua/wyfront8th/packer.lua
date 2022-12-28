local status, packer = pcall(require, "packer")
if not status then
	print("packer is not installed")
	return
end
--vim.cmd [[packadd packer.nvim]]
return packer.startup({
	function(use)
		-- 插件必须得库
		use("wbthomason/packer.nvim")
		use("nvim-lua/plenary.nvim")
		use("kyazdani42/nvim-web-devicons")

		-- 颜色主题
		use({
			"svrana/neosolarized.nvim",
			requires = { "tjdevries/colorbuddy.nvim" },
		})
		-- 状态栏
		use("nvim-lualine/lualine.nvim")
		-- 语法高亮
		use("nvim-treesitter/nvim-treesitter")
		-- 自动完成
		use("hrsh7th/nvim-cmp") --自动完成引擎
		use("hrsh7th/cmp-nvim-lsp") --LSP源
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-cmdline")
		use("L3MON4D3/LuaSnip") --代码片段引擎
		use("saadparwaiz1/cmp_luasnip") --代码片段源
		-- LSP 配置
		use("neovim/nvim-lspconfig")
		use("williamboman/mason.nvim") --管理LSP服务
		use("williamboman/mason-lspconfig.nvim")
		use("onsails/lspkind-nvim")
		use("glepnir/lspsaga.nvim")
		-- 格式化工具
		use("jose-elias-alvarez/null-ls.nvim")
		-- 辅助工具
		use("windwp/nvim-autopairs") --自动匹配符号
		use("lukas-reineke/indent-blankline.nvim") -- 缩进线
		use("nvim-telescope/telescope.nvim") --文件快速查找
		use({ "nvim-telescope/telescope-file-browser.nvim" })
		use("akinsho/toggleterm.nvim")
		use({ "numToStr/Comment.nvim" })
		use({ "akinsho/bufferline.nvim", tag = "v3.*" })
	end,
	--解决github慢的问题
	config = {
		max_jobs = 6,
		git = {
			clone_timeout = 100,
			default_url_format = "git@github.com:%s",
		},
	},
})
