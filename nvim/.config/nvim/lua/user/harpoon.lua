local M = {
  dir = "~/.config/nvim/local-plugins/harpoon",
  name = "harpoon",
  dependencies = { "nvim-telescope/telescope.nvim" },
}

function M.config()
  require("telescope").load_extension "harpoon"
  local wk = require "which-key"

  wk.add {
    { "<leader>m", group = "Markings" },
    { "<leader>mD", "<cmd>:lua require('harpoon.mark').clear_all()<cr>", desc = "[D]elete all Marks", remap = true },
    { "<leader>ma", "<cmd>:lua require('harpoon.mark').add_file()<cr>", desc = "[a]dd Mark", remap = true },
    { "<leader>md", "<cmd>:lua require('harpoon.mark').rm_file()<cr>", desc = "[d]elete Mark", remap = true },
    { "<leader>mm", "<cmd>:Telescope harpoon marks<cr>", desc = "Show [M]arks", remap = true },
    { "<leader>mt", "<cmd>:lua require('harpoon.mark').toggle_file()<cr>", desc = "[t]oggle Mark", remap = true },
  }
end

return M
