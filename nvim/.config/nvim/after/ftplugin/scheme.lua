-- [nfnl] scheme.fnl
local function _1_()
  return print("Wrapping up the REPL...")
end
return vim.system({(vim.fn.stdpath("config") .. "/guile-repl.sh")}, {stderr = false, stdin = false, stdout = false}, _1_)
