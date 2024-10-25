local builtins = require("telescope.builtin")

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "dist"
        },
    },
    extensions = {
        aerial = {
            -- Display symbols as <root>.<parent>.<symbol>
            show_nesting = {
                ["_"] = false, -- This key will be the default
                json = true, -- You can set the option for specific filetypes
                yaml = true,
                js = true,
                ts = true,
            },

            -- Available modes: symbols, lines, both
            show_columns = "both",
        },
    },
})

vim.keymap.set({ "n", "i" }, "<C-g>", builtins.live_grep, { desc = "Global Search" })
vim.keymap.set({ "n", "i" }, "<C-f>", builtins.current_buffer_fuzzy_find, { desc = "Find in Current Buffer" });
vim.keymap.set({ "n" }, "<leader>ff", builtins.find_files, { desc = "Find File" })
vim.keymap.set({ "n" }, "<leader>fr", builtins.lsp_references, { desc = "Find References" });

