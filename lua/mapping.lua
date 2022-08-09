vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', ',<Leader>h', '<cmd>nohlsearch<CR>', { silent = true })
map('n', '<Leader>q', '<cmd>q<CR>')
map('i', 'jj', '<ESC>')
map('n', '<Leader>wq', '<cmd>wq<CR>')
map('n', '<Leader>w', '<cmd>w<CR>')
map('n', '<Leader>tt', '<cmd>lua toggletheme()<CR>')
map('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>')

--Esc in the terminal
map('t', 'jj', [[<C-\><C-n>]])

-- Window movement
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
-- Tab movement
map('n', '<S-Left>', '<cmd>tabpre<cr>')
map('n', '<S-Right>', '<cmd>tabnext<cr>')
--blank space
map('n', '<leader>o', [[m`o<Esc>``]])

map('n', '<leader>O', [[m`O<Esc>``]])

-- Move inside completion list with <TAB>
map('i', [[<Tab>]], [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map('i', [[<S-Tab>]], [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
-- wrap movement
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--word && line jumps
map('', 's', '<cmd>HopWord<CR>', {})
map('', 'f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
  , {})
map('', 'F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
  , {})
map('', 't',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
  , {})
map('', 'T',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
  , {})
