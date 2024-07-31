--[[require("neovim-project").setup {
    projects = { -- define project roots
        "~/projects/*",
        "~/.config/*",
    },
}

vim.keymap.set({ "n" }, "<F1>", function() vim.cmd("Telescope neovim-project discover") end, { desc = "Find File" })
--]]
