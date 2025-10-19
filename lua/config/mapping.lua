local M = {}

function M.setup()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Set leader to space (you already do this)
  vim.g.mapleader = " "

  --------------------
  -- SEARCH (SPC s ?)
  --------------------
  keymap("n", "<leader>ss", "<cmd>Telescope live_grep<CR>", { desc = "Search in project" })
  keymap("n", "<leader>sc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in buffer" })
  keymap("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Search files" })
  keymap("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Search buffers" })
  keymap("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags" })

  --------------------
  -- FILES / UTILS
  --------------------
  keymap("n", "<leader>a", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle undo tree" })
end

return M
