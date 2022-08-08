
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType',{
  pattern='c',
  command="compiler gcc",
})
vim.api.nvim_create_autocmd('TermOpen',{
  callback = function()
    vim.cmd[[setlocal nonumber]] 
    vim.cmd[[startinsert]]
  end
})
vim.api.nvim_create_autocmd('BufWritePre',{
  pattern={'*.c','*.lua'},
  callback= function()
    vim.cmd[[lua vim.lsp.buf.formatting() ]]
  end
})

