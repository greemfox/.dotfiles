-- [nfnl] clojure.fnl
local function start_nrepl()
  vim.cmd("tabnew")
  return vim.fn.jobstart({"clj", "-M:nrepl"}, {term = true})
end
return vim.keymap.set("n", "<localleader>n", start_nrepl, {desc = "Start nREPL"})
