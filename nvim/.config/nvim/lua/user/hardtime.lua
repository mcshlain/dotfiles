local M = {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
}

M.opts = {
  max_count = 9999,
  disabled_keys = {
    ["<Up>"] = { "n", "x" },
    ["<Down>"] = { "n", "x" },
    ["<Left>"] = { "n", "x" },
    ["<Right>"] = { "n", "x" },
  },
}

return M
