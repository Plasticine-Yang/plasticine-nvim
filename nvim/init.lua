-- 基本配置
require('user.options')

-- 按键映射
require('user.keymaps')

-- 插件配置
require('user.plugins')

-- 主题配色
require('user.colorscheme')

-- LSP
require('user.lsp')
require('user.lsp.null-ls')

-- plugin config
require('user.plugin-config.cmp') -- 代码补全
require('user.plugin-config.comment') -- 代码注释
require('user.plugin-config.surround') -- vim-surround
require('user.plugin-config.neoscroll') -- 平滑滚动
require('user.plugin-config.lsp_signature') -- 函数签名提示
require('user.plugin-config.telescope') -- 文件/Symbol 搜索
require('user.plugin-config.nvim-tree') -- 侧边文件浏览器
require('user.plugin-config.nvim-treesitter') -- 语法高亮
