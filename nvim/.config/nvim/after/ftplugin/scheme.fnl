(local script (.. vim.env.HOME "/.config" "/guile-repl.sh"))
(local repl (vim.fn.jobstart ["sh" script]))
