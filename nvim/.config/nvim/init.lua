-- [nfnl] init.fnl
vim.g.mapleader = ","
vim.g.maplocalleader = "."
vim.o.scrolloff = 23
vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.ignorecase = true
vim.keymap.set("n", "<leader>r", "<CMD>restart<CR>", {desc = "Restart nvim"})
local function _1_()
  local function _2_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:18", 2)
    else
    end
    return not x.active
  end
  local function _4_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:20", 2)
    else
    end
    return x.spec.name
  end
  return vim.pack.del(vim.iter(vim.pack.get()):filter(_2_):map(_4_):totable())
end
vim.keymap.set("n", "<leader>v", _1_, {desc = "Vacuum the plugin space"})
local function gh(repo)
  if (nil == repo) then
    _G.error("Missing argument repo on init.fnl:25", 2)
  else
  end
  return ("https://github.com/" .. repo)
end
local function setup(plugin)
  if (nil == plugin) then
    _G.error("Missing argument plugin on init.fnl:28", 2)
  else
  end
  return require(plugin).setup()
end
local function hooks(ev)
  if (nil == ev) then
    _G.error("Missing argument ev on init.fnl:31", 2)
  else
  end
  local name = ev.data.spec.name
  local kind = ev.data.kind
  local upd_3f = ((kind == "install") or (kind == "update"))
  if ((name == "parinfer") and upd_3f) then
    return vim.system({"cargo", "build", "--release"}, {cwd = ev.data.path})
  elseif ((name == "treesitter") and upd_3f) then
    return vim.cmd("TSUpdate")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("PackChanged", {callback = hooks})
vim.pack.add({gh("Olical/nfnl"), gh("Olical/conjure"), gh("nvim-mini/mini.jump2d"), gh("nvim-mini/mini.surround"), {src = gh("eraserhd/parinfer-rust"), name = "parinfer", version = "master"}, {src = gh("nvim-treesitter/nvim-treesitter"), name = "treesitter", version = "main"}, gh("folke/which-key.nvim")})
setup("mini.surround")
setup("mini.jump2d")
vim.g["conjure#client#scheme#stdio#command"] = "petite"
vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
return {}
