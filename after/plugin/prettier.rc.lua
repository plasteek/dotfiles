local status, prettier = pcall(require, "prettier")
if (not status) then
    return
end
-- cli-options won't work if null-ls is not updated
prettier.setup({
    bin = 'prettierd',
    filetypes = {"css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "scss", "less",
                 "markdown"},
    cli_options = {
        arrow_parens = 'avoid',
        bracketSpacing = true,
        tabWidth = 3,
        singleQuote = true
    }
})
