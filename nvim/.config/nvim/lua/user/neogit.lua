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

  wk.register ({
    g = {
      name = "Git",
      g = { "<cmd>Neogit<cr>", "Neogit" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
      },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
      },
    },
  }, { prefix = "<leader>" })

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
