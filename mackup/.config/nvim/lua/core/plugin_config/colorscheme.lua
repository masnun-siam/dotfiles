vim.o.termguicolors = true
vim.cmd [[ colorscheme tokyonight ]]

require('tokyonight').setup {
  transparent = vim.g.transparent_enabled,
}
