;; Options
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(set vim.o.number true)
(set vim.o.relativenumber true)
(set vim.o.breakindent true)
(set vim.o.ignorecase true)
(set vim.o.scrolloff 23) ; Hail Eris

(vim.cmd.colorscheme "catppuccin")

;; Keybinds
(λ make-fzf [x]
   (λ []
      (vim.cmd (.. "FzfLua " x))))

(vim.keymap.set "n" "<leader>r" "<CMD>restart<CR>" {:desc "Restart nvim"})
(vim.keymap.set "n"
                "<leader>pv"
                (λ []
                  (vim.pack.del (: (: (: (vim.iter (vim.pack.get))
                                         :filter
                                         (λ [x] (not x.active)))
                                      :map
                                      (λ [x] x.spec.name))
                                   :totable)))
                {:desc "Vacuum plugins"})
(vim.keymap.set "n"
                "<leader>pu"
                (λ []
                  (vim.pack.update))
                {:desc "Update plugins"})
(vim.keymap.set "n"
                "<leader>ff"
                (make-fzf "files")
                {:desc "Find files"})
(vim.keymap.set "n"
                "<leader>fb"
                (make-fzf "buffers")
                {:desc "Find buffers"})
(vim.keymap.set "n"
                "<leader>fh"
                (make-fzf "helptags")
                {:desc "Find help"})

;; Plugins
(λ gh [repo]
   (.. "https://github.com/" repo))

(λ make-setup [plugin]
   (. (require plugin) :setup))

(λ hooks [ev]
   (let [name ev.data.spec.name
         kind ev.data.kind
         upd? (or (= kind "install")
                  (= kind "update"))] 
     (if (and (= name "parinfer") upd?)
         (vim.system ["cargo" "build" "--release"] {:cwd ev.data.path}))))

(vim.api.nvim_create_autocmd "PackChanged" {:callback hooks})

(vim.pack.add [(gh "Olical/nfnl")
               (gh "Olical/conjure")
               {:src (gh "eraserhd/parinfer-rust")
                :name "parinfer"
                :version "master"}
               {:src (gh "romus204/tree-sitter-manager.nvim")
                :name "treesitter"}
               {:src (gh "nvim-mini/mini.surround")
                :name "surround"}
               {:src (gh "nvim-mini/mini.jump2d")
                :name "jump2d"}
               {:src (gh "nvim-mini/mini.icons")
                :name "icons"}
               {:src (gh "ibhagwan/fzf-lua")
                :name "fzf"}
               {:src (gh "folke/which-key.nvim")
                :name "whichkey"}])

((make-setup "tree-sitter-manager"))
((make-setup "mini.surround"))
((make-setup "mini.jump2d"))
((make-setup "mini.icons"))
((make-setup "fzf-lua") ["border-fused"])

(set vim.g.conjure#log#jump_to_latest#enabled true)
(set vim.g.conjure#log#jump_to_latest#cursor_scroll_position "bottom")
(set vim.g.conjure#client#scheme#stdio#command "petite")
(set vim.g.conjure#client#scheme#stdio#prompt_pattern "> $?")

{}

