local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local which_key = require "which-key"

  which_key.setup {
    plugins = {
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,
        suggestions = 20,
      }, -- use which-key for spelling hints
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
      },
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    win = {
      border = "rounded", -- none, single, double, shadow
      padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
      wo = {
        winblend = 0,
      },
    },
    layout = {
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
    },
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = { { "<auto>", mode = "nxso" } }, -- automatically setup triggers
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  which_key.add {
    { "<leader>M", group = "Scala Metals", nowait = true, remap = false },
    { "<leader>Mc", "<cmd>:MetalsCompileCascade<cr>", desc = "[C]ompile cascade", nowait = true, remap = false },
    { "<leader>Md", "<cmd>:MetalsRunDoctor<cr>", desc = "Run [d]octor", nowait = true, remap = false },
    { "<leader>Mf", "<cmd>:MetalsRunScalafix<cr>", desc = "Run Scala[f]ix", nowait = true, remap = false },
    { "<leader>Mi", "<cmd>:MetalsInfo<cr>", desc = "Metals [i]nfo", nowait = true, remap = false },
    { "<leader>Ml", "<cmd>:MetalsToggleLogs<cr>", desc = "Toggle [l]ogs", nowait = true, remap = false },
    { "<leader>Mo", "<cmd>:MetalsOrganizeImports<cr>", desc = "[O]rganize imports", nowait = true, remap = false },
    { "<leader>Mr", "<cmd>:MetalsRestartBuildServer<cr>", desc = "[r]estart Build Server", nowait = true, remap = false },
    { "<leader>T", group = "Treesitter", nowait = true, remap = false },
    { "<leader>Ti", ":TSConfigInfo<cr>", desc = "Info", nowait = true, remap = false },
    { "<leader>Z", group = "La[z]y", nowait = true, remap = false },
    { "<leader>ZS", "<cmd>Lazy clear<cr>", desc = "Status", nowait = true, remap = false },
    { "<leader>Zc", "<cmd>Lazy clean<cr>", desc = "Clean", nowait = true, remap = false },
    { "<leader>Zd", "<cmd>Lazy debug<cr>", desc = "Debug", nowait = true, remap = false },
    { "<leader>Zi", "<cmd>Lazy install<cr>", desc = "Install", nowait = true, remap = false },
    { "<leader>Zl", "<cmd>Lazy log<cr>", desc = "Log", nowait = true, remap = false },
    { "<leader>Zp", "<cmd>Lazy profile<cr>", desc = "Profile", nowait = true, remap = false },
    { "<leader>Zs", "<cmd>Lazy sync<cr>", desc = "Sync", nowait = true, remap = false },
    { "<leader>Zu", "<cmd>Lazy update<cr>", desc = "Update", nowait = true, remap = false },
    { "<leader>b", group = "Buffers", nowait = true, remap = false },
    { "<leader>bD", "<cmd>:%bd|e#|bd#<cr>", desc = "[D]elete other Buffers", nowait = true, remap = false },
    { "<leader>bS", "<cmd>:wa<cr>", desc = "[S]ave all Buffers", nowait = true, remap = false },
    { "<leader>bb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find [B]uffer", nowait = true, remap = false },
    { "<leader>bd", "<cmd>:bdelete<cr>", desc = "[d]elete buffer", nowait = true, remap = false },
    { "<leader>bp", "<cmd>:e #<cr>", desc = "Open [P]revious", nowait = true, remap = false },
    { "<leader>f", group = "Find", nowait = true, remap = false },
    { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Highlights", nowait = true, remap = false },
    { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<leader>ff", function() require("user.telescope").find_files_ext_priority() end, desc = "Find files", nowait = true, remap = false },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help", nowait = true, remap = false },
    { "<leader>fi", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", desc = "Media", nowait = true, remap = false },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search", nowait = true, remap = false },
    { "<leader>fm", "<cmd>:Telescope metals commands<cr>", desc = "Show [M]etals commands", nowait = true, remap = false },
    { "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects", nowait = true, remap = false },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File", nowait = true, remap = false },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find String", nowait = true, remap = false },
    { "<leader>ft", function() require("user.telescope").live_grep_ext_priority() end, desc = "Find Text", nowait = true, remap = false },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
    { "<leader>j", group = "Jump to", nowait = true, remap = false },
    { "<leader>jD", "<cmd>lua vim.lsp.buf.definition()<cr><cmd>zz<cr>", desc = "Jump to [D]efinition", nowait = true, remap = false },
    { "<leader>jS", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", desc = "Workspace [s]ymbols", nowait = true, remap = false },
    { "<leader>jd", "<cmd>lua vim.lsp.buf.declaration()<cr><cmd>zz<cr>", desc = "Jump to [d]eclaration", nowait = true, remap = false },
    { "<leader>jh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature [h]elp", nowait = true, remap = false },
    { "<leader>ji", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Jump to [i]mplementations", nowait = true, remap = false },
    { "<leader>jr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Jump to [r]eferences", nowait = true, remap = false },
    { "<leader>js", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", desc = "Document [s]ymbols", nowait = true, remap = false },
    { "<leader>l", group = "LSP", nowait = true, remap = false },
    { "<leader>lD", "<cmd>CloseFloatingWindows<cr>", desc = "[D]elete floating windows", nowait = true, remap = false },
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info", nowait = true, remap = false },
    { "<leader>lR", function()
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
          vim.lsp.stop_client(client.id, true)
        end
        vim.defer_fn(function() vim.cmd("edit") end, 200)
      end, desc = "Restart LSP", nowait = true, remap = false },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics", nowait = true, remap = false },
    { "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix", nowait = true, remap = false },
    { "<leader>lf", "<cmd>lua require('conform').format()<cr>", desc = "Format", nowait = true, remap = false },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic", nowait = true, remap = false },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
    { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics", nowait = true, remap = false },
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit", nowait = true, remap = false },
    { "<leader>s", group = "Spelling", nowait = true, remap = false },
    { "<leader>sq", "<cmd>:set spell!<cr>", desc = "[q]uit spelling", nowait = true, remap = false },
    { "<leader>ss", "<cmd>:set spell<cr>", desc = "[s]tart spelling", nowait = true, remap = false },
    { "<leader>w", group = "Windows", nowait = true, remap = false },
    { "<leader>wd", "<cmd>:q<cr>", desc = "[D]elete current", nowait = true, remap = false },
    { "<leader>wf", "<cmd>:only<cr>", desc = "[F]ocus current", nowait = true, remap = false },
    { "<leader>wh", "<cmd>:sp<cr>", desc = "Split [H]orizontally", nowait = true, remap = false },
    { "<leader>wv", "<cmd>:vsplit<cr>", desc = "Split [V]ertically", nowait = true, remap = false },
    { "<leader>z", group = "Folds", nowait = true, remap = false },
    { "<leader>zC", "zC", desc = "[C]lose All fold", nowait = true, remap = false },
    { "<leader>zO", "zO", desc = "[O]pen All fold", nowait = true, remap = false },
    { "<leader>zc", "zc", desc = "[c]lose fold", nowait = true, remap = false },
    { "<leader>zo", "zo", desc = "[o]pen fold", nowait = true, remap = false },
    {
      mode = { "v" },
      { "<leader>l", group = "LSP", nowait = true, remap = false },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    },
  }
end

return M
