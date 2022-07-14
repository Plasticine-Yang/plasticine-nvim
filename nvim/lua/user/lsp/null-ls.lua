local status, null_ls = pcall(require, 'null-ls')
if not status then
  vim.notify('没有找到 null-ls')
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    -- Formatting ---------------------
    -- StyLua
    formatting.stylua,
    -- frontend
    formatting.prettierd.with({
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'css',
        'scss',
        'less',
        'html',
        'json',
        'yaml',
        'markdown',
      },
      prefer_local = 'node_modules/.bin',
      formatCommand = 'prettierd "${INPUT}"',
      formatStdin = true,
      env = {
        string.format(
          'PRETTIERD_DEFAULT_CONFIG=%s',
          vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')
        ),
      },
    }),
    -- formatting.fixjson,
    -- formatting.black.with({ extra_args = { "--fast" } }),
  },
  -- 保存自动格式化
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = false }')
    end
  end,
})
