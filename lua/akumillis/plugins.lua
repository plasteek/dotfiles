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
    -- use({
    --     'neovim/nvim-lspconfig',
    --     commit = '51775b12cfbf1b6462c7b13cd020cc09e6767aea'
    -- }) -- LSP
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    -- use({
    --     'jose-elias-alvarez/null-ls.nvim', -- DK why still don't work even though the lspconfig is the latest, this is due to the lspconfig not accepting function
    --     commit = '76d0573fc159839a9c4e62a0ac4f1046845cdd50'
    -- }) -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'folke/tokyonight.nvim'

    use 'glepnir/lspsaga.nvim' -- LSP
    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })
        end
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'kyazdani42/nvim-web-devicons' -- File icons
    -- use 'nvim-telescope/telescope.nvim'
    use({'nvim-telescope/telescope.nvim' -- commit = '2c573b9d12f421cec74a215f79b25591fe083352'
    })
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/zen-mode.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        setup = function()
            vim.cmd([[
                let $NVIM_MKDP_LOG_FILE = expand('~/mkdp-log.log')
                let $NVIM_MKDP_LOG_LEVEL = 'debug'
            ]])
            vim.g.mkdp_browser = "msedge"
            vim.g.mkdp_filetypes = {"markdown"}

        end,
        ft = {"markdown"}
    })
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     setup = function()
    --         -- Set browser
    --         vim.g.mkdp_browser = "msedge"

    --     end,
    --     run = function()
    --         vim.fn["mkdp#util#install"]()
    --     end
    -- })
    use {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup()
        end
    }
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

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("bufferline").setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get()
            }
        end
    }
    use 'pantharshit00/vim-prisma'
    use "rebelot/kanagawa.nvim"
    use "EdenEast/nightfox.nvim" -- Packer

    use({
        'rose-pine/neovim',
        as = 'rose-pine'
    })
    use {'nyoom-engineering/oxocarbon.nvim'}
end)
