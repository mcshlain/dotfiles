local M = {
  "neogitorg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },
}

function M.config()
  local wk = require "which-key"

  wk.add {
    { "<leader>g", group = "Git" },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  }

  local icons = require "user.icons"
  require("neogit").setup {
    disable_signs = true,
    -- disable_hint = true,
    disable_context_highlighting = false,
    disable_commit_confirmation = true,
    disable_insert_on_commit = "auto",
    -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
    -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    -- Change the default way of opening neogit
    kind = "tab",
    -- Change the default way of opening the commit popup
    commit_popup = {
      kind = "split",
    },
    -- Change the default way of opening popups
    popup = {
      kind = "split",
    },
    -- customize displayed signs
    signs = {
      -- { CLOSED, OPENED }
      section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      hunk = { "", "" },
    },
    integrations = {
      diffview = true,
    },
    -- Setting any section to `false` will make the section not render at all
    sections = {
      untracked = {
        folded = false,
        hidden = false,
      },
      unstaged = {
        folded = false,
        hidden = false,
      },
      staged = {
        folded = false,
        hidden = false,
      },
      stashes = {
        folded = true,
        hidden = false,
      },
      unpulled = {
        folded = true,
        hidden = false,
      },
      unmerged = {
        folded = false,
        hidden = false,
      },
      recent = {
        folded = true,
        hidden = false,
      },
    },
    -- override/add mappings
    -- mappings = {
    --   -- modify status buffer mappings
    --   status = {
    --     ["q"] = "Close",
    --     ["1"] = "Depth1",
    --     ["2"] = "Depth2",
    --     ["3"] = "Depth3",
    --     ["4"] = "Depth4",
    --     ["<tab>"] = "Toggle",
    --     ["x"] = "Discard",
    --     ["s"] = "Stage",
    --     ["a"] = "StageUnstaged",
    --     ["<c-s>"] = "StageAll",
    --     ["u"] = "Unstage",
    --     ["U"] = "UnstageStaged",
    --     ["d"] = "DiffAtFile",
    --     ["$"] = "CommandHistory",
    --     ["<c-r>"] = "RefreshBuffer",
    --     ["o"] = "GoToFile",
    --     ["<enter>"] = "Toggle",
    --     ["<c-v>"] = "VSplitOpen",
    --     ["<c-x>"] = "SplitOpen",
    --     ["<c-t>"] = "TabOpen",
    --     ["?"] = "HelpPopup",
    --     ["D"] = "DiffPopup",
    --     ["p"] = "PullPopup",
    --     ["r"] = "RebasePopup",
    --     ["P"] = "PushPopup",
    --     ["c"] = "CommitPopup",
    --     ["L"] = "LogPopup",
    --     ["Z"] = "StashPopup",
    --     ["b"] = "BranchPopup",
    --     -- ["<space>"] = "Stage",
    --     -- Removes the default mapping of "s"
    --     -- ["s"] = "",
    --   },
    -- },
  }
end

return M
