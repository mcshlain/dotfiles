local M = {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- {
    --   "mfussenegger/nvim-dap",
    --   config = function(self, opts)
    --     -- Debug settings if you're using nvim-dap
    --     local dap = require("dap")
    --
    --     dap.configurations.scala = {
    --       {
    --         type = "scala",
    --         request = "launch",
    --         name = "RunOrTest",
    --         metals = {
    --           runType = "runOrTestFile",
    --           --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    --         },
    --       },
    --       {
    --         type = "scala",
    --         request = "launch",
    --         name = "Test Target",
    --         metals = {
    --           runType = "testTarget",
    --         },
    --       },
    --     }
    --   end
    -- },
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
    statusBarProvider = "on"
  }

  -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

  metals_config.on_attach = function(client, bufnr)
    -- require("metals").setup_dap()
    local keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = false, silent = true}

    -- LSP mappings
    keymap(bufnr, "n", "gD","<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    keymap(bufnr, "n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
    keymap(bufnr, "n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
    keymap(bufnr, "n", "[c", "<cmd>lua vim.diagnostic.goto_prev({ wrap = false })<cr>", opts)
    keymap(bufnr, "n", "]c", "<cmd>lua vim.diagnostic.goto_next({ wrap = false })<cr>", opts)

    local wk = require("which-key")
    wk.register({
      b = {
        name = "Buffer",
        f = {"<cmd>lua vim.lsp.buf.format()<cr>", "[F]ormat Buffer", buffer=bufnr, noremap=false},
        r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "[R]ename Buffer", buffer=bufnr, noremap=false},
        i = {"<cmd>lua vim.lsp.codelens.run()<cr>", "[I]nspect Buffer - Codelens", buffer=bufnr, noremap=false},
        d = {"<cmd>lua vim.diagnostic.setloclist()<cr>", "Buffer [D]iagnostics", buffer=bufnr, noremap=false}
      },
      a = {
        name = "Actions",
        a = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code [A]ction", buffer=bufnr, noremap=false},
        s = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "[S]ignature Help", buffer=bufnr, noremap=false},
        w = {"<cmd>lua require('metals').hover_worksheet()<cr>", "[W]orksheet Hover", buffer=bufnr, noremap=false},
      },
      d = {
        name = "Diagnostics",
        d = {"<cmd>lua vim.diagnostic.setqflist()<cr>", "All workspace [d]iagnostics", buffer=bufnr, noremap=false},
        e = {"<cmd>lua vim.diagnostic.setqflist({ severity = 'E' })<cr>", "Errors in workspace", buffer=bufnr, noremap=false},
        w = {"<cmd>lua vim.diagnostic.setqflist({ severity = 'W' })<cr>", "Warnings in workspace", buffer=bufnr, noremap=false},
      }
    }, {prefix ="<leader>"})
    -- -- Example mappings for usage with nvim-dap. If you don't use that, you can
    -- -- skip these
    -- map("n", "<leader>dc", function()
    --   require("dap").continue()
    -- end)
    --
    -- map("n", "<leader>dr", function()
    --   require("dap").repl.toggle()
    -- end)
    --
    -- map("n", "<leader>dK", function()
    --   require("dap.ui.widgets").hover()
    -- end)
    --
    -- map("n", "<leader>dt", function()
    --   require("dap").toggle_breakpoint()
    -- end)
    --
    -- map("n", "<leader>dso", function()
    --   require("dap").step_over()
    -- end)
    --
    -- map("n", "<leader>dsi", function()
    --   require("dap").step_into()
    -- end)
    --
    -- map("n", "<leader>dl", function()
    --   require("dap").run_last()
    -- end)
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

return M
