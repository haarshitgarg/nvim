-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 
	  "rose-pine/neovim", 
	  as = "rose-pine",
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  }

  use { 
	  'nvim-treesitter/nvim-treesitter', 
	  run = ':TSUpdate'
  }

  use {
	  'nvim-treesitter/playground'
  }

  use('ThePrimeagen/harpoon')
  use('nvim-lua/plenary.nvim')

  use('ThePrimeagen/vim-be-good')
  -- Setting up LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use {
      "wojciech-kulik/xcodebuild.nvim",
      requires = {
          "nvim-telescope/telescope.nvim",
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-tree.lua", -- (optional) to manage project files
          "stevearc/oil.nvim", -- (optional) to manage project files
          "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
      },
      config = function()
          require("xcodebuild").setup({
              -- put some options here or leave it empty to use default settings
          })
      end,
  }

  use {'mfussenegger/nvim-jdtls'}


  -- Auto generation of template code
  use {
      'L3MON4D3/LuaSnip',
      requires = { 'rafamadriz/friendly-snippets' },
      config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
      end
  }

  use({
      'MeanderingProgrammer/render-markdown.nvim',
      after = { 'nvim-treesitter' },
      requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
      -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
      -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
      config = function()
          require('render-markdown').setup({})
      end,
  })


end)
