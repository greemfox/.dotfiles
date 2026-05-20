-- [nfnl] scheme.fnl
local script = (vim.fn.stdpath("config") .. "/guile-repl.sh")
local repl = vim.fn.jobstart({"sh", script})
local function _1_()
  return vim.fn.chansend(repl, "\4")
end
return vim.api.nvim_create_autocmd({"VimLeavePre"}, {pattern = {"*"}, callback = _1_})
