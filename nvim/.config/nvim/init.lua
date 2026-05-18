-- [nfnl] init.fnl
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.scrolloff = 23
vim.cmd.colorscheme("catppuccin")
vim.keymap.set("n", "<leader>r", "<CMD>restart<CR>", {desc = "Restart nvim"})
local function _1_()
  local function _2_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:20", 2)
    else
    end
    return not x.active
  end
  local function _4_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:22", 2)
    else
    end
    return x.spec.name
  end
  return vim.pack.del(vim.iter(vim.pack.get()):filter(_2_):map(_4_):totable())
end
vim.keymap.set("n", "<leader>v", _1_, {desc = "Vacuum plugins"})
local function _6_()
  return vim.pack.update()
end
vim.keymap.set("n", "<leader>u", _6_, {desc = "Update plugins"})
local function gh(repo)
  if (nil == repo) then
    _G.error("Missing argument repo on init.fnl:32", 2)
  else
  end
  return ("https://github.com/" .. repo)
end
local function setup(plugin)
  if (nil == plugin) then
    _G.error("Missing argument plugin on init.fnl:35", 2)
  else
  end
  return require(plugin).setup
end
local function hooks(ev)
  if (nil == ev) then
    _G.error("Missing argument ev on init.fnl:38", 2)
  else
  end
  local name = ev.data.spec.name
  local kind = ev.data.kind
  local upd_3f = ((kind == "install") or (kind == "update"))
  if ((name == "parinfer") and upd_3f) then
    return vim.system({"cargo", "build", "--release"}, {cwd = ev.data.path})
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("PackChanged", {callback = hooks})
vim.pack.add({gh("Olical/nfnl"), gh("Olical/conjure"), {src = gh("eraserhd/parinfer-rust"), name = "parinfer", version = "master"}, {src = gh("romus204/tree-sitter-manager.nvim"), name = "treesitter"}, {src = gh("nvim-mini/mini.surround"), name = "surround"}, {src = gh("nvim-mini/mini.jump2d"), name = "jump2d"}, {src = gh("folke/which-key.nvim"), name = "whichkey"}})
setup("tree-sitter-manager")()
setup("mini.surround")()
setup("mini.jump2d")()
vim.g["conjure#client#scheme#stdio#command"] = "petite"
vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
return {}
