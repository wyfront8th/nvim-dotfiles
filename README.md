## NeoVim 配置过程
配置neovim，用于开发reactjs....

## 1.1 下载软件
```bash
brew install iterm2
brew install node
brew install neovim
//安装字体
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font --cask
```
zsh shell配置文件的加载顺序是：zshenv(shell的path环境)，zsherc(shell的个性化设置)

- **安装oh-my-zsh**
```typescript
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
oh-my-zsh的插件
[romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k) zsh主题
[zsh-users/zsh-autosuggestions ](https://github.com/zsh-users/zsh-autosuggestions)指令自动完成
[zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)  指令颜色
autojump跳转
```
brew install autojump

Add the following line to your ~/.bash_profile or ~/.zshrc file:
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
```

- **安装fish shell**
```bash
brew install fish
```
切换shell
```bash
chsh -s /usr/local/bin/fish
```
## 1.2. 配置neovim插件概览

-  **包管理插件**
	- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) 插件包管理软件 
-  **颜色插件**
	- [catppuccin/nvim](https://github.com/catppuccin/nvim) 支持透明背景
 	- [Tsuzat/NeoSolarized.nvim: ](https://github.com/Tsuzat/NeoSolarized.nvim)透明色彩 
-  **自动补全插件**
 	- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) 代码自动完成引擎
 	- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)  neovim内建的LSP，为nvim-cmp引擎提供补全数据
 	- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) 缓冲区，为nvim-cmp引擎提供补全数据 
-  **代码片段**
	- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) 代码片段引擎（Snippet Engine）
	- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) 常用代码片段
	- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) 代码片段自动完成 
-  **LSP服务管理插件**
	- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) 
-  **LSP服务器配置**
	- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)  安装LSP服务
	- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                     LSP服务配置
	- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)                         LSP提示界面
	- [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim)                          LSP代码提示显示
-  UI及**辅助工具**
	- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) 状态栏
	- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)   树状文件浏览器
	- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  文件查找
	- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) 缩进线
	- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) 标签栏
	- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) 在neovim中打开终端
	- [terrortylor/nvim-comment: ](https://github.com/terrortylor/nvim-comment)注释工具
	- [norcalli/nvim-colorizer.lua:](https://github.com/norcalli/nvim-colorizer.lua) 颜色代码显示 
	- [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) 代码折叠
-  **代码高亮和格式化**
	- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) 代码格式化
	- [MunifTanjim/prettier.nvim](https://github.com/MunifTanjim/prettier.nvim) 代码格式化
	-[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 代码高亮 

## 1.3 NeoVim配置文件结构
```
├── init.lua
└── lua
    └── wyfront8th
        ├── base.lua
        ├── colorscheme.lua
        ├── keymaps.lua
        ├── nightfox-color.lua
        ├── packer.lua
        └── plugins
            ├── autopairs.lua
            ├── bufferline.lua
            ├── indent-blankline.lua
            ├── lsp
            │   ├── cmp.lua
            │   ├── lspconfig.lua
            │   ├── lspsaga.lua
            │   ├── mason.lua
            │   └── null-ls.lua
            ├── lualine.lua
            ├── nvim-tree.lua
            ├── telescope.lua
            ├── toggleterm.lua
            └── treesitter.lua
```
## 1.4 基础配置 init.lua及base.lua
`init.lua`是为了加载我们建立的配置文件，常见内容
```lua
require("wyfront8th.basic.lua")
```

`base.lua`是设定neovim的基本配置，例如缩进、语法高亮等
```lua
vim.cmd('autocmd!')

-- 设定文件格式
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
-- 设定行号
vim.opt.number = true
vim.opt.title = true
-- tabs键和缩进
vim.opt.tabstop = 2        --tabs占多少空格
vim.opt.shiftwidth = 2     --缩进宽度
vim.opt.expandtab = true   --tab展开为空格
vim.opt.autoindent = true  --开始新行时从当前行复制缩进
vim.opt.smartindent = true 
vim.opt.smarttab = true
-- 文件备份
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.showcmd = true
vim.opt.scrolloff = 10
--预览命令结果
vim.opt.inccommand = 'split'
--ui
vim.opt.cursorline = true
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.g.completeopt = 'menu, menuone, noselect, noinsert'

vim.opt.mouse = 'a'

-- 显示左侧图标指示列
vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("InsertLeave",{
  pattern='*',
  command = "set nopaste"
})

vim.opt.clipboard:append{'unnamedplus'}
```
`keymaps.lua`是键盘快捷键的设置
```lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('i', 'jj', '<ESC>', opts)
map('n', '<leader>q',':q<cr>',opts)
map('n', '<leader>Q',':q!<cr>',opts)

map('n', '<leader>w',':w<cr>',opts)

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('', 'wh', '<C-w>h')
keymap.set('', 'wk', '<C-w>k')
keymap.set('', 'wj', '<C-w>j')
keymap.set('', 'wl', '<C-w>l')

