local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- requirements --
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',

    -- treesitter --
    'nvim-treesitter/nvim-treesitter', build = { ":TSUpdate" },
    'nvim-treesitter/nvim-treesitter-textobjects',
    'HiPhish/rainbow-delimiters.nvim',

    -- auto completion --
    'windwp/nvim-autopairs', event = "InsertEnter", config = true,
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
    'kylechui/nvim-surround', version = "*", event = "VeryLazy",
    'Exafunction/codeium.vim',
    config = function()
        require("codeium").setup({})
    end,

    -- search --
    'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' },
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'numToStr/Comment.nvim',
    'stevearc/oil.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
    'nvim-pack/nvim-spectre',
    'stevearc/aerial.nvim',

    -- git & docker --
    'lewis6991/gitsigns.nvim',
    'kdheepak/lazygit.nvim',
    'crnvl96/lazydocker.nvim',

    -- misc --
    'moll/vim-bbye',
    'petertriho/nvim-scrollbar',
    'nvimdev/dashboard-nvim', event = 'VimEnter', dependencies = { {'nvim-tree/nvim-web-devicons'}},
    'sainnhe/sonokai', priority = 1000,
    'sontungexpt/sttusline', dependecies = { 'nvim-tree/nvim-web-devicons' },
    'folke/persistence.nvim', event = "BufReadPre",
    'folke/noice.nvim', event = "VeryLazy", dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
    'linux-cultist/venv-selector.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
        keys = {
            { '<leader>vs', '<cmd>VenvSelect<cr>' },
            { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        },
}

local opts = {}

require("lazy").setup(plugins, opts)
