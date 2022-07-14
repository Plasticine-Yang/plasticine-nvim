local status, toggleterm = pcall(require, 'toggleterm')
if not status then
  vim.notify('没有找到 toggleterm')
  return
end

toggleterm.setup({
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.3
    end
  end,
  start_in_insert = true,
})

-- 配置 lazygit
local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  on_open = function(term)
    vim.cmd('startinsert!')
    -- q / <leader>tg 关闭 terminal
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<leader>tg', '<cmd>close<CR>', { noremap = true, silent = true })
    -- ESC 键取消，留给lazygit
    if vim.fn.mapcheck('<Esc>', 't') ~= '' then
      vim.api.nvim_del_keymap('t', '<Esc>')
    end
  end,
  on_close = function(_)
    -- 添加回来
    vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {
      noremap = true,
      silent = true,
    })
  end,
})

-- 浮动打开终端
local tf = Terminal:new({
  direction = 'float',
  close_on_exit = true,
})

-- 右侧打开终端
local tr = Terminal:new({
  direction = 'vertical',
  close_on_exit = true,
})

-- 底部打开终端
local tb = Terminal:new({
  direction = 'horizontal',
  close_on_exit = true,
})

local M = {}

M.toggleF = function()
  if tf:is_open() then
    tf:close()
    return
  end
  tr:close()
  tb:close()
  tf:open()
end

M.toggleR = function()
  if tr:is_open() then
    tr:close()
    return
  end
  tf:close()
  tb:close()
  tr:open()
end

M.toggleB = function()
  if tb:is_open() then
    tb:close()
    return
  end
  tf:close()
  tr:close()
  tb:open()
end

M.toggleG = function()
  lazygit:toggle()
end

require('user.keymaps').mapToggleTerm(M)
