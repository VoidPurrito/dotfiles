-- Open the file browser with the home directory as the root
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")

-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<leader>fbc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
