-- ~/.config/nvim/init.lua
require("settings")
require("keymaps")
require("plugins")         -- Loads plugins/init.lua
require("plugins.lsp")     -- Moved LSP config
require("plugins.cmp")     -- Already moved
require("plugins.telescope") -- Moved Telescope config
require("autocommands")
