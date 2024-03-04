local builtins = require("telescope.builtin")

vim.keymap.set({ "n", "i" }, "<C-g>", builtins.live_grep, { desc = "Find in Files" })
vim.keymap.set({ "n", "i" }, "<F2>", builtins.find_files, { desc = "Find File" })
