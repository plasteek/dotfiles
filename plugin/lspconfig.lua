-- vim.lsp.set_log_level("debug")
local tsstatus, typescript = pcall(require, 'typescript')
local status, nvim_lsp = pcall(require, "lspconfig")

if (not status) then
    return
end

if (not tsstatus) then
    return
end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

local augroup_format = vim.api.nvim_create_augroup("Format", {
    clear = true
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {
        noremap = true,
        silent = true
    }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {'', -- Text
'', -- Method
'', -- Function
'', -- Constructor
'', -- Field
'', -- Variable
'', -- Class
'ﰮ', -- Interface
'', -- Module
'', -- Property
'', -- Unit
'', -- Value
'', -- Enum
'', -- Keyword
'﬌', -- Snippet
'', -- Color
'', -- File
'', -- Reference
'', -- Folder
'', -- EnumMember
'', -- Constant
'', -- Struct
'', -- Event
'ﬦ', -- Operator
'' -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

typescript.setup {
    disable_commands = false,
    debug = false,
    server = {
        -- cmd = {"typescript-language-server", "--stdio"},
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact",
                     "javascript.jsx"}
    }
}

-- nvim_lsp.tsserver.setup {
--     on_attach = on_attach,
--     filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
--     -- cmd = {"typescript-language-server", "--stdio"},
--     -- cmd = {"tsserver"},
--     capabilities = capabilities,

--     commands = {
--         RenameFile = {
--             rename_file,
--             description = "Rename File"
--         }
--     }
-- }

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.flow.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },

            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            }
        }
    },
    capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.prismals.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"prisma"},
    settings = {
        prisma = {
            prismaFmtBinPath = ""
        }
    }
}
-- nvim_lsp.prismals.setup({})

nvim_lsp.hls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 4,
        prefix = "●"
    },
    severity_sort = true
})

-- Diagnostic symbols in the sign column (gutter)
local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = ""
    })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always" -- Or "if_many"
    }
})
