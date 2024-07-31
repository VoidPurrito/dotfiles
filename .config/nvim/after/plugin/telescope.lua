local builtins = require("telescope.builtin")

vim.keymap.set({ "n", "i" }, "<C-g>", builtins.live_grep, { desc = "Find in Files" })
vim.keymap.set({ "n", "i" }, "<F2>", builtins.find_files, { desc = "Find File" })
vim.keymap.set({ "n", "i" }, "<C-f>",  builtins.current_buffer_fuzzy_find, { desc = "Find in Current Buffer" });
vim.keymap.set({ "n" }, "<leader>lr",  builtins.lsp_references, { desc = "Find References" });

