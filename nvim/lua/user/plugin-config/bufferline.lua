local cmp_status_ok, bufferline = pcall(require, 'bufferline')
if not cmp_status_ok then
  return
end

bufferline.setup({
  options = {
    -- 关闭 Tab 标签页的命令使用 moll/vim-bbye 提供的 :bdelete
    -- 而不是默认的 :bdelete 防止破坏布局
    close_command = 'Bdelete! %d',
    right_mouse_command = 'Bdelete! %d',
    -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left',
      },
    },
  },
})
