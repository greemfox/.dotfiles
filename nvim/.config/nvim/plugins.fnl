(fn gh [repo]
  (.. "https://github.com/" repo))

(vim.pack.add [(gh "Olical/nfnl")
	       (gh "Olical/conjure")
	       (gh "folke/which-key.nvim")])

