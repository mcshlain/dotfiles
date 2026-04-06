-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Workaround for nvim-treesitter bug on Neovim 0.11: malformed nodes passed to
-- get_node_text cause a "nil range method" crash during markdown injection parsing.
local orig_get_node_text = vim.treesitter.get_node_text
vim.treesitter.get_node_text = function(node, source, opts)
  if type(node) ~= "userdata" then return "" end
  return orig_get_node_text(node, source, opts)
end

vim.api.nvim_create_user_command('CloseFloatingWindows', function(opts)
    for _, window_id in ipairs(vim.api.nvim_list_wins()) do
        -- If window is floating
        if vim.api.nvim_win_get_config(window_id).relative ~= '' then
            -- Force close if called with !
            vim.api.nvim_win_close(window_id, opts.bang)
        end
    end
end, { bang = true, nargs = 0 })
