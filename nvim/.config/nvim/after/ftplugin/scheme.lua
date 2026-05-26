-- [nfnl] scheme.fnl
local function _1_()
  return vim.fn.chansend(repl, "\4")
end
vim.api.nvim_create_autocmd({"VimLeavePre"}, {pattern = {"*"}, callback = _1_})
local script = (vim.env.HOME .. "/.config" .. "/guile-repl.sh")
local repl = vim.fn.jobstart({"sh", script})
return nil
