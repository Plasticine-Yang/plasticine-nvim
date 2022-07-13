local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
  vim.notify("plugin: `lsp_signature` not found")
  return
end

lsp_signature.setup({
  bind = true,
  handler_opts = {
    -- 圆角显示
    border = "rounded"
  },
  -- INSERT 模式下按 ctrl n 开关函数签名提示
  toggle_key = "<C-n>",
  -- 选择下一个函数签名
  select_signature_key = "<C-m>"
})
