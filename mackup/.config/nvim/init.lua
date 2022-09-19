require('msiamn.base')
require('msiamn.highlights')
require('msiamn.maps')
require('msiamn.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('msiamn.macos')
end
if is_win then
  require('msiamn.windows')
end

vim.opt.guifont = { "SFMono Nerd Font", ":h19" }
