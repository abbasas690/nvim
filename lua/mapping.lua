
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<Leader>x", ":q<CR>")
map("i", "jj", "<ESC>")
map("n", "<Leader>wq", ":wq<CR>")
map("n", "<Leader>w", ":w<CR>")
--map("n", "<Leader>r", "<cmd>split term://make %< && ./%<<CR>")
map("n", "<Leader>tt", "<cmd>lua toggletheme()<CR>")
map("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>")
map("t", "<Esc>", "<C-/><C-n>",{noremap =true})
map("n","<Leader>p","<cmd>split term://python % <CR>")
