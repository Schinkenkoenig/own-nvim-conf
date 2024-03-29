return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'gopls' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {
        capabilities = capabilities
      }
      lspconfig.gopls.setup {
        capabilities = capabilities
      }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end,
  },
}
