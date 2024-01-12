local M = {
  "karb94/neoscroll.nvim",
}

function M.config()
  local mappings = {}
  -- Syntax: t[keys] = {function, {function arguments}}
  mappings["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
  mappings["<PageUp>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
  mappings["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
  mappings["<PageDown>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
  mappings["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
  mappings["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
  mappings["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
  mappings["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
  mappings["zt"] = { "zt", { "250" } }
  mappings["zz"] = { "zz", { "250" } }
  mappings["zb"] = { "zb", { "250" } }

  require("neoscroll.config").set_mappings(mappings)

  require("neoscroll").setup {
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- Default easing function
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
  }
end
return M
