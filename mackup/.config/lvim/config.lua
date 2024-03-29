--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"
lvim.transparent_window = true

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
-- vim.opt.mouse = ""
-- vim.opt.relativenumber = true
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.keys.normal_mode["<S-k>"] = ":lua vim.lsp.buf.hover()<CR>"
lvim.keys.normal_mode["sl"] = "<C-w>l"
lvim.keys.normal_mode["sh"] = "<C-w>h"
lvim.keys.normal_mode["sj"] = "<C-w>j"
lvim.keys.normal_mode["sk"] = "<C-w>k"
lvim.keys.normal_mode["sd"] = "<C-w>c"
lvim.keys.normal_mode["ss"] = ":split<cr>"
lvim.keys.normal_mode["sv"] = ":vsplit<cr>"
lvim.keys.normal_mode["gd"] = ":lua vim.lsp.buf.definition()<CR>"
lvim.keys.normal_mode["gr"] = ":Telescope lsp_references<CR>"
lvim.keys.normal_mode[";"] = ":"
-- lvim.keys.normal_mode["gl"] = ":Lspsaga lsp_finder<CR>"
-- lvim.keys.normal_mode["gp"] = ":Lspsaga peek_definition<CR>"
-- lvim.keys.normal_mode["<leader>a"] = ":Lspsaga code_action<CR>"
lvim.builtin.which_key.mappings["a"] = {
  ":lua vim.lsp.buf.code_action()<CR>", "Code Actions"
}
lvim.builtin.which_key.mappings["F"] = {
  ":Telescope flutter commands<CR>", "Flutter Commands"
}
lvim.keys.insert_mode["jj"] = "<esc>"

lvim.builtin.project.detection_methods = { "lsp" }
lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pubspec.yaml" }
-- lvim.builtin.project.manual_mode = true

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-c>"] = actions.close,
  },
  -- for normal mode
  n = {
    ["q"] = actions.close,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["lr"] = {
  ":lua vim.lsp.buf.rename()<CR>",
  "Rename"
}

lvim.builtin.which_key.mappings["j"] = {
  name = "+Jump",
  j = { "<cmd>:HopChar1<cr>", "Jump Character" },
  l = { "<cmd>:HopLine<cr>", "Jump Line" },
  w = { "<cmd>:HopWord<cr>", "Jump Word" },
}

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.rainbow.enable = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "dart"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.cmp.confirm_opts.select = true

-- generic LSP settings

require("luasnip/loaders/from_vscode").lazy_load()

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false


-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  { command = "tidy", filetypes = { "html, xml" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    -- cmd = "TroubleToggle",
  },
  { 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  { 'tpope/vim-surround' },
  { 'glepnir/lspsaga.nvim' },
  { 'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  { "Nash0x7E2/awesome-flutter-snippets" },
  { "RobertBrunhage/flutter-riverpod-snippets" },
  { "ArkrootHQ/freezed-snippets" },
  { "p00f/nvim-ts-rainbow" },
}

require("flutter-tools").setup {
  widget_guides = {
    enabled = true,
  },
  lsp = {
    cmd = {
      "dart", "language-server", "--lsp"
    },
  },

  on_attach = function(client, bufnr)
    lvim.lsp.common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
  on_init = lvim.lsp.common_on_init,
  -- capabilities = lvim.lsp.null_ls,
  -- In config section for the debugger
  debugger = {
    enabled = true,
    configurations = function(path)
      local debugger_dir = path.join(vim.fn.stdpath("cache"), "dart-code")
      local debugger_path = path.join(debugger_dir, "out", "dist", "debug.js")
      local dap = require("dap")
      dap.adapters.dart = {
        type = "executable",
        command = "node",
        args = { debugger_path, "flutter" },
      }
      -- Other configuration herek
    end,
  }
}

require("telescope").load_extension("flutter")
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
