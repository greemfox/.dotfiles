(vim.api.nvim_create_autocmd ["VimLeavePre"]
                             {:pattern ["*"]   
                              :callback (λ [] (vim.fn.chansend repl "\x04"))})
(local script (.. (vim.fn.stdpath "config") "/guile-repl.sh"))
(local repl (vim.fn.jobstart ["sh" script]))

