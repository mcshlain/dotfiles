local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>e", group = "Errors" },
    { "<leader>eK", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Open Diagnostics [F]loat" },
    { "<leader>ee", "<cmd>Trouble diagnostics toggle<cr>", desc = "[T]oggle Panel" },
    { "<leader>es", "<cmd>lua vim.diagnostic.show()<cr>", desc = "Diagnostics Show" },
  }

  require("trouble").setup {
    auto_close = true,
    auto_preview = true,
    multiline = true,
    indent_guides = true,
    warn_no_results = false,
    open_no_results = true,
    win = {
      size = { height = 10, width = 50 },
      border = "single",
    },
  }
end

return M
