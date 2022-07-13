local configs = require('nvim-treesitter.configs')
configs.setup({
  ensure_installed = {
    'json',
    'html',
    'css',
    'vim',
    'lua',
    'javascript',
    'typescript',
    'tsx',
    'jsdoc',
    'vue',
    'markdown',
  },
  sync_install = false,
  ignore_install = { '' }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { '' }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    },
  },
  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- do not enable for files with more than n lines, int
    colors = {
      '#95ca60',
      '#ee6985',
      '#d6a760',
      '#7794f4',
      '#b38bf5',
      '#7cc7fe',
    }, -- table of hex strings
    -- termcolors = { } -- table of colour name strings
  },
})
-- 开启 Folding 模块
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
