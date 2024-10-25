local mason = require('mason');
local masonlsp = require('mason-lspconfig');
local lspconfig = require('lspconfig');

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),

    callback = function()
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', 'D', vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<C-d>", function()
            vim.cmd("vsplit");
            vim.lsp.buf.definition();
        end, opts)

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "<F3>", vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>lca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

mason.setup();

masonlsp.setup({
    ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'tsserver',
        'eslint',
        'gopls',
    }
});

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

masonlsp.setup_handlers({
    function(server_name)
        local settings = {
            capabilities = lsp_capabilities,
        };

        lspconfig[server_name].setup(settings)
    end,
})

vim.diagnostic.config({
    virtual_text = true,
--    signs = true,
--    update_in_insert = false,
--    underline = true,
    severity_sort = true,
})
