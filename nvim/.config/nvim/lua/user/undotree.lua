local M = {
  "XXiaoA/atone.nvim",
  event = "VeryLazy",
}

function M.config()
  require("atone").setup {
    layout = { direction = "right" },
    auto_attach = {
      enabled = true,
      excluded_ft = { "oil" },
    },
    ui = { border = "rounded" },
    keymaps = { tree = { undo_to = "u" } },
  }

  -- Map <CR> in the atone tree to undo to the selected node and close the panel.
  -- undo_to is remapped to "u" above so we can feed it without recursion.
  -- defer_fn ensures close() runs after atone's internal scheduled callbacks finish.
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "atone",
    callback = function(ev)
      vim.keymap.set("n", "<CR>", function()
        vim.api.nvim_feedkeys("u", "m", false)
        vim.defer_fn(function() require("atone.core").close() end, 10)
      end, { buffer = ev.buf, nowait = true })
    end,
  })

  local wk = require "which-key"

  wk.add {
    { "<leader>u", "<cmd>Atone toggle<cr>", desc = "Undo Tree", remap = false },
  }
end

return M
