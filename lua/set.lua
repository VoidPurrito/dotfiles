vim.opt.number = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ttyfast = true
vim.opt.wildmode = "list:longest"

vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { underline = false, ctermbg = 234 })

vim.opt.mouse = "nvi"
