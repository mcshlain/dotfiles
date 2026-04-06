local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
  lazy = true,
  cmd = "Telescope",
}

function M.config()
  local icons = require "user.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      preview = {
        treesitter = false,
      },
      sorting_strategy = nil,
      layout_strategy = nil,
      layout_config = {},
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/,!**/*.json,!**/*.ipynb",
      },
      file_ignore_patterns = {
        ".git", "node_modules", "%.jsonl?$", "%.ipynb$", "%.csv$", "%.sql(ite)?$", "%.bib$"
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }

  require("telescope").load_extension "fzf"
end

local ext_bias = { py = 0.9, md = 1.15, sqlite = 1.15, sqlite3 = 1.15, db = 1.15 }

local function apply_ext_bias(sorter, get_ext)
  -- fzf-native returns 1/fzf_score so lower = better; multiply to boost/sink by extension
  local orig_score = sorter.scoring_function
  sorter.scoring_function = function(self, prompt, line)
    local score = orig_score(self, prompt, line)
    if score == -1 then return -1 end
    local ext = get_ext(line)
    if ext then
      local bias = ext_bias[ext:lower()]
      if bias then return score * bias end
    end
    return score
  end
  return sorter
end

function M.find_files_ext_priority()
  local conf = require("telescope.config").values
  local sorter = apply_ext_bias(
    conf.file_sorter {},
    function(line) return line:match("%.([^./\\]+)$") end
  )
  require("telescope.builtin").find_files(
    require("telescope.themes").get_dropdown { sorter = sorter, previewer = false }
  )
end

function M.live_grep_ext_priority()
  local conf = require("telescope.config").values
  local sorter = apply_ext_bias(
    conf.generic_sorter {},
    -- live_grep lines are "path/to/file.ext:lnum:col:text"
    function(line) return line:match("^[^:]*%.([^./\\:]+):") end
  )
  require("telescope.builtin").live_grep(
    require("telescope.themes").get_dropdown { sorter = sorter }
  )
end

return M