-- Resize window
keymap.set('n', 'gl', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
```
## 1.4 设置插件管理-packer.nvim 
```lua
local status, packer = pcall(require, "packer")

if not status then
  print("Packer is not installed")
  return
end

return packer.startup({
  function(use)
    -- 插件核心库
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    
    -- 主题色
    --use 'Tsuzat/NeoSolarized.nvim'
    --use 'EdenEast/nightfox.nvim'
    use {
    	'svrana/neosolarized.nvim',
    	requires = { 'tjdevries/colorbuddy.nvim' }
  	}
    -- 状态栏 和 tab标签
    use 'nvim-lualine/lualine.nvim'
    -- use { 'akinsho/bufferline.nvim', tag = "v3.*",
    --   requires = 'nvim-tree/nvim-web-devicons'
    -- }
    
    -- 自动完成
    use 'hrsh7th/nvim-cmp' -- 自动完成引擎
    use 'hrsh7th/cmp-buffer' -- buffer源
    use 'hrsh7th/cmp-nvim-lsp' -- LSP源
    use 'L3MON4D3/LuaSnip' -- 代码片段引擎
    use 'saadparwaiz1/cmp_luasnip' --代码片段源
    -- LSP(语言服务协议)配置
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim' --语言服务管理插件
    use 'williamboman/mason-lspconfig.nvim'
    use 'onsails/lspkind-nvim' --lsp界面
    use 'glepnir/lspsaga.nvim' --lsp界面
    
    -- 格式化代码
    use 'jose-elias-alvarez/null-ls.nvim

    -- treesitter能构建一个语法解析器，为源文件构建语法树
    -- nvim-treesitter是为用提供简单使用nvim中的
    -- treesitter提供接口，比如语法高亮
    use 'nvim-treesitter/nvim-treesitter'

    -- 辅助工具
    use 'windwp/nvim-autopairs'  --自动匹配
    use 'nvim-telescope/telescope.nvim' -- 文件查找工具
    use 'nvim-telescope/telescope-file-browser.nvim' --浏览器方式
    use 'lukas-reineke/indent-blankline.nvim' -- blankline
    --use 'nvim-tree/nvim-tree.lua'-- 树状文件浏览工具
    use { "akinsho/toggleterm.nvim", tag = '*' } --命令行
    use 'numToStr/Comment.nvim' --注释
    use 'norcalli/nvim-colorizer.lua' --颜色预览

  end,
  config = {
    -- 最大并发数
    max_jobs = 6,
    -- 自定义github方式
    git = {
      clone_timeout = 100,
      default_url_format = "git@github.com:%s"
    },
    display = {
    	-- 使用浮动窗口显示
    	open_fn = function()
    		return require("packer.util").float({ border = "single" })
    	end,
    },
  },
})
```
## 1.5 设置主题
```lua
local status, n = pcall(require, "neosolarized")
if (not status) then return end

n.setup({
  comment_italics = true,
})

local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new('black', '#000000')
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
```

```lua
require('nightfox').setup {
  options = {
    transparent = true,
  }
}
vim.cmd('colorscheme nightfox')
```
## 1.6 设置状态栏
```lua
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
```
## 1.7 配置LSP客户端
```lua
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.sourcekit.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
```

## 1.8 CMP自动完成引擎配置
cmp自动完成引擎，需要使用到 `lspkind` `luasnip`
```lua
local cmp = require 'cmp'
local lspkind = require 'lspkind'

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),

    formatting = {
      format = lspkind.cmp_format({ with_text = false,
          maxwidth = 50 })
    },

  })

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})


vim.cmd [[
set completeopt=menuone,noinsert,noselect
highlight! default link CmpItemKind CmpItemMenuDefault
]]
```
## 1.9 Mason-LSP服务管理工具
```lua
require("mason").setup({
	ui = { border = "rounded" },
})
require("mason-lspconfig").setup({
	ensure_installed = {},
})
```
## 1.10 格式化代码- null-ls
```lua
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	sources = {
    -- 在Mason中安装prettierd stylua eslint_d服务 
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
	},
  -- 保存文件的时候自动格式化
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
```
## 1.11 lsp辅助工具-lspsaga
```lua
require("lspsaga").init_lsp_saga({
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

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
```

## 1.12 语法高亮- nvim-treesitter
```lua
local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "fish",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "graphql",
    "regex",
    "typescript",
    "javascript",
  },
  --- Automatically install missing parsers when entering buffer
  auto_install = true,

  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
```

## 1.13 文件查找-telescope.nvim
```lua
local telescope = require("telescope")

local builtin = require("telescope.builtin")

local actions = require("telescope.actions")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.setup({
	defaults = {
		mappings = {
			n = { ["q"] = actions.close },
		},
	},
	pickers = {
		find_files = { hidden = true },--显示隐藏文件
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			hidden = true, --显示隐藏文件
		},
	},
})
telescope.load_extension("file_browser")

vim.keymap.set("n", ";f", builtin.find_files, {})
vim.keymap.set("n", ";g", builtin.live_grep, {})
vim.keymap.set("n", ";b", builtin.buffers, {})
vim.keymap.set("n", "sf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		--hidden = true,
		grouped = true,
		--previewer = false,
		initial_mode = "normal",
		--layout_config = { height = 40 },
	})
end)
```

## 1.14 自动匹配- nvim-autopairs nvim-ts-autotag
```lua
require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
```
## 1.15 缩进线- indent-blankline
```lua
require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}
```
## 1.16 命令窗口- toggleterm
```lua
require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  direction = 'float'
}
```
## 1.17 注释- Comment.nvim
```lua
require('Comment').setup()
```

## 1.18 颜色代码高亮- nvim-colorizer.lua
```lua
require'colorizer'.setup()
```

## 1.19 树状浏览器- nvim-tree
```lua
require("nvim-tree").setup({})
vim.api.nvim_set_keymap("n", 
  "<C-h>", 
  ":NvimTreeToggle<cr>", 
  { silent = true, noremap = true }
)
```
