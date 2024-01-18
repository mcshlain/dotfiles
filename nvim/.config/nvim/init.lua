-- Based on https://github.com/LunarVim/Launch.nvim
--
-- TODO: dao run/debug in a better panel (stderr without interaction)
-- TODO: running tests would be great
-- TODO: spell checker?
-- TODO: show errors inline (at least a preview) - this should be part of diagnostics, something is supressing it
-- TODO: add leap for faster navigation (can be paired with hardtime)
--
require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
spec "user.colorscheme" -- set color theme
spec "user.devicons" -- adds ability to add icons to stuff
spec "user.treesitter" -- syntax highlighting
spec "user.neoscroll" -- smooth scrolling
spec "user.mason" -- builds LSP servers
spec "user.schemastore" -- get common json schemas
spec "user.lspconfig" -- basic LSP config
spec "user.null-ls" -- command line tools as LSPs
spec "user.telescope" -- fuzzy search anything
spec "user.projects" -- change vi scope to match project
spec "user.whichkey" -- visual key mapping
spec "user.nvimtree" -- file explorer
spec "user.lualine" -- bottom status line
spec "user.autopairs" -- auto complete brackets
spec "user.comment" -- commenting in different languages
spec "user.indentline" -- better indentation support
spec "user.gitsigns" -- git information status column
spec "user.neogit" -- git manager
spec "user.diffview" -- diff view for git
spec "user.illuminate" -- highlights items similar to what you are on
spec "user.trouble" -- errors panel
spec "user.todo-comments" -- todo highlighting
spec "user.cmp" -- auto completion
spec "user.dap" -- debugger
spec "user.scala-lsp" -- metals LSP for scala
spec "user.harpoon" -- quick navigation between marked files
spec "user.dressing" -- UI tweaks for better inputs
spec "user.dapui" -- UI panels for debug/run mode of dap
spec "user.actions-preview" -- better actions menu
spec "user.lightbulb" -- indicator for code actions in code
spec "user.modes" -- vim mode indicator on current line
require "user.lazy"
