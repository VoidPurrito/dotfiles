local mocha = require("catppuccin.palettes").get_palette "mocha"

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = mocha.blue },
    b = { fg = colors.white, bg = mocha.surface1 },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = mocha.green } },
  visual = { a = { fg = colors.black, bg = mocha.pink } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

local function tabinfo()
    local current = vim.fn.tabpagenr()
    local total = vim.fn.tabpagenr('$')
    return current .. "/" .. total
end

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    icons_enabled = true,
    globalstatus = true,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filesize', { 'filename', path = 1 } },
    lualine_x = { },
    lualine_y = { 'filetype', 'encoding', 'fileformat', { tabinfo }, 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

