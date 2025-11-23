vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'
  -- mason
  use({'mason-org/mason.nvim'})
  use({
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
    },
  })
  -- surround
  use({'tpope/vim-surround'})
  -- snippets
  use({'saadparwaiz1/cmp_luasnip'})
  use({'rafamadriz/friendly-snippets'})
  use({
    'L3MON4D3/LuaSnip',
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp",
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    }
  })
  -- lsp
  -- use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use({'hrsh7th/cmp-path'}) -- path autocomplete
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-buffer'})
  -- latex
  use({'lervag/vimtex', config = function()
    -- Устанавливаем LaTeX как основной формат
    vim.g.tex_flavor = 'latex'
    -- Настройка метода просмотра PDF
    vim.g.vimtex_view_method = 'zathura'
    -- Отключаем режим быстрого исправления
    vim.g.vimtex_quickfix_mode = 0
    -- Устанавливаем уровень скрытия символов
    vim.opt.conceallevel = 1
    -- Настраиваем скрытие элементов TeX
    vim.g.tex_conceal = 'abdmg'
  end
})
-- icons
use({'nvim-tree/nvim-web-devicons'})
-- git
use({'lewis6991/gitsigns.nvim'})
use({'sindrets/diffview.nvim'}) 
-- tree
use({'nvim-tree/nvim-tree.lua'})
-- table mode
use({'dhruvasagar/vim-table-mode'})
-- tags
use({'windwp/nvim-ts-autotag'})
-- python
use ({'psf/black'})
-- ale
use({'dense-analysis/ale'})
-- treesitter
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
-- colorscheme
use({'catppuccin/nvim', as = 'catppuccin'})
-- Telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
-- autopairs
use {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    require('nvim-autopairs').setup {}
  end
}
end)
