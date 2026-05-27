-- [nfnl] scheme.fnl
local script = (vim.env.HOME .. "/.config" .. "/guile-repl.sh")
return vim.fn.jobstart({"sh", script})
