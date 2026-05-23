-- [nfnl] init.fnl
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.scrolloff = 23
vim.o.guicursor = "i-ci-ve:hor23-blinkon200-blinkoff300"
vim.cmd.colorscheme("catppuccin")
vim.keymap.set("i", "\f", "\206\187")
vim.keymap.set("n", "<leader>l", "<CMD>!love .<CR>", {desc = "Love <3"})
vim.keymap.set("n", "<leader>r", "<CMD>restart<CR>", {desc = "Restart nvim"})
local function _1_()
  return vim.pack.update()
end
vim.keymap.set("n", "<leader>pu", _1_, {desc = "Update plugins"})
local function _2_()
  local function _3_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:34", 2)
    else
    end
    return not x.active
  end
  local function _5_(x)
    if (nil == x) then
      _G.error("Missing argument x on init.fnl:36", 2)
    else
    end
    return x.spec.name
  end
  return vim.pack.del(vim.iter(vim.pack.get()):filter(_3_):map(_5_):totable())
end
vim.keymap.set("n", "<leader>pv", _2_, {desc = "Vacuum plugins"})
local function make_fzf(picker)
  if (nil == picker) then
    _G.error("Missing argument picker on init.fnl:41", 2)
  else
  end
  local function _8_()
    return vim.cmd(("FzfLua " .. picker))
  end
  return _8_
end
vim.keymap.set("n", "<leader>ff", make_fzf("files"), {desc = "Find files"})
vim.keymap.set("n", "<leader>fb", make_fzf("buffers"), {desc = "Find buffers"})
vim.keymap.set("n", "<leader>fh", make_fzf("helptags"), {desc = "Find help"})
local function build(ev)
  if (nil == ev) then
    _G.error("Missing argument ev on init.fnl:58", 2)
  else
  end
  local name = ev.data.spec.name
  local kind = ev.data.kind
  local upd_3f = ((kind == "install") or (kind == "update"))
  if ((name == "parinfer") and upd_3f) then
    vim.system({"cargo", "build", "--release"}, {cwd = ev.data.path})
  else
  end
  if ((name == "treesitter") and upd_3f) then
    return vim.cmd("TSInstall lua fennel scheme zsh")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("PackChanged", {callback = build})
local function gh(repo)
  if (nil == repo) then
    _G.error("Missing argument repo on init.fnl:71", 2)
  else
  end
  return ("https://github.com/" .. repo)
end
vim.pack.add({gh("Olical/nfnl"), gh("Olical/conjure"), {src = gh("eraserhd/parinfer-rust"), name = "parinfer", version = "master"}, {src = gh("romus204/tree-sitter-manager.nvim"), name = "treesitter"}, {src = gh("nvim-mini/mini.surround"), name = "surround"}, {src = gh("nvim-mini/mini.jump2d"), name = "jump2d"}, {src = gh("nvim-mini/mini.icons"), name = "icons"}, {src = gh("ibhagwan/fzf-lua"), name = "fzf"}, {src = gh("folke/which-key.nvim"), name = "whichkey"}})
local function make_setup(plugin)
  if (nil == plugin) then
    _G.error("Missing argument plugin on init.fnl:92", 2)
  else
  end
  return require(plugin).setup
end
make_setup("tree-sitter-manager")()
make_setup("mini.surround")()
make_setup("mini.jump2d")()
make_setup("mini.icons")()
make_setup("fzf-lua")({"border-fused"})
vim.g["conjure#log#jump_to_latest#enabled"] = true
vim.g["conjure#log#jump_to_latest#cursor_scroll_position"] = "bottom"
vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
do
  local repl_socket = (vim.env.HOME .. "/.local/share/guile-repl.socket")
  vim.g["conjure#client#guile#socket#pipename"] = repl_socket
end
return {}
