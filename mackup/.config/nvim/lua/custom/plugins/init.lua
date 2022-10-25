local overrides = require("custom.plugins.overrides")

return {

	-- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	["nvim-telescope/telescope.nvim"] = {
		-- config = function()
		--   require "plugins.configs.telescope"
		--   -- require "custom.plugins.telescope"
		-- end,
		extensions_list = {
			"themes",
			"terms",
			"file_browser",
			"flutter",
		},
	},
	-- overrde plugin configs
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["kyazdani42/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	-- Install a plugin
	["max397574/better-escape.nvim"] = {
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		config = function()
			require("custom.plugins.null-ls")
		end,
	},
	-- {
	--   after = "nvim-lspconfig",
	--   config = function()
	--     require "custom.plugins.null-ls"
	--   end,
	-- },

	-- Flutter
	["masnun-siam/flutter-tools.nvim"] = {
		requires = "nvim-lua/plenary.nvim",
		config = function()
			local on_attach = require("plugins.configs.lspconfig").on_attach
			local capabilities = require("plugins.configs.lspconfig").capabilities
			require("flutter-tools").setup({
				lsp = {
					on_attach = on_attach,
					capabilities = capabilities,
				},
				widget_guides = {
					enabled = true,
				},
				debugger = {
					register_configurations = function()
						require("custom.plugins.nvim-dap")
					end,
				},
			})
		end,
	},

	-- LspSaga
	["glepnir/lspsaga.nvim"] = {},

	["phaazon/hop.nvim"] = {
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

	["tpope/vim-surround"] = {},

	["mfussenegger/nvim-dap"] = {
		config = function()
			require("custom.plugins.nvim-dap")
		end,
	},

	["rcarriga/nvim-dap-ui"] = {
		config = function()
			require("dapui").setup({})
		end,
	},
	["ptzz/lf.vim"] = {},

	["voldikss/vim-floaterm"] = {},

	["nvim-telescope/telescope-file-browser.nvim"] = {},

	["rafamadriz/friendly-snippets"] = false,

	["Nash0x7E2/awesome-flutter-snippets"] = {},
	-- remove plugin
	-- ["hrsh7th/cmp-path"] = false,
	-- ["hrsh7th/cmp-path"] = false,
}
