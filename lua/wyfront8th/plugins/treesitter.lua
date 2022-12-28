require('nvim-treesitter.configs').setup{
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true,
    disable = {}
  },
  sync_install = true,
  ensure_installed = {
    'tsx',
    'json',
    'css',
    'html',
    'lua',
    'typescript',
    'javascript',
    'python'
  },
  auto_install = true,
}
