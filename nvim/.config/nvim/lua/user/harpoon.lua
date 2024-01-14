local M = {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-telescope/telescope.nvim" },
}

function M.config()
  require("telescope").load_extension "harpoon"
  local wk = require "which-key"

  wk.register({
    m = {
      name = "Markings",
      m = { "<cmd>:Telescope harpoon marks<cr>", "Show [M]arks", noremap = false },
      a = { "<cmd>:lua require('harpoon.mark').add_file()<cr>", "[a]dd Mark", noremap = false },
      d = { "<cmd>:lua require('harpoon.mark').rm_file()<cr>", "[d]elete Mark", noremap = false },
      t = { "<cmd>:lua require('harpoon.mark').toggle_file()<cr>", "[t]oggle Mark", noremap = false },
      D = { "<cmd>:lua require('harpoon.mark').clear_all()<cr>", "[D]elete all Marks", noremap = false },
    },
  }, { prefix = "<leader>" })
end

return M
