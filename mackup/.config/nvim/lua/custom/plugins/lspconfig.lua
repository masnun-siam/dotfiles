local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "tsserver", "clangd", "gopls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

require("flutter-tools").setup({
	widget_guides = {
		enabled = true,
	},
	lsp = {
		cmd = {
			"dart",
			"language-server",
			"--lsp",
		},
		on_attach = on_attach,
		capabilities = capabilities,
	},

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
	},
})
