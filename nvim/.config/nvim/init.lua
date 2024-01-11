-- Based on https://github.com/LunarVim/Launch.nvim
-- TODO: install some sort of scala formatter that can be run
-- TODO: install neoscroll for smooth page down page up action
-- TODO: selection can be too light, especially in a string, make it more noticable
-- TODO: configure trouble to show errors in line as well
-- TODO: setup debugger/tester/runner for scala
-- TODO: can metals code actions be displayed in some better panel?
-- TODO: try twighlight plugin and see if it helps in code reading
-- TODO: add plugin that can select semantic surrounding area
-- TODO: add harpoon
-- TODO: add leap for faster navigation (can be paired with hardtime)
-- TODO: This config: divide the whichkey definitions between the plugins
require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
spec "user.colorscheme"
spec "user.devicons"
spec "user.treesitter"
spec "user.mason"
spec "user.schemastore"
spec "user.lspconfig"
spec "user.null-ls"
spec "user.telescope"
spec "user.projects"
spec "user.whichkey"
spec "user.nvimtree"
spec "user.lualine"
spec "user.autopairs"
spec "user.comment"
spec "user.indentline"
spec "user.gitsigns"
spec "user.neogit"
spec "user.diffview"
spec "user.illuminate"
spec "user.trouble"
spec "user.todo-comments"
spec "user.cmp"
spec "user.scala-lsp"
require "user.lazy"
