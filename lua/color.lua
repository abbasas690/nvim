
-- Load the colorscheme
vim.cmd[[colorscheme zephyr]]
local toggle = 0
if colorscheme == dracula then
  -- show the '~' characters after the end of buffers
  vim.g.dracula_show_end_of_buffer = false
  -- use transparent background
  vim.g.dracula_transparent_bg = true
  -- set custom lualine background color
  vim.g.dracula_lualine_bg_color = "#44475a"
  -- set italic comment
  vim.g.dracula_italic_comment = true
end
if colorscheme == onedark then
  -- Lua
  require('onedark').setup  {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
    code_style = {
      comments = 'italic',
      keywords = 'none',
      functions = 'none',
      strings = 'none',
      variables = 'none'
    },
    diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true,   -- use undercurl instead of underline for diagnostics
      background = true,    -- use background color for virtual text
    },
  }
end
function toggletheme()
  local colorscheme={'dracula','onedark','zephyr'}
  local choice=colorscheme[math.random(#colorscheme)]
  vim.cmd('colorscheme '.. choice)
  print(choice)
end
