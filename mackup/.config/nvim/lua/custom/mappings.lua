local M = {}
local opts = {
  nowait = true,
  silent = true,
}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["K"] = { ":lua vim.lsp.buf.hover()<cr>", "vim lsp hover", opts = opts },
    ["gd"] = { ":lua vim.lsp.buf.definition()<cr>", "vim lsp definition", opts = opts },
    ["<leader>F"] = { ":lua vim.lsp.buf.format()<cr>", "vim lsp format", opts = opts },
    ["gD"] = { ":Lspsaga lsp_finder<cr>", "vim lsp references", opts = opts },
    ["gh"] = { ":Lspsaga show_line_diagnostics<cr>", "vim lsp references", opts = opts },
    ["gp"] = { ":Lspsaga peek_definition<cr>", "vim lsp peek_definitios", opts = opts },
    ["<leader>a"] = { ":Lspsaga code_action<cr>", "vim lsp code_action", opts = opts },
    ["<leader>rn"] = { ":Lspsaga rename<cr>", "vim lsp rename", opts = opts },
    ["<leader>;"] = { ':lua require("nvterm.terminal").toggle "float"<cr>', "vim open floaterm", opts = opts },
    ["<leader>'"] = { ':lua require("nvterm.terminal").toggle "horizontal"<cr>', "vim open horizontal term", opts = opts },
    ["ss"] = { ":split<cr>", "vim split", opts = opts },
    ["sv"] = { ":vsplit<cr>", "vim vsplit", opts = opts },
    ["sd"] = { "<C-w>c", "vim window close", opts = opts },
    ["sj"] = { "<C-w>j", "vim window focus down", opts = opts },
    ["sk"] = { "<C-w>k", "vim window focus up", opts = opts },
    ["sl"] = { "<C-w>l", "vim window focus right", opts = opts },
    ["sh"] = { "<C-w>h", "vim window focus left", opts = opts },
    ["<leader>h"] = { ":HopWord<cr>", "hop word", opts = opts },
    ["<leader>l"] = { ":HopLine<cr>", "hop line", opts = opts },
    ["<leader>s"] = { ":HopChar1<cr>", "hop char", opts = opts },
    ["<leader>o"] = { ":FlutterOutlineToggle<cr>", "Flutter outline", opts = opts },
  },
}

-- more keybinds!

return M
