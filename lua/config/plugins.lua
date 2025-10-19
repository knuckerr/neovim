-- lua/config/lazy.lua

-- Bootstrap lazy.nvim (auto-install if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  --------------------
  -- CORE / THEMES  --
  --------------------
  { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  --------------------
  -- QUALITY OF LIFE --
  --------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    keys = { "s", "S" },
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end
  },
  
  --------------------
  -- AI / Windsurf.nvim
  --------------------
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
	chat = function()
	  return require("codecompanion.adapters").extend("ollama", {
	    schema = {
	      model = { default = "gemma3:latest" },
	    },
	  })
	end,
	inline = function()
	  return require("codecompanion.adapters").extend("ollama", {
	    schema = {
	      model = { default = "gemma3:latest" },
	    },
	  })
	end,
      },
      strategies = {
	chat = { adapter = "chat" },
	inline = { adapter = "inline" },
      },
      opts = {
	log_level = "DEBUG",
      },
    },
  },

  --------------------
  -- FILE EXPLORER  --
  --------------------
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    config = function()
      require("nvim-tree").setup {}
    end
  },

  --------------------
  -- FUZZY FINDERS  --
  --------------------
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "smart" },
        }
      }
    end
  },

  {
    "junegunn/fzf",
    build = "./install --all",
    cmd = { "FZF" },
  },
  {
    "junegunn/fzf.vim",
    cmd = { "FZF", "Files", "Buffers" }
  },

  --------------------
  -- TREESITTER & SYNTAX --
  --------------------
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    config = function()
      require("treesitter-context").setup {}
    end
  },

  --------------------
  -- LSP / COMPLETION --
  --------------------
  {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    config = true
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      local ok, mod = pcall(require, "config.lspconfig")
      if ok then mod.setup() end
    end
  },

  -- nvim-cmp stack
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    }
  },

  --------------------
  -- GIT INTEGRATION --
  --------------------
  {
    "tpope/vim-dispatch",
    event = "BufReadPost",
  },
  {
    "airblade/vim-gitgutter",
    event = "BufReadPost",
    config = function()
      local ok, mod = pcall(require, "config.git-gutter")
      if ok then mod.setup() end
    end
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gblame" }
  },

  --------------------
  -- UI / STATUSLINE --
  --------------------
  {
    "feline-nvim/feline.nvim",
    event = "VimEnter",
    config = function()
      require("feline").setup()
    end
  },

  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup {}
    end
  },

}, {
  ui = {
    border = "rounded",
    icons = {
      loaded = "●",
      not_loaded = "○",
    },
  }
})
