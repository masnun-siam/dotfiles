local M = {}
local opts = {
  nowait = true,
  silent = true,
}

M.general = {
  x = {
    ["<leader>a"] = { ":Lspsaga code_action<cr>", "vim lsp code_action", opts = opts },
  },
  v = {
    ["<leader>a"] = { ":Lspsaga code_action<cr>", "vim lsp code_action", opts = opts },
  },
  n = {
    -- [";"] = { ":", "command mode", opts = { nowait = true } },
    ["K"] = { ":lua vim.lsp.buf.hover()<cr>", "vim lsp hover", opts = opts },
    ["gd"] = { ":lua vim.lsp.buf.definition()<cr>", "vim lsp definition", opts = opts },
    ["<leader>F"] = { ":lua vim.lsp.buf.format()<cr>", "vim lsp format", opts = opts },
    ["gl"] = { ":Lspsaga lsp_finder<cr>", "vim lsp references", opts = opts },
    ["gh"] = { ":Lspsaga show_line_diagnostics<cr>", "vim lsp line diagnostics", opts = opts },
    ["gp"] = { ":Lspsaga peek_definition<cr>", "vim lsp peek_definitios", opts = opts },
    ["<leader>w"] = { ":Telescope diagnostics<cr>", "vim lsp diagnostics", opts = opts },
    [";f"] = { ":Telescope find_files<cr>", "telescope find_files", opts = opts },
    [";e"] = { ":Telescope diagnostics<cr>", "telescope diagnostics", opts = opts },
    ["<leader>fl"] = { ":Telescope flutter commands<cr>", "telescope flutter commands", opts = opts },
    ["<leader>a"] = { ":Lspsaga code_action<cr>", "vim lsp code_action", opts = opts },
    ["<leader>j"] = { ":Lspsaga diagnostic_jump_next<cr>", "vim lsp next diagnostic", opts = opts },
    ["<leader>k"] = { ":Lspsaga diagnostic_jump_prev<cr>", "vim lsp previous diagnostic", opts = opts },
    ["<leader>t"] = { ':lua require("nvterm.terminal").toggle "float"<cr>', "vim open floaterm", opts = opts },
    ["<leader>T"] = { ':lua require("nvterm.terminal").toggle "horizontal"<cr>', "vim open horizontal term", opts = opts },
    ["<leader>/"] = { ':noh<cr>', "remove highlight", opts = opts },

    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },
    ["L"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["H"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    ['sf'] = { ':Lf<cr>', "open lf", opts = opts },

    -- ["sf"] = {
    --   function()
    --     local function telescope_buffer_dir()
    --       return vim.fn.expand('%:p:h')
    --     end
    --     require('telescope').extensions.file_browser.file_browser({
    --       path = "%:p:h",
    --       cwd = telescope_buffer_dir(),
    --       respect_gitignore = false,
    --       hidden = true,
    --       grouped = true,
    --       previewer = false,
    --       initial_mode = "normal",
    --       layout_config = { height = 40 }
    --     })
    --   end,
    --   "open telescope file browser",
    -- },

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
