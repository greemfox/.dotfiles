-- [nfnl] init.fnl
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.scrolloff = 23
vim.cmd.colorscheme("catppuccin")
local function make_fzf(x)
  if (nil == x) then
    _G.error("Missing argument x on init.fnl:14", 2)
  else
  end
  local function _2_()
    return vim.cmd(("FzfLua " .. x))
  end
  return _2_
end
vim.keymap.set("n", "<leader>r", "<CMD>restart<CR>", {desc = "Restart nvim"})
local function _3_()
  local function _4_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:24", 2)
    else
    end
    return not x.active
  end
  local function _6_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:26", 2)
    else
    end
    return x.spec.name
  end
  return vim.pack.del(vim.iter(vim.pack.get()):filter(_4_):map(_6_):totable())
end
vim.keymap.set("n", "<leader>pv", _3_, {desc = "Vacuum plugins"})
local function _8_()
  return vim.pack.update()
end
vim.keymap.set("n", "<leader>pu", _8_, {desc = "Update plugins"})
vim.keymap.set("n", "<leader>ff", make_fzf("files"), {desc = "Find files"})
vim.keymap.set("n", "<leader>fb", make_fzf("buffers"), {desc = "Find buffers"})
vim.keymap.set("n", "<leader>fh", make_fzf("helptags"), {desc = "Find help"})
local function gh(repo)
  if (nil == repo) then
    _G.error("Missing argument repo on init.fnl:48", 2)
  else
  end
  return ("https://github.com/" .. repo)
end
local function make_setup(plugin)
  if (nil == plugin) then
    _G.error("Missing argument plugin on init.fnl:51", 2)
  else
  end
  return require(plugin).setup
end
local function hooks(ev)
  if (nil == ev) then
    _G.error("Missing argument ev on init.fnl:54", 2)
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
vim.pack.add({gh("Olical/nfnl"), gh("Olical/conjure"), {src = gh("eraserhd/parinfer-rust"), name = "parinfer", version = "master"}, {src = gh("romus204/tree-sitter-manager.nvim"), name = "treesitter"}, {src = gh("nvim-mini/mini.surround"), name = "surround"}, {src = gh("nvim-mini/mini.jump2d"), name = "jump2d"}, {src = gh("nvim-mini/mini.icons"), name = "icons"}, {src = gh("ibhagwan/fzf-lua"), name = "fzf"}, {src = gh("folke/which-key.nvim"), name = "whichkey"}})
make_setup("tree-sitter-manager")()
make_setup("mini.surround")()
make_setup("mini.jump2d")()
make_setup("mini.icons")()
make_setup("fzf-lua")({"border-fused"})
vim.g["conjure#log#jump_to_latest#enabled"] = true
vim.g["conjure#log#jump_to_latest#cursor_scroll_position"] = "bottom"
vim.g["conjure#client#scheme#stdio#command"] = "petite"
vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
return {}
