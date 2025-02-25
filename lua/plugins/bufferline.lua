require("bufferline").setup({
  options = {
    mode = "tabs",
    always_show_bufferline = true,  -- Keep bufferline always visible
    separator_style = "slant",  -- Style of separators
    max_name_length = 18,  -- Maximum buffer name length
    max_prefix_length = 15,  -- Maximum length of buffer prefix
    enforce_regular_tabs = true,  -- Make all tabs have the same width
    tab_size = 18,  -- Width of each tab
  },
})

