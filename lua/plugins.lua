local M = {}

function M.setup()
  return require('packer').startup(function()
      
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Dracula theme
    use {'https://github.com/Mofiqul/dracula.nvim'}

    -- Auto pair
    use {
      "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Fuzzy finder
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
    use {'junegunn/fzf.vim'}

    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup {}
      end,
    }


    -- LSP and completion
    use {
    "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end
    }

    use {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        require("mason-lspconfig").setup()
      end
    }

    use {
      'neovim/nvim-lspconfig',
      config = function()
        require('config.lspconfig').setup()
      end,
    }
    -- Collection of configurations for built-in LSP client
    use {'hrsh7th/nvim-cmp'} -- Autocompletion plugin
    use {'hrsh7th/cmp-buffer'} -- Autocompletion plugin
    use {'hrsh7th/cmp-nvim-lsp'} -- LSP source for nvim-cmp
    use {'saadparwaiz1/cmp_luasnip'} -- Snippets source for nvim-cmp
    use {'L3MON4D3/LuaSnip'} -- Snippets plugin



    -- Vim dispatch
    use { 'tpope/vim-dispatch' }
    use {
      'airblade/vim-gitgutter',
      config = function()
	require('config.git-gutter').setup()
      end,
    }

    -- Syntax & indent
    use 'sheerun/vim-polyglot'


    -- Fugitive for Git
    use { 'tpope/vim-fugitive' }

    -- Icons 
    use {
      "kyazdani42/nvim-web-devicons",
    }

    -- status line
    use {
      "feline-nvim/feline.nvim",
       config = function()
         require('feline').setup()
        end,
    }
    -- dashboard
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
        }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- hop
    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }

  end)
end
return M
