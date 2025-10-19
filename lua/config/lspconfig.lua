local M = {}

function M.setup()
  vim.o.updatetime = 250

-- Diagnostic configuration
  vim.diagnostic.config({
    virtual_text = false, -- no inline text
    signs = true,         -- show gutter signs
    underline = true,     -- show underline
    update_in_insert = false,
    float = { focusable = false },
  })

  -- Completion settings
  vim.o.completeopt = 'menuone,noselect'

  -- Show diagnostics in a floating window when cursor is on the line
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      vim.diagnostic.open_float(nil, { focus = false })
    end,
  })

  -- Capabilities
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- on_attach for LSP keymaps
  local on_attach = function(_, bufnr)
    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
    end
    bufmap('n', 'gd', vim.lsp.buf.definition)
    bufmap('n', 'K', vim.lsp.buf.hover)
    bufmap('n', 'gi', vim.lsp.buf.implementation)
    bufmap('n', '<leader>rn', vim.lsp.buf.rename)
    bufmap('n', '<leader>ca', vim.lsp.buf.code_action)
  end

  -- Modern LSP config API (Neovim 0.11+)
  local servers = { 'clangd', 'rust_analyzer', 'pyright', 'csharp_ls' }
  for _, server in ipairs(servers) do
    vim.lsp.config(server, {
      capabilities = capabilities,
      on_attach = on_attach,
    })
    vim.lsp.enable(server)
  end

  -- nvim-cmp setup
  local luasnip = require 'luasnip'
  local cmp = require 'cmp'
  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }
end

return M
