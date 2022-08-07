local config = {}
function config.lsp()

  local lsp_defaults = {
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
      vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end
  }
  local lspconfig = require('lspconfig')

  lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
  )
  lspconfig.sumneko_lua.setup({
    single_file_support = true,
    on_attach = function(client, bufnr)
      print('hello')
      lspconfig.util.default_config.on_attach(client, bufnr)
    end
  })
  lspconfig.clangd.setup({

    on_attach = function(client, bufnr)
      print('hello')
      lspconfig.util.default_config.on_attach(client, bufnr)
    end
  })
  lspconfig.pyright.setup{
    on_attach = function(client, bufnr)
      print('hello')
      lspconfig.util.default_config.on_attach(client, bufnr)
    end
  }

  local signs = { Error = "✘ ", Warn = " ", Hint = "⚑ ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = false,
    severity_sort = false,
    float = {
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
  )
end
  })
end
return config
