(vim.system [(.. (vim.fn.stdpath "config") "/guile-repl.sh")]
            {:stdin false :stdout false :stderr false}
            (λ [] (print "Wrapping up the REPL...")))
; TODO: make this thing work
