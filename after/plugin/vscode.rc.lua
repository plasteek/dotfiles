-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = true,
    -- Enable italic comment
    italic_comments = true,
    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF'
    },
    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = {
            fg = c.vscDarkBlue,
            bg = c.vscLightGreen,
            bold = true
        }
    }
})
-- local status, bufferline = pcall(require, "bufferline")
-- if (not status) then
--     return
-- end
-- -- -- VSCode theme
require("bufferline").setup({
    options = {
        mode = "tabs",
        buffer_close_icon = "",
        close_command = "Bdelete %d",
        close_icon = "",
        indicator = " ",
        left_trunc_marker = "",
        modified_icon = "●",
        offsets = {{
            filetype = "NvimTree",
            text = "EXPLORER",
            text_align = "center"
        }},
        right_mouse_command = "Bdelete! %d",
        right_trunc_marker = "",
        show_close_icon = false,
        show_tab_indicators = true
    },
    highlights = {
        fill = {
            fg = {
                attribute = "fg",
                highlight = "Normal"
            },
            bg = {
                attribute = "bg",
                highlight = "StatusLineNC"
            }
        },
        background = {
            fg = {
                attribute = "fg",
                highlight = "Normal"
            },
            bg = {
                attribute = "bg",
                highlight = "StatusLine"
            }
        },
        buffer_visible = {
            underline = true,
            undercurl = true,
            fg = {
                attribute = "fg",
                highlight = "Normal"
            },
            bg = {
                attribute = "bg",
                highlight = "Normal"
            }
        },
        buffer_selected = {
            underline = true,
            undercurl = true,
            fg = {
                attribute = "fg",
                highlight = "Normal"
            },
            bg = {
                attribute = "bg",
                highlight = "Normal"
            }
        },
        separator = {
            fg = {
                attribute = "bg",
                highlight = "Normal"
            },
            bg = {
                attribute = "bg",
                highlight = "StatusLine"
            }
        },
        separator_selected = {
            fg = {
                attribute = "fg",
                highlight = "Special"
            },
            bg = {
                attribute = "bg",
                highlight = "Normal"
            }
        },
        separator_visible = {
            fg = {
                attribute = "fg",
                highlight = "Normal"
            },
            bg = {
                attribute = "bg",
                highlight = "StatusLineNC"
            }
        },
        close_button = {
            fg = {
                attribute = "fg",
                highlight = "Normal"
            },
            bg = {
                attribute = "bg",
                highlight = "StatusLine"
            }
        },
        close_button_selected = {
            fg = {
                attribute = "fg",
                highlight = "normal"
            },
            bg = {
                attribute = "bg",
                highlight = "normal"
            }
        },
        close_button_visible = {
            fg = {
                attribute = "fg",
                highlight = "normal"
            },
            bg = {
                attribute = "bg",
                highlight = "normal"
            }
        }
    }
})
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
