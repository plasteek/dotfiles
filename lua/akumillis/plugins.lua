local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {"ellisonleao/gruvbox.nvim"}
    use {
        'svrana/neosolarized.nvim',
        requires = {'tjdevries/colorbuddy.nvim'}
    }
    use 'junegunn/fzf'
    use 'Mofiqul/vscode.nvim'
    use 'martinsione/darkplus.nvim'
    use 'tanvirtin/monokai.nvim'
    use 'junegunn/fzf.vim'
    use 'AndrewRadev/tagalong.vim'
    use "terrortylor/nvim-comment"
    use 'tpope/vim-surround'
    use 'nvim-lualine/lualine.nvim' -- Statusline
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'neovim/nvim-lspconfig' -- LSP
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'folke/tokyonight.nvim'

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require('lspsaga').setup({})
        end
    })
    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/zen-mode.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end
    })
    use 'akinsho/nvim-bufferline.lua'
    use 'jose-elias-alvarez/typescript.nvim'
    -- use 'github/copilot.vim'

    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim' -- For git blame & browse
    use {
        "themaxmarchuk/tailwindcss-colors.nvim",
        -- load only on require("tailwindcss-colors")
        module = "tailwindcss-colors",
        -- run the setup function after plugin is loaded 
        config = function()
            -- pass config options here (or nothing to use defaults)
            require("tailwindcss-colors").setup()
        end
    }

    use 'pantharshit00/vim-prisma'
end)
