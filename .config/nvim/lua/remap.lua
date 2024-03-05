vim.g.mapleader = " "

vim.keymap.set("n", "<A-t>", function() vim.cmd("tabnew") end, { desc = "Create a new tab" })
vim.keymap.set("n", "<A-S-t>", function() vim.cmd("tabclose") end, { desc = "Create a new tab" })

