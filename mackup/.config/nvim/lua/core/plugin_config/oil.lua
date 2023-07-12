require("oil").setup()

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set("n", "sf", require("oil").open, { desc = "Open parent directory" })
