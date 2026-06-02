;; Options
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(set vim.o.shiftwidth 2)
(set vim.o.expandtab true)
(set vim.o.number true)
(set vim.o.relativenumber true)
(set vim.o.breakindent true)
(set vim.o.ignorecase true)
(set vim.o.linebreak true)
(set vim.o.scrolloff 23)
(set vim.o.guicursor "i-ci-ve:hor23-blinkon200-blinkoff300")

(vim.cmd.colorscheme "catppuccin")

;; Keybinds
(vim.keymap.set "i" "" "λ")
(vim.keymap.set "n"
                "<leader>r"
                "<CMD>restart<CR>"
                {:desc "Restart Neovim"})
(vim.keymap.set "n"
                "<leader>pu"
                #(vim.pack.update)
                {:desc "Plugin update"})
(vim.keymap.set "n"
                "<leader>pv"
                #(vim.pack.del (: (: (: (vim.iter (vim.pack.get))
                                        :filter
                                        #(not $.active))
                                     :map
                                     #($.spec.name))
                                  :totable))
                {:desc "Plugin vacuum"})

(λ make-fzf [picker]
  #(vim.cmd (.. "FzfLua " picker)))

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
(vim.keymap.set "n"
                "<leader>fg"
                (make-fzf "grep_visual")
                {:desc "Find grep"})
(vim.keymap.set "n"
                "<leader>fd"
                (make-fzf "diagnostics_document")
                {:desc "Find diagnostics"})
(vim.keymap.set "n"
                "<leader>fk"
                (make-fzf "keymaps")
                {:desc "Find keymaps"})

;; Autocommands
(λ build [ev]
   (let [name ev.data.spec.name
         kind ev.data.kind
         upd? (or (= kind "install")
                  (= kind "update"))]
     (if (and (= name "treesitter") upd?)
         (vim.cmd "TSInstall lua fennel scheme zsh"))))

(vim.api.nvim_create_autocmd "PackChanged" {:callback build})

;; Plugins
(λ gh [repo]
   (.. "https://github.com/" repo))

(vim.pack.add [(gh "Olical/nfnl")
               (gh "Olical/conjure")
               {:src (gh "gpanders/nvim-parinfer")
                :name "parinfer"}
               {:src (gh "romus204/tree-sitter-manager.nvim")
                :name "treesitter"}
               {:src (gh "neovim/nvim-lspconfig")
                :name "lspconfig"}
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

(λ make-setup [plugin]
   (. (require plugin) :setup))

((make-setup "tree-sitter-manager"))
((make-setup "mini.surround"))
((make-setup "mini.jump2d"))
((make-setup "mini.icons"))
((make-setup "fzf-lua") ["border-fused" "skim"])

;; Languages
(vim.lsp.enable "clojure_lsp")

(set vim.g.conjure#log#jump_to_latest#enabled true)
(set vim.g.conjure#log#jump_to_latest#cursor_scroll_position "bottom")

(set vim.g.conjure#filetype#scheme "conjure.client.guile.socket")
(let [repl-socket (.. vim.env.HOME "/.local/share/guile-repl.socket")]
     (set vim.g.conjure#client#guile#socket#pipename repl-socket))

{}
