local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   operator_pending_mode = "o"

-- Normal --
-- open projects list
keymap('n', '<leader>p', '<Cmd>Telescope project<CR>', opts)

-- Copy function
keymap('n', 'gyf', '<S-v>g_%y', opts)

-- Delete function
keymap('n', 'gdf', '<S-v>g_%d', opts)

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- scroll
keymap('n', 'J', '5j', opts)
keymap('n', 'K', '5k', opts)
keymap('n', '<C-u>', '10k', opts)
keymap('n', '<C-d>', '10j', opts)

-- 移动到行首尾
keymap('n', '<S-h>', '^', opts)
keymap('n', '<S-l>', 'g_', opts)

-- quit
keymap('n', 'q', ':q<CR>', opts)
keymap('n', 'qq', ':q!<CR>', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<A-h>', ':bprevious<CR>', opts)
keymap('n', '<A-l>', ':bnext<CR>', opts)

-- close buffer
keymap('n', '<C-w>', ':bdelete<CR>', opts)
keymap('n', '<C-w><C-w>', ':bdelete!<CR>', opts)

-- save file
keymap('n', '<C-s>', ':w<CR>', opts)

-- 代码折叠
keymap('n', 'gz', ':foldclose<CR>', opts)
keymap('n', 'guz', ':foldopen<CR>', opts)

-- open telescope
-- 搜索文件时不要预览
keymap(
  'n',
  '<C-p>',
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
  opts
)
-- 搜索符号时正常预览
keymap('n', '<C-t>', '<cmd>Telescope live_grep<cr>', opts)

-- NvimTree
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- formatting
keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)

-- Insert --
-- Press jk fast to enter
keymap('i', 'jk', '<ESC>', opts)

-- Insert 模式下移动光标
keymap('i', '<C-h>', '<Esc>i', opts)
keymap('i', '<C-j>', '<Esc>ja', opts)
keymap('i', '<C-k>', '<Esc>ka', opts)
keymap('i', '<C-l>', '<Esc>la', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)

keymap('v', '<S-h>', '^', opts)
keymap('v', '<S-l>', 'g_', opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Operator Pending
keymap('o', '<S-h>', '^', opts)
keymap('o', '<S-l>', 'g_', opts)

-- Terminal --
-- Better terminal navigation
keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', term_opts)
keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', term_opts)
keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', term_opts)
keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', term_opts)
keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- hop.nvim
local hop_trigger_key = '<Leader><Leader>'
keymap('n', hop_trigger_key .. 'a', ':HopAnywhere<CR>', opts)
keymap('n', hop_trigger_key .. 'w', ':HopWord<CR>', opts)

-- 插件快捷键配置对象
local pluginKeys = {}

-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>tf 浮动
-- <leader>tr 右侧
-- <leader>tb 下方
-- 特殊lazygit 窗口，需要安装 lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
  vim.keymap.set({ 'n', 't' }, '<leader>tf', toggleterm.toggleF)
  vim.keymap.set({ 'n', 't' }, '<leader>tr', toggleterm.toggleR)
  vim.keymap.set({ 'n', 't' }, '<leader>tb', toggleterm.toggleB)
  vim.keymap.set({ 'n', 't' }, '<leader>tg', toggleterm.toggleG)
end

return pluginKeys
