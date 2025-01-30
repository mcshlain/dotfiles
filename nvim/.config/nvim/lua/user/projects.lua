local M = {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"

  wk.register({
    p = {
      name = "Project",
      p = {
        "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
        "Show Projects",
        noremap = true,
        silent = true,
      },
    },
  }, { prefix = "<leader>" })

  require("project_nvim").setup {
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { "pattern" },
    patterns = {
      ".git",
      "_darcs",
      ".hg",
      ".bzr",
      ".svn",
      "Makefile",
      "package.json",
      "pom.xml",
      "lazy-lock.json",
      "Pipfile",
    },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    scope_chdir = "global",
  }
end

return M
