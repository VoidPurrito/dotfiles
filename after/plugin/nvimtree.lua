local lib = require("nvim-tree.lib")
local api = require("nvim-tree.api")

function get_cache_file_path()
    return vim.fn.stdpath("cache") .. "/my_bookmarks.cache";
end

function load_bookmarks()
    if not vim.g.my_bookmarks then
        local cache_file_path = get_cache_file_path();
        local file = io.open(cache_file_path);
        local b = {};

        if file then
            for line in file:lines() do
                local name, abs_path = line:match("([^=]+)=([^=]+)");
                b[name] = abs_path;
            end

            file:close();
        end

        vim.g.my_bookmarks = b;
    end
end

function save_bookmarks()
    local cache_file_path = get_cache_file_path();
    local file = assert(io.open(cache_file_path, "w+"));

    for k, v in pairs(vim.g.my_bookmarks) do
        file:write(k .. "=" .. v, "\n");
    end

    file:close();
end

function add_bookmark(opts)
    local node = lib.get_node_at_cursor();
    local b = vim.g.my_bookmarks;

    b[opts.fargs[1]] = node.absolute_path;
    vim.g.my_bookmarks = b;

    save_bookmarks();
end

function remove_bookmark(opts)
   local b = vim.g.my_bookmarks;

    b[opts.fargs[1]] = nil;
    vim.g.my_bookmarks = b;

    save_bookmarks();
end

function goto_bookmark(opts)
    api.tree.change_root(vim.g.my_bookmarks[opts.fargs[1]]);
end

function list_bookmarks()
    print("==== NvimTree Bookmarks ====\n\n")

    for k, v in pairs(vim.g.my_bookmarks) do
        print(k .. " -> " .. v)
    end

    print("\n====  ====  ====  ====  ====")
end

function bookmarks_completion(A, L, P)
    local keyset = {};
    local n = 0;

    for k, v in pairs(vim.g.my_bookmarks) do
        if k:match("^" .. A) then
            n = n + 1;
            keyset[n] = k;
        end
    end

    table.sort(keyset);
    return keyset;
end

vim.api.nvim_create_user_command("BookmarkAdd", function(opts) add_bookmark(opts) end, { desc = "Add a Bookmark", nargs = 1 })
vim.api.nvim_create_user_command("BookmarkRemove", function(opts) remove_bookmark(opts) end, { desc = "Remove a Bookmark", nargs = 1 });
vim.api.nvim_create_user_command("BookmarkGoto", function(opts) goto_bookmark(opts) end, { desc = "Open Bookmark", nargs = 1, complete = function(A, L, P) return bookmarks_completion(A, L, P) end });
vim.api.nvim_create_user_command("BookmarkLoad", function(opts) load_bookmarks() end, { desc = "Load Bookmarks from disk" });
vim.api.nvim_create_user_command("BookmarkSave", function(opts) save_bookmarks() end, { desc = "Save Bookmarks to disk" });
vim.api.nvim_create_user_command("BookmarkList", function(opts) list_bookmarks() end, { desc = "List Bookmarks" });

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

    load_bookmarks();
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
