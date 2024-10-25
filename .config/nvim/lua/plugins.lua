return {
    -- lazy-load
    { "folke/lazy.nvim" };

    -- telescope:
    { "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" }, lzy = false};

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
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, lazy = true };

    -- git
    { "lewis6991/gitsigns.nvim" };

    { "kkoomen/vim-doge", run = ":call doge#install()" };

    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>git", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    };

    -- projects
    {
        "coffebar/neovim-project",
        init = function()
            -- enable saving the state of plugins in the session
            vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
        end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
            { "Shatur/neovim-session-manager" },
        },
        lazy = false,
        priority = 100,
        enabled = false,
    },

    -- cmp -- completion 
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

    -- mason -- LSP
    { "williamboman/mason.nvim", lazy = false, config = function() require('mason').setup() end };

    "williamboman/mason-lspconfig.nvim";
    "neovim/nvim-lspconfig";

    -- DAP
    { "mfussenegger/nvim-dap", lazy = false };

    "jay-babu/mason-nvim-dap.nvim";

    { "rcarriga/nvim-dap-ui", config = function() require('dapui').setup({}) end };

    {'nvim-telescope/telescope-dap.nvim', dependencies = { 'mfussenegger/nvim-dap' } };

    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} };

    -- Fle Structure View
    {
        'stevearc/aerial.nvim',
        opts = {},

        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    };

    -- Telescope File Explorer
    {
       "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    };

    -- toggleterm
    { 'akinsho/toggleterm.nvim', version = "*", config = true };

    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    };

    { 'stevearc/conform.nvim', opts = {} };
}
