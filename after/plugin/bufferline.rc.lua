-- This is basically for bufferline but we're using catppucin
local status, bufferline = pcall(require, "bufferline")
-- local mocha = require("catppuccin.palettes").get_palette "mocha"
local rose_pine = require('rose-pine.palette');

if (not status) then
    return
end

local highlights = require('rose-pine.plugins.bufferline')
bufferline.setup({
    options = {
        mode = "tabs",
        -- separator_style = 'slant',
        -- separator_style = 'padded_slant',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
    },
    highlights = highlights
})

-- bufferline.setup({
--     options = {
--         mode = "tabs",
--         -- separator_style = 'slant',
--         -- separator_style = 'padded_slant',
--         always_show_bufferline = false,
--         show_buffer_close_icons = false,
--         show_close_icon = false,
--         color_icons = true
--     },
--     highlights = {
--         separator_selected = {
--             fg = '#FFFFFF'
--         },
--         background = {
--             fg = rose_pine.text,
--             bg = rose_pine.base
--         },

--         fill = {
--             fg = rose_pine.text,
--             bg = rose_pine.base
--         }
--     }
--     -- highlights = {
--     -- separator = {
--     --     fg = '#073642',
--     --     bg = '#002b36'
--     -- },
--     -- separator_selected = {
--     --     fg = '#073642'
--     -- },
--     -- background = {
--     --     fg = '#657b83',
--     --     bg = '#002b36'
--     -- },
--     -- buffer_selected = {
--     --     fg = '#fdf6e3',
--     --     underline = true,
--     --     undercurl = true,
--     --     italic = true
--     -- },
--     -- fill = {
--     --     bg = '#073642'
--     -- }
--     -- }
--     -- highlights = require("catppuccin.groups.integrations.bufferline").get {
--     --     styles = { "italic", "bold" },
--     --     custom = {
--     --         all = {
--     --             fill = {},
--     --             background = {
--     --                 fg = mocha.text
--     --             }
--     --         }
--     --     }
--     -- }
-- })
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
