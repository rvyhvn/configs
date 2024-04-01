vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', '<c-a>', 'ggVG')
keymap.set({ 'n', 'x' }, '<leader>p', '"0p')
keymap.set('n', '<leader>q', '<cmd>confirm qa<CR>')
keymap.set('n', '<leader>w', '<cmd>wa<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

keymap.set('n', '<leader>nn', '<cmd>NvimTreeToggle<cr>')
keymap.set('n', 'j', 'k')
keymap.set('n', 'k', 'j')

keymap.set('n', '<leader><cr>', ':noh<cr>')

keymap.set('n', '<A-Down>', '<cmd>m+1<CR>==gv')
keymap.set('x', '<A-Down>', '<cmd>m+1<CR>==gv')

keymap.set('n', '<A-Up>', '<cmd>m-2<CR>==gv')
keymap.set('x', '<A-Up>', '<cmd>m-2<CR>==gv')


-- Toggle current line or with count
-- vim.keymap.set('n', '<leader>/', function()
--   return vim.v.count == 0
--       and '<Plug>(comment_toggle_linewise_current)'
--       or '<Plug>(comment_toggle_linewise_count)'
-- end, { expr = true })
--
-- -- Toggle in Op-pending mode
-- vim.keymap.set('n', 'gc', '<Plug>(comment_toggle_linewise)')
--
-- -- Toggle in VISUAL mode
-- vim.keymap.set('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual')
-- Define a function to compile and run code based on filetype

local utils = require("personal.autocmds") ---@type Utils
-- Setup runners per filetype
local runner_keymap = "<leader>rr"
utils.set_autocmd_runner("python", runner_keymap, "!python3 %")
utils.set_autocmd_runner("c", runner_keymap, "!gcc % -o %:t:r -g; ./%:t:r")
-- etc.
