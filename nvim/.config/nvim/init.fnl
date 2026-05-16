(set vim.g.mapleader ",")
(set vim.g.maplocalleader ".")

(set vim.o.scrolloff 23) ; Hail Eris
(set vim.o.number true)
(set vim.o.relativenumber true)

(fn gh [repo]
  (.. "https://github.com/" repo))

(vim.pack.add [(gh "Olical/nfnl")
	       (gh "Olical/conjure")
	       {:src (gh "nvim-treesitter/nvim-treesitter")
	        :branch "main"
	        :dependencies ["neovim-treesitter/treesitter-parser-registry"]
		:build ":TSUpdate"}
	       (gh "folke/which-key.nvim")])

(set vim.g.conjure#client#scheme#stdio#command "petite")
(set vim.g.conjure#client#scheme#stdio#prompt_pattern "> $?")

{}
