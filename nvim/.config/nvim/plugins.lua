-- [nfnl] plugins.fnl
local function gh(repo)
  return ("https://github.com/" .. repo)
end
return vim.pack.add({gh("Olical/nfnl"), gh("Olical/conjure"), gh("folke/which-key.nvim")})
