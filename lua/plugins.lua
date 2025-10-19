local M = {}

function M.setup()
  return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim', opt = true}

    -- Dracula theme (small, load immediately)
    use {'Mofiqul/dracula.nvim'}

    -- Auto pair (load immediately)
    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }

    -- Telescope (lazy on command)
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      cmd = 'Telescope',
      config = function()
        require('telescope').setup {
          defaults = {
            prompt_prefix = "🔍 ",
            selection_caret = "➤ ",
            path_display = {"smart"},
          }
        }
      end
    }

    -- FZF (lazy on command)
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all', cmd = 'FZF'}
    use {'junegunn/fzf.vim', cmd = {'FZF', 'Files', 'Buffers'}}

    -- File explorer (lazy on command)
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = {"NvimTreeToggle", "NvimTreeOpen"},
      config = function()
        require("nvim-tree").setup {}
      end
    }

    -- Mason & LSP (lazy on BufReadPre)
    use {
      "williamboman/mason.nvim",
      event = "BufReadPre",
      config = function() require("mason").setup() end
    }
    use {
      "williamboman/mason-lspconfig.nvim",
      event = "BufReadPre",
      config = function() require("mason-lspconfig").setup() end
    }
    use {
      'neovim/nvim-lspconfig',
      event = "BufReadPre",
      config = function() require('config.lspconfig').setup() end
    }

    -- Completion & snippets (lazy on InsertEnter)
    use {'hrsh7th/nvim-cmp', event = "InsertEnter"}
    use {'hrsh7th/cmp-buffer', event = "InsertEnter"}
    use {'hrsh7th/cmp-nvim-lsp', event = "InsertEnter"}
    use {'saadparwaiz1/cmp_luasnip', event = "InsertEnter"}
    use {'L3MON4D3/LuaSnip', event = "InsertEnter"}

    -- Treesitter (lazy on buffer read)
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = 'BufRead',
      config = function()
        require('nvim-treesitter.configs').setup {
          highlight = { enable = true },
          indent = { enable = true },
        }
      end
    }

    -- Git
    use { 'tpope/vim-dispatch', event = 'BufReadPost' }
    use {
      'airblade/vim-gitgutter',
      event = 'BufReadPost',
      config = function()
        require('config.git-gutter').setup()
      end
    }
    use {'tpope/vim-fugitive', cmd = {'G','Git','Gblame'}}

    -- Syntax & indentation
    use {'sheerun/vim-polyglot', event = 'BufRead'}

    -- Icons (load immediately)
    use {"kyazdani42/nvim-web-devicons"}

    -- Status line (lazy on VimEnter)
    use {
      "feline-nvim/feline.nvim",
      event = "VimEnter",
      config = function() require('feline').setup() end
    }

    -- Dashboard (lazy on VimEnter)
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {}
      end,
      requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- Hop (lazy on keypress 's' or 'S')
    use {
      'phaazon/hop.nvim',
      branch = 'v2',
      keys = {'s','S'},
      config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }

  end)
end

return M
