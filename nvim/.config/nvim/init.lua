-- [nfnl] init.fnl
vim.g.mapleader = ","
vim.g.maplocalleader = "."
vim.o.scrolloff = 23
vim.o.number = true
vim.o.relativenumber = true
vim.keymap.set("n", "<leader>r", "<CMD>restart<CR>", {desc = "Restart nvim"})
local function _1_()
  local function _2_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:16", 2)
    else
    end
    return not x.active
  end
  local function _4_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:18", 2)
    else
    end
    return x.spec.name
  end
  return vim.pack.del(vim.iter(vim.pack.get()):filter(_2_):map(_4_):totable())
end
vim.keymap.set("n", "<leader>v", _1_, {desc = "Vacuum the plugin space"})
local function gh(repo)
  return ("https://github.com/" .. repo)
end
vim.pack.del({"paredit", "treesitter"})
vim.pack.add({gh("Olical/nfnl"), gh("Olical/conjure"), {src = gh("julienvincent/nvim-paredit"), name = "paredit"}, {src = gh("nvim-treesitter/nvim-treesitter"), name = "treesitter", branch = "main", dependencies = {"neovim-treesitter/treesitter-parser-registry"}, ensure_installed = {"fennel", "scheme"}, build = ":TSUpdate"}, gh("folke/which-key.nvim")})
require("nvim-paredit").setup()
vim.g["conjure#client#scheme#stdio#command"] = "petite"
vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
return {}
