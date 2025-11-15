-- ~/.config/colors/colors.lua

local palette = {
    color0  = "#111111",
    color1  = "#ff2250",
    color2  = "#0be96b",
    color3  = "#ffae0c",
    color4  = "#5671ff",
    color5  = "#c351ff",
    color6  = "#0ce2c8",
    color7  = "#eeeeee",
    color8  = "#333333",
    color9  = "#ff0a64",
    color10 = "#53ff1a",
    color11 = "#ffd70c",
    color12 = "#0aa0ff",
    color13 = "#f949ff",
    color14 = "#02ddff",
    color15 = "#cccccc",
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
