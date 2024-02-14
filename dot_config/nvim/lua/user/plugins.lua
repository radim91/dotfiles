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
    use "moll/vim-bbye"
    use {"gnikdroy/projections.nvim", branch = "pre_release"}
    use "ThePrimeagen/refactoring.nvim"
    use {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {}
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }
    use "nvim-pack/nvim-spectre";
    use "tpope/vim-fugitive"
    use "vimpostor/vim-tpipeline"

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
    use({
        "stevearc/oil.nvim",
        config = function()
          require("oil").setup({
                preview = {
                    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- min_width and max_width can be a single value or a list of mixed integer/float types.
                    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
                    max_width = 0.9,
                    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
                    min_width = { 40, 0.4 },
                    -- optionally define an integer/float for the exact width of the preview window
                    width = nil,
                    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- min_height and max_height can be a single value or a list of mixed integer/float types.
                    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
                    max_height = 0.9,
                    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
                    min_height = { 5, 0.1 },
                    -- optionally define an integer/float for the exact height of the preview window
                    height = nil,
                    border = "rounded",
                    win_options = {
                      winblend = 0,
                    },
                    -- Whether the preview window is automatically updated when the cursor is moved
                    update_on_cursor_moved = true,
              }
            })
        end,
    })
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

