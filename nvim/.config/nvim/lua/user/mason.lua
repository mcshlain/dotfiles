local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.servers = {
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "marksman",
  "pyright",
}

function M.config()
  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = M.servers,
    automatic_enable = {
          exclude = {
              "pyright",
          }
      }
    }
end

return M
