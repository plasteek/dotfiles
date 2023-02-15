require('akumillis/base')
require('akumillis/highlights')
require('akumillis/maps')
require('akumillis/plugins')
require'nvim-treesitter.install'.compilers = {'zig'}

local has = function(x)
    return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
    require('akumillis/macos')
end
if is_win then
    require('akumillis/windows')
end
