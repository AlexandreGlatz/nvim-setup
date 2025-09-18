--  _   _                 _             _                
-- | \ | | ___  _____   _(_)_ __ ___   | |   _   _  __ _ 
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \  | |  | | | |/ _` |
-- | |\  |  __/ (_) \ V /| | | | | | |_| |__| |_| | (_| |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_(_)_____\__,_|\__,_|
--
--	Setup by Alexandre Glatz (2025)
-----------------------------------------------

print(">^.^<")

-- OPTIONS --
vim.opt.number = true		        -- Set numbers on left 
vim.opt.numberwidth = 4		        -- Set numbers' width
vim.opt.wrap = true                 -- Set wrap
vim.opt.linebreak = true	        -- Set linebreak to word
vim.opt.tabstop = 4                 -- Set tab size
vim.opt.expandtab = true	        -- Set tabs as white space
vim.opt.softtabstop = 4		        -- Set multiple spaces as a tab
vim.opt.shiftwidth = 4              -- Set width size for autoindent
vim.opt.clipboard = "unnamedplus"   -- Yank to clipboard

-- LEADERS --
vim.g.mapleader = ' '               -- Set <Leader> to space
vim.g.maplocalleader = ','          -- Set Local Leader to -

-- KEYMAPS --
vim.keymap.set('n','è','ddp',{desc = 'move line down 1 '})
vim.keymap.set('n','_','ddkP',{desc = 'move line up 1 '})
vim.keymap.set('n','<Leader>ev',':belowright vsplit $MYVIMRC<cr>',{desc = 'open vimrc'})
vim.keymap.set('n','<Leader>sv',':source $MYVIMRC<cr>',{desc = 'execute vimrc'})
vim.keymap.set('n','L', '$',{desc = 'goto end of line'})
vim.keymap.set('n','H', '^',{desc = 'goto first non blank character'})
vim.keymap.set('n', '<Leader>"', 'viw<esc>a"<esc>bi"<esc>lel', {desc = 'put word in double quotes'})
vim.keymap.set('n','<Leader>\'','viw<esc>a\'<esc>bi\'<esc>lel',{desc = 'put word in quotes'})
vim.keymap.set('n','<Leader>a','ggvG$',{desc='select whole file'})
vim.keymap.set('n','<Leader><Tab>','i<Tab><esc>',{desc='tab in normal'})

vim.keymap.set('v','"', '<esc>`<i"<esc>`>a"<esc>',{desc = 'put selection in double quotes'})
vim.keymap.set('v','\'', '<esc>`<i\'<esc>`>a\'<esc>',{desc = 'put selection in double quotes'})

vim.keymap.set('o', 'p', 'i(', {desc = 'movement between current parentheses'})
vim.keymap.set('o', 'il(', ':<C-U>normal! F)vi(<cr>', {desc = 'movement between last parentheses'})
vim.keymap.set('o', 'in(', ':<C-U>normal! f(vi(<cr>', {desc = 'movement between last parentheses'})

vim.keymap.set('i','<c-d>','<esc>yypi',{desc = 'duplicate line under'})
vim.keymap.set('i','jk','<esc>',{desc = 'change to normal mode'})
vim.keymap.set('i','<c-u>','<esc>viwUi',{desc = 'change word to uppercase'})
vim.keymap.set('i','{','{}<esc>i', {desc = 'close braces'})
vim.keymap.set('i','(','()<esc>i', {desc = 'close parentheses'})
vim.keymap.set('i','[','[]<esc>i', {desc = 'close square brackets'})
vim.keymap.set('i','<','<><esc>i', {desc = 'close chevrons'})
vim.keymap.set('i','"','""<esc>i', {desc = 'close double quotes'})
vim.keymap.set('i','\'','\'\'<esc>i', {desc = 'close quotes'})
vim.keymap.set('i','{<Enter>','{<cr>}<esc>ko', {desc = 'close braces'})

vim.keymap.set('i','<esc>','<nop>',{desc = 'deactivate <esc> for normal mode'})
vim.keymap.set('i','<Up>','<nop>',{desc = 'deactivate arrows'})
vim.keymap.set('i','<Down>','<nop>',{desc = 'deactivate arrows'})

vim.keymap.set('','<Up>','<nop>',{desc = 'deactivate arrows'})
vim.keymap.set('','<Down>','<nop>',{desc = 'deactivate arrows'})
vim.keymap.set('','<Left>','<nop>',{desc = 'deactivate arrows'})
vim.keymap.set('','<Right>','<nop>',{desc = 'deactivate arrows'})

-- AUTOCMD --
local generalSettingsGroup = vim.api.nvim_create_augroup('General settings', {clear = true})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.keymap.set("n", "<localleader>c", "^i//<esc>",{buffer=true})
    end,
    group=generalSettingsGroup,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.keymap.set("n", "<localleader>c", "^i//<esc>",{buffer=true})
    end,
    group=generalSettingsGroup,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "h",
    callback = function()
        vim.keymap.set("n", "<localleader>c", "^i//<esc>",{buffer=true})
    end,
    group=generalSettingsGroup,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "hpp",
    callback = function()
        vim.keymap.set("n", "<localleader>c", "^i//<esc>",{buffer=true})
    end,
    group=generalSettingsGroup,
})
-- ABBREVS --
vim.cmd('iabbrev @@ alexandre.glatzpro@gmail.com')
vim.cmd('iabbrev ccopy Copyright by Alexandre Glatz, All rights reserved')

-- STATUSLINE --
local statusline = require("statusline")
vim.o.statusline = "%!v:lua.require'statusline'.statusline()"

vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ffffff", bg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "StatusLinePath", { fg = "#a9a9a9", bg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "StatusLineFile", { fg = "#ffffff", bg = "#3a3a3a", bold = true })
vim.api.nvim_set_hl(0, "StatusLineFill", { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineInfo", { fg = "#a9a9a9", bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineEnd", { fg = "#3a3a3a", bg = "NONE" })

-- HIGHLIGHTS --
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "NONE", ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "NONE", ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { ctermbg = "NONE", ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = "NONE", ctermfg = "NONE"})
vim.api.nvim_set_hl(0, "TabLine", { ctermbg = "NONE", ctermfg = "NONE" })
