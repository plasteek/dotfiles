local status, null_ls = pcall(require, "null-ls")
if (not status) then
    return
end

local augroup_format = vim.api.nvim_create_augroup("Format", {
    clear = true
})
-- local sources = {null_ls.builtins.diagnostics.eslint_d.with({
--     diagnostics_format = '[eslint] #{m}\n(#{c})'
-- }), null_ls.builtins.diagnostics.fish, null_ls.builtins.formatting.prettierd}

local sources = {null_ls.builtins.formatting.prettierd.with({
    stdin = true,
    env = {string.format('PRETTIERD_DEFAULT_CONFIG=%s',
        vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json'))}
})}
null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_clear_autocmds {
                buffer = 0,
                group = augroup_format
            }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup_format,
                buffer = 0,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            return client.name == "null-ls"
                        end,
                        bufnr = 0,
                        sync = false
                    })
                end
            })
        end
    end
})
