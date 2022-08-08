vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", ",<Space>", "<cmd>nohlsearch<CR>", { silent = true })
map("n", "<Leader>q", "<cmd>q<CR>")
map("i", "jj", "<ESC>")
map("n", "<Leader>wq", "<cmd>wq<CR>")
map("n", "<Leader>w", "<cmd>w<CR>")
map("n", "<Leader>tt", "<cmd>lua toggletheme()<CR>")
map("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>")
