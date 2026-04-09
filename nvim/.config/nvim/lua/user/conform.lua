local M = {
  "stevearc/conform.nvim",
  opts = {},
}

function M.config()
  require("conform").setup {
    formatters = {
      eslint_d = {
        command = function()
          local local_bin = vim.fn.findfile("node_modules/.bin/eslint_d", vim.fn.getcwd() .. ";")
          return local_bin ~= "" and local_bin or "eslint_d"
        end,
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      javascript = { "eslint_d", "prettier" },
      typescript = { "eslint_d", "prettier" },
      javascriptreact = { "eslint_d", "prettier" },
      typescriptreact = { "eslint_d", "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
    },
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  }
end

return M
