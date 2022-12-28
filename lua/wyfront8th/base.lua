--配置基础设置
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

--行号
vim.opt.number = true
vim.opt.title = true
--缩进
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- 不允许备份
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.showcmd = true
vim.opt.scrolloff = 10

vim.opt.inccommand = "split"
-- ui
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.updatetime = 300
--vim.opt.timeoutlen = 500
vim.opt.signcolumn = "yes"
vim.g.completeopt = "menu,menuone,noselect,noinsert"

--使用系统剪贴板
vim.opt.clipboard:append({ "unnamedplus" })
