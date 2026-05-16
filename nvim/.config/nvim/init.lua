-- [nfnl] init.fnl
vim.g.mapleader = ","
vim.g.maplocalleader = "."
vim.o.scrolloff = 23
vim.o.number = true
vim.o.relativenumber = true
local function gh(repo)
  return ("https://github.com/" .. repo)
end
vim.pack.add({gh("Olical/nfnl"), gh("Olical/conjure"), {src = gh("nvim-treesitter/nvim-treesitter"), branch = "main", dependencies = {"neovim-treesitter/treesitter-parser-registry"}, build = ":TSUpdate"}, gh("folke/which-key.nvim")})
vim.g["conjure#client#scheme#stdio#command"] = "petite"
vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
return {}
