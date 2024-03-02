return {
    { "folke/lazy.nvim" };

    -- telescope:
    { "nvim-telescope/telescope.nvim", tag = "0.", dependencies = { "nvim-lua/plenary.nvim" }, lzy = false};

    -- treesitter
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", event = { "BufReadPre", "BufNewFile" }, lazy = false };
    { "nvim-treesitter/nvim-treesitter-context", lazy = false };
    { "nvim-treesitter/nvim-treesitter-textobjects", lazy = false };

    { "numToStr/Comment.nvim", lazy = false };

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 };

    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } };


    { "lewis6991/gitsigns.nvim" };

    { "kkoomen/vim-doge", run = ":call doge#install()" };

    {
        "hrsh7th/nvim-cmp";
        dependencies = {
            { "hrsh7th/cmp-buffer" };
            { "hrsh7th/cmp-path" };
            { "saadparwaiz1/cmp_luasnip" };
            { "hrsh7th/cmp-nvim-lsp" };
            { "hrsh7th/cmp-nvim-lua" };
            { "ray-x/cmp-treesitter" };
            { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" };
        };
    };
}
