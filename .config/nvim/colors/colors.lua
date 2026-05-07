-- ~/.config/colors/colors.lua

local palette = {
    color0  = "#333333",
    color1  = "#dc322f",
    color2  = "#859900",
    color3  = "#b58900",
    color4  = "#6669e9",
    color5  = "#d33682",
    color6  = "#2aa198",
    color7  = "#eee8d5",
    color8  = "#555555",
    color9  = "#cb4b16",
    color10 = "#586e75",
    color11 = "#657b83",
    color12 = "#839496",
    color13 = "#6c71c4",
    color14 = "#93a1a1",
    color15 = "#fdf6e3",
}

vim.cmd('highlight clear')
vim.cmd('syntax reset')

vim.o.background = 'dark'
vim.g.colors_name = 'colors'
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, 'Normal', { fg = palette.color7, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Cursor', { fg = palette.color0, bg = palette.color7 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = palette.color0 })
vim.api.nvim_set_hl(0, "Visual", { reverse = true })
vim.api.nvim_set_hl(0, 'LineNr', { fg = palette.color8 })
vim.api.nvim_set_hl(0, 'Comment', { fg = palette.color8, italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = palette.color3, bold = true })
vim.api.nvim_set_hl(0, 'String', { fg = palette.color2 })
vim.api.nvim_set_hl(0, 'Function', { fg = palette.color4, bold = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = palette.color3 })
vim.api.nvim_set_hl(0, 'Statement', { fg = palette.color2 })
vim.api.nvim_set_hl(0, 'PreProc', { fg = palette.color5 })
vim.api.nvim_set_hl(0, 'Type', { fg = palette.color2, bold = true })
vim.api.nvim_set_hl(0, 'Special', { fg = palette.color1 })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = palette.color0 })
vim.api.nvim_set_hl(0, 'Error', { fg = palette.color1, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = palette.color3, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = palette.color0, bg = palette.color3, bold = true })