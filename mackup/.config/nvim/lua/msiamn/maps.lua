local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end
map('n', 'x', '"_x')

-- Increment/decrement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- Delete a word backwards
map('n', 'dw', 'vb"_d')

-- Select all
map('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
map('n', 'te', ':tabedit<CR>')
-- Split window
map('n', 'ss', ':split<Return><C-w>w')
map('n', 'sv', ':vsplit<Return><C-w>w')
map('n', 'sd', '<C-w>c')
-- Move window
map('n', '<Space>', '<C-w>w')
map('', 'sh', '<C-w>h')
map('', 'sk', '<C-w>k')
map('', 'sj', '<C-w>j')
map('', 'sl', '<C-w>l')

-- Resize window
map('n', '<C-w><left>', '<C-w><')
map('n', '<C-w><right>', '<C-w>>')
map('n', '<C-w><up>', '<C-w>+')
map('n', '<C-w><down>', '<C-w>-')

-- visual mode key binding
-- map('v', '>', 'g>')
-- map('v', '<', 'g<')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

map('n', '<C-t>', ':LSoutlineToggle<CR>' )
map('n', '<C-h>', ':noh<CR>')
