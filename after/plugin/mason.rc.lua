local status, mason = pcall(require, "mason")
if (not status) then
    return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then
    return
end

mason.setup({})

lspconfig.setup {
    ensure_installed = {"lua_ls", "tailwindcss", "prismals", "tsserver", "pyright", "hls"},
    -- ensure_installed = {"lua_ls", "tailwindcss", "prismals", "tsserver", "pyright", "hls", "prettier_d"},
    automatic_installation = true
}
