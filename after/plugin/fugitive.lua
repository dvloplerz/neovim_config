vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local dvxGroupFugitive = augroup("dvx_fugitive", {})


autocmd('BufWinEnter', {
  group = dvxGroupFugitive,
  pattern = '*',
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }

    -- push
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git('push')
    end, opts)

    -- rebase always
    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git({ 'pull', '--rebase' })
    end, opts)

    -- set branch to push
    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
  end,
})
