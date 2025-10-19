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


  -- Buffers (SPC b)
  keymap("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })
  keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })

  -- Git (SPC g)
  keymap("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
  keymap("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
  keymap("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
  keymap("n", "<leader>gl", "<cmd>Git pull<CR>", { desc = "Git pull" })
  keymap("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })

  -- Terminal (SPC t)
  keymap("n", "<leader>tt", "<cmd>split | terminal<CR>", { desc = "Open terminal (split)" })
  keymap("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Open terminal (vsplit)" })
end

return M
