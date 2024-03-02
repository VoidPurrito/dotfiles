return {
    -- lazy-load
    { "folke/lazy.nvim" };

    -- telescope:
    { "nvim-telescope/telescope.nvim", tag = "0.", dependencies = { "nvim-lua/plenary.nvim" }, lzy = false};

    -- treesitter
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", event = { "BufReadPre", "BufNewFile" }, lazy = false };
    { "nvim-treesitter/nvim-treesitter-context", lazy = false };
    { "nvim-treesitter/nvim-treesitter-textobjects", lazy = false };

    -- Comment
    { "numToStr/Comment.nvim", lazy = false };

    -- catppuccin theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 };

    -- lualine = status bar
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } };

    -- nvim-tree - project explorer
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } };

    -- git
    { "lewis6991/gitsigns.nvim" };

    { "kkoomen/vim-doge", run = ":call doge#install()" };

    -- cmp -- completion 
    {
        "hrsh7th/nvim-cmp";
        dependencies = {
            { "hrsh7th/cmp-buffer" };
            { "hrsh7th/cmp-path" };
            { "saadparwaiz1/cmp_luasnip" };
            { "hrsh7th/cmp-nvim-lsp" };
            { "hrsh6th/cmp-nvim-lua" };
            { "ray-x/cmp-treesitter" };
            { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" };
        };
    };

    -- mason -- LSP
    { "williamboman/mason.nvim", lazy = false, config = function() require('mason').setup() end };

    "williamboman/mason-lspconfig.nvim";
    "neovim/nvim-lspconfig";

    -- DAP
    { "mfussenegger/nvim-dap", lazy = false };

    "jay-babu/mason-nvim-dap.nvim";

    { "rcarriga/nvim-dap-ui", config = function() require('dapui').setup({}) end };

    {'nvim-telescope/telescope-dap.nvim', dependencies = { 'mfussenegger/nvim-dap' } };

}
