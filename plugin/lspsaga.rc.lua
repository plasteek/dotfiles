local status, saga = pcall(require, "lspsaga")
if (not status) then
    return
end

saga.setup({
    ui = {
        border = 'rounded',
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind()
    },
    symbol_in_winbar = {
        enable = false
    },
    lightbulb = {
        enable = false
    },
    outline = {
        layout = 'float'
    },
    colors = {
        normal_bg = '#002b36'
    }

})

local diagnostic = require("lspsaga.diagnostic")
local opts = {
    noremap = true,
    silent = true
}
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
vim.keymap.set('n', 'gt', '<Cmd>Lspsaga goto_type_definition<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- code action
vim.keymap.set({"n", "v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- local status, saga = pcall(require, "lspsaga")
-- if (not status) then
--     return
-- end

-- saga.setup {
--     server_filetype_map = {
--         typescript = 'typescript'
--     },
--     colors = {
--         normal_bg = '#002b36'
--     },
--     symbol_in_winbar = {
--         enable = false
--     }
-- }

-- local opts = {
--     noremap = true,
--     silent = true
-- }
-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- -- vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- -- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- -- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
-- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
