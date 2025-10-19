-- =========================
--  init.lua (Lazy version)
-- =========================

-- Map leader to '.'
vim.g.mapleader = '.'

-- Core modules
require('config.settings').setup()
require('config.mapping').setup()  -- <— must run before plugins

-- Plugin setup via lazy.nvim
require('config.plugins')      -- Handles plugins
