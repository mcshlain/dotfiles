-- local M = { "mbbill/undotree" }
--
--
-- function M.config()
--   local wk = require "which-key"
--
--   wk.add {
--     { "<leader>u", group = "Undo" },
--     { "<leader>uu", "<cmd>:UndotreeToggle<cr>", desc = "Undo Tree", remap = false },
--   }
-- end
--
-- return M

local M = {
  "debugloop/telescope-undo.nvim",
  dependencies = { -- note how they're inverted to above example
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  -- keys = {
  --   { -- lazy style key map
  --     "<leader>u",
  --     "<cmd>Telescope undo<cr>",
  --     desc = "undo history",
  --   },
  -- },
  opts = {
    extensions = {
      undo = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
      },
    },
  },
}

M.config = function(_, opts)
  -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
  -- configs for us. We won't use data, as everything is in it's own namespace (telescope
  -- defaults, as well as each extension).
  require("telescope").setup(opts)
  require("telescope").load_extension "undo"

  local wk = require "which-key"

  wk.add {
    { "<leader>u", group = "Undo" },
    { "<leader>uu", "<cmd>:lua require('telescope').extensions.undo.undo()<cr>", desc = "Undo Tree", remap = false },
  }
end

return M
