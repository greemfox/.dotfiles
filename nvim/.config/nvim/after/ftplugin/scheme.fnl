(local script (.. vim.env.HOME "/.config" "/guile-repl.sh"))
(vim.fn.jobstart ["sh" script])
