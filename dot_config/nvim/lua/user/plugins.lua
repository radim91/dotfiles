local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }

    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

vim.g.codeium_disable_bindings = 1

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "sainnhe/sonokai"
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "Pocco81/auto-save.nvim"
    use "lewis6991/gitsigns.nvim"
    use {"gnikdroy/projections.nvim", branch = "pre_release"}

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- snippets & LSP
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use "williamboman/mason.nvim"
    use "othree/html5.vim"
    use "neovim/nvim-lspconfig"

    -- Telescope && treesitter
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "HiPhish/rainbow-delimiters.nvim"
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use "nvim-telescope/telescope-fzf-native.nvim"

    -- LazyGit && LazyDocker
    use "kdheepak/lazygit.nvim"
    use {
        "crnvl96/lazydocker.nvim",
        config = function()
            require("lazydocker").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
        }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    
    use {
        "Exafunction/codeium.vim",
        config = function ()
            vim.keymap.set('i', '<C-q>', function () return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<C-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end
    }

    use "petertriho/nvim-scrollbar"
    use {
       "sontungexpt/sttusline",
        requires = {
           "nvim-tree/nvim-web-devicons" 
        }
    }
    
    -- colors --
    use {
        "max397574/colortils.nvim",
        cmd = "Colortils",
        config = function()
            require("colortils").setup()
        end,
    }
    use {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }

    -- Harpoon --
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

