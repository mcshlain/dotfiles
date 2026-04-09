local M = {
  "folke/ts-comments.nvim",
  event = "VeryLazy",
}

function M.config()
  require("ts-comments").setup {}

  local wk = require "which-key"
  wk.add {
    { "<leader>/", "gcc", desc = "Comment", nowait = true, remap = true },
    {
      mode = { "v" },
      { "<leader>/", "gc", desc = "Comment toggle linewise (visual)", nowait = true, remap = true },
    },
  }
end

return M
