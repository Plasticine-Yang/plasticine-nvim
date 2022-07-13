local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   operator_pending_mode = "o"

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- scroll
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("n", "<C-u>", "10k", opts)
keymap("n", "<C-d>", "10j", opts)


keymap("n", "<leader>e", ":Lex 30<cr>", opts)

keymap("n", "<S-h>", "^", opts)
keymap("n", "<S-l>", "g_", opts)

-- quit
keymap("n", "q", ":q<CR>", opts)
keymap("n", "qq", ":q!<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-h>", ":bprevious<CR>", opts)
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<C-w>", ":bdelete<CR>", opts)
keymap("n", "<C-w><C-w>", ":bdelete!<CR>", opts)

-- save file
keymap("n", "<C-s>", ":w<CR>", opts)

-- open telescope
-- 搜索文件时不要预览
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
-- 搜索符号时正常预览
keymap("n", "<C-t>", "<cmd>Telescope live_grep<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

keymap("i", "<C-h>", "<Esc>I", opts)
keymap("i", "<C-l>", "<Esc>A", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

keymap("v", "<S-h>", "^", opts)
keymap("v", "<S-l>", "g_", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Operator Pending
keymap("o", "<S-h>", "^", opts)
keymap("o", "<S-l>", "g_", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- hop.nvim
local hop_trigger_key = "<Leader><Leader>" 
keymap("n", hop_trigger_key .. "a", ":HopAnywhere<CR>", opts)
keymap("n", hop_trigger_key .. "w", ":HopWord<CR>", opts)
