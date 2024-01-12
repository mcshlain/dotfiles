local M = {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
}

function M.config()
  local metals_config = require("metals").bare_config()
  -- Example of settings
  metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }
  metals_config.init_options = {
    statusBarProvider = "on",
  }

  -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

  metals_config.on_attach = function(_, bufnr)
    require("metals").setup_dap()
    local keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = false, silent = true }

    -- LSP mappings
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    keymap(bufnr, "n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
    keymap(bufnr, "n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
    keymap(bufnr, "n", "[c", "<cmd>lua vim.diagnostic.goto_prev({ wrap = false })<cr>", opts)
    keymap(bufnr, "n", "]c", "<cmd>lua vim.diagnostic.goto_next({ wrap = false })<cr>", opts)

    local wk = require "which-key"
    wk.register({
      b = {
        name = "Buffer",
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "[R]ename Buffer", buffer = bufnr, noremap = false },
        i = { "<cmd>lua vim.lsp.codelens.run()<cr>", "[I]nspect Buffer - Codelens", buffer = bufnr, noremap = false },
        d = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Buffer [D]iagnostics", buffer = bufnr, noremap = false },
      },
      a = {
        name = "Actions",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code [A]ction", buffer = bufnr, noremap = false },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "[S]ignature Help", buffer = bufnr, noremap = false },
        w = { "<cmd>lua require('metals').hover_worksheet()<cr>", "[W]orksheet Hover", buffer = bufnr, noremap = false },
      },
      i = {
        name = "Information",
        a = {
          "<cmd>lua vim.diagnostic.setqflist()<cr>",
          "[A]ll workspace diagnostics",
          buffer = bufnr,
          noremap = false,
        },
        e = {
          "<cmd>lua vim.diagnostic.setqflist({ severity = 'E' })<cr>",
          "Errors in workspace",
          buffer = bufnr,
          noremap = false,
        },
        w = {
          "<cmd>lua vim.diagnostic.setqflist({ severity = 'W' })<cr>",
          "Warnings in workspace",
          buffer = bufnr,
          noremap = false,
        },
      },
    }, { prefix = "<leader>" })
  end

  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })
end

vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

return M
