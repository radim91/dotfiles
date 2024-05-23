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

    -- treesitter --
    'nvim-treesitter/nvim-treesitter', build = { ":TSUpdate" },
    'HiPhish/rainbow-delimiters.nvim',

    -- auto completion --
    'windwp/nvim-autopairs',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    'Exafunction/codeium.vim',

    -- search --
    'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' },
    'nvim-telescope/telescope-fzf-native.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'numToStr/Comment.nvim',
    'stevearc/oil.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
    'nvim-pack/nvim-spectre',

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
}

local opts = {}

require("lazy").setup(plugins, opts)