local M = {}

function M.setup()
  local cmd = vim.cmd
  local o = vim.o
  local wo = vim.wo
  local bo = vim.bo
  local indent = 2

  -- Basic setup
  cmd "syntax enable"
  cmd "filetype plugin indent on"
  cmd "colorscheme dracula"
  cmd "au BufRead,BufNewFile *.asm set filetype=nasm"

  -- Persistent undo
  local undodir = vim.fn.expand("~/.undo-dir")
  if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
  end
  o.undodir = undodir
  o.undofile = true

  -- UI / Editor behavior
  o.termguicolors = true
  o.signcolumn = "yes"
  o.hidden = true
  o.breakindent = true
  o.ignorecase = true
  o.smartindent = true
  o.scrolloff = 8
  o.splitbelow = true
  o.splitright = true
  o.clipboard = "unnamedplus"
  o.timeoutlen = 300
  o.updatetime = 300
  o.inccommand = "split"
  o.cmdheight = 1
  o.sidescrolloff = 8
  o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
  o.history = 1000
  o.synmaxcol = 240

  -- Search
  o.incsearch = true
  o.hlsearch = true

  -- Numbers
  wo.number = true
  wo.relativenumber = false
  wo.cursorline = true

  -- Tabs
  o.shiftwidth = indent
  bo.tabstop = indent
  bo.softtabstop = indent
end

return M
