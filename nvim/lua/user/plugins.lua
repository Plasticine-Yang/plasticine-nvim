local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use('wbthomason/packer.nvim') -- Have packer manage itself
  use('nvim-lua/popup.nvim') -- An implementation of the Popup API from vim in Neovim
  use('nvim-lua/plenary.nvim') -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use('lunarvim/darkplus.nvim')
  use('folke/tokyonight.nvim')

  -- LSP
  use('neovim/nvim-lspconfig') -- enable LSP
  use('williamboman/nvim-lsp-installer') -- simple to use language server installer
  use({
    'glepnir/lspsaga.nvim',
    branch = 'main',
  })

  -- cmp plugins
  use('hrsh7th/nvim-cmp') -- The completion plugin
  use('hrsh7th/cmp-buffer') -- buffer completions
  use('hrsh7th/cmp-path') -- path completions
  use('hrsh7th/cmp-cmdline') -- cmdline completions
  use('saadparwaiz1/cmp_luasnip') -- snippet completions
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')

  -- snippets
  use('L3MON4D3/LuaSnip') --snippet engine
  use('rafamadriz/friendly-snippets') -- a bunch of snippets to use

  -- Comment 代码注释插件
  use('numToStr/Comment.nvim')

  -- surround.nvim
  use('ur4ltz/surround.nvim')

  -- nevim-autopairs 括号补全
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  })

  -- hop.nvim 一个 easymotion + sneak 的聚合插件
  use({
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
  })

  -- 平滑滚动
  use('karb94/neoscroll.nvim')

  -- parameter hints 函数签名提示，调用函数的时候输入参数时会给出参数提示
  use('ray-x/lsp_signature.nvim')

  -- 文件搜索/Symbol 搜索
  use('nvim-telescope/telescope.nvim')
  -- 文件浏览
  use('nvim-telescope/telescope-file-browser.nvim')
  -- 在 telescope 中预览图片
  use('nvim-telescope/telescope-media-files.nvim')
  -- 项目记录
  use('nvim-telescope/telescope-project.nvim')

  -- NvimTree 侧边文件浏览器
  use('kyazdani42/nvim-web-devicons')
  use('kyazdani42/nvim-tree.lua')

  -- 语法高亮 nvim-treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  })
  -- treesitter 插件 用于彩虹括号
  use('p00f/nvim-ts-rainbow')

  -- null-ls 提供 code actions、diagnostics、formatting、hover、completion 等多种功能
  use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })

  -- bufferline 显示打开的 buffer 标签
  use({ 'akinsho/bufferline.nvim', tag = 'v2.*', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' } })

  -- 底部信息栏显示
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })

  -- 缩进竖线提示
  use('lukas-reineke/indent-blankline.nvim')

  -- 终端
  use({ 'akinsho/toggleterm.nvim', tag = 'v2.*' })

  -- dashboard 启动页
  use('glepnir/dashboard-nvim')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
