local status, null_ls = pcall(require, "null-ls")
if (not status) then
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local sources = {null_ls.builtins.formatting.prettierd, null_ls.builtins.diagnostics.eslint_d.with({
    diagnostics_format = '[eslint] #{m}\n(#{c})'
}), null_ls.builtins.diagnostics.fish}
-- local sources = {null_ls.builtins.formatting.prettier, null_ls.builtins.diagnostics.eslint_d.with({
--     diagnostics_format = '[eslint] #{m}\n(#{c})'
-- }), null_ls.builtins.diagnostics.fish}
-- local sources = {null_ls.builtins.formatting.prettierd, null_ls.builtins.diagnostics.eslint_d.with({
--     diagnostics_format = '[eslint] #{m}\n(#{c})'
-- }), null_ls.builtins.diagnostics.fish, null_ls.builtins.formatting.prismaFmt.with({
--     filetypes = {"prisma"}
-- })}

local lsp_formatting = function()
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        async = false
    })
end

null_ls.setup {
    debug = false,
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- vim.lsp.buf.format({
                    --     async = false
                    -- })
                    lsp_formatting()
                end
            })
        end
    end
}

vim.api.nvim_create_user_command('DisableLspFormatting', function()
    vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = 0
    })
end, {
    nargs = 0
})
