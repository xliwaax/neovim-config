require('lualine').setup({
  options = {
    theme = 'tokyonight-storm',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {'branch', 'diff'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
