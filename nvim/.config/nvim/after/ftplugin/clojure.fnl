(fn start-nrepl [] 
  (vim.cmd "tabnew")
  (vim.fn.jobstart ["clj" "-M:nrepl"] {:term true})) 
(vim.keymap.set
  "n"
  "<localleader>n"
  start-nrepl
  {:desc "Start nREPL"})
