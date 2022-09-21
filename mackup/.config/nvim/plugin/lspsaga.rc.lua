local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript',
    dart = 'dart'
  },
  code_action_icon = "",
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga preview_definition<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', ';a', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set("v", ";a", ":<C-U>Lspsaga code_action<CR>", opts)
