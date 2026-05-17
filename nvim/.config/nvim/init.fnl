;; Options
(set vim.g.mapleader ",")
(set vim.g.maplocalleader ".")

(set vim.o.scrolloff 23) ; Hail Eris
(set vim.o.number true)
(set vim.o.relativenumber true)

;; Keybinds
(vim.keymap.set "n" "<leader>r" "<CMD>restart<CR>" {:desc "Restart nvim"})
(vim.keymap.set "n"
		"<leader>v"
		(λ []
		   (vim.pack.del (: (: (: (vim.iter (vim.pack.get))
				          :filter
				          (λ [x] (not x.active)))
				       :map
				       (λ [x] x.spec.name))
				    :totable)))
		{:desc "Vacuum the plugin space"})

;; Plugins
(fn gh [repo]
  (.. "https://github.com/" repo))

(vim.pack.del ["paredit" "treesitter"])

(vim.pack.add [(gh "Olical/nfnl")
	       (gh "Olical/conjure")
	       {:src (gh "julienvincent/nvim-paredit")
		:name "paredit"}
	       {:src (gh "nvim-treesitter/nvim-treesitter")
	        :name "treesitter"
	        :branch "main"
	        :dependencies ["neovim-treesitter/treesitter-parser-registry"]
		:ensure_installed ["fennel" "scheme"]
		:build ":TSUpdate"}
	       (gh "folke/which-key.nvim")])
((. (require "nvim-paredit") :setup))

(set vim.g.conjure#client#scheme#stdio#command "petite")
(set vim.g.conjure#client#scheme#stdio#prompt_pattern "> $?")

{}

