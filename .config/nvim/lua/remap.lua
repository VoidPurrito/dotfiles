vim.g.mapleader = " "

vim.keymap.set("n", "<A-t>", function() vim.cmd("tabnew") end, { desc = "Create a new tab" })
vim.keymap.set("n", "<A-w>", function() vim.cmd("tabclose") end, { desc = "Close the current tab" })
vim.keymap.set("n", "<A-.>", function() vim.cmd("tabnext") end, { desc = "Goto next tab" })
vim.keymap.set("n", "<A-,>", function() vim.cmd("tabprevious") end, { desc = "Goto previous tab" })

vim.keymap.set("n", "<C-s>", function() vim.cmd("w") end, { desc = "Save the current buffer" })

vim.keymap.set("n", "<leader>o", ":e ", { desc = "Open file in current buffer" })
vim.keymap.set("n", "<leader>t", ":tabnew ", { desc = "Open file in new tab buffer" })

