local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
--remove trailing whitespaces & highlight yank
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    vim.api.nvim_command [[%s/\s\+$//e]]
  end
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'c' then
      vim.api.nvim_set_keymap("n", "<Leader>r", "<cmd>split term:// gcc -Wall % -o %< && ./%< <CR>", { silent = true })
    end
    if vim.bo.filetype == 'python' then
      vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>split term:// python % <cr>", { silent = true })
    end
    if vim.bo.filetype == 'lua' then
      vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>so %<cr>", { silent = true })
    end
  end
})
-- Don't auto commenting new lines
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})
-- Terminal settings:
-- Open a Terminal on the right tab
vim.api.nvim_create_autocmd('CmdlineEnter', {
  command = 'command! Term :botright vsplit term://$SHELL'
})
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.cmd [[setlocal nonumber]]
    vim.cmd [[startinsert]]
  end
})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.c', '*.lua' },
  callback = function()
    vim.cmd [[lua vim.lsp.buf.formatting() ]]
  end
})
-- Save/restore code folds
local saveFolds = vim.api.nvim_create_augroup("saveFolds", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "silent mkview",
  group = saveFolds,
})
vim.api.nvim_create_autocmd("BufReadPost", {
  command = "silent! loadview",
  group = saveFolds,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
