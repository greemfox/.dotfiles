(vim.api.nvim_create_autocmd ["VimLeavePre"]
                             {:pattern ["*"]
                              :callback #(vim.fn.chansend repl "\x04")})
(local script (.. vim.env.HOME "/.config" "/guile-repl.sh"))
(local repl (vim.fn.jobstart ["sh" script]))
