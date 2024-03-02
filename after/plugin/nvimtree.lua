local function handle_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
      vim.keymap.set('n', '<C-e>', api.tree.close, opts('Close'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive";
    };
    
    view = {
        width = 50;
    };
    
    renderer = {
        group_empty = true;
    };
    
    filters = {
        dotfiles = true;
    };

    on_attach = handle_on_attach;
})
