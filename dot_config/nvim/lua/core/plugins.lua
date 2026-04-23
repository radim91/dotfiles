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
    'HiPhish/rainbow-delimiters.nvim',
    'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' },
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'numToStr/Comment.nvim',
    'stevearc/oil.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
    'nvim-pack/nvim-spectre',
    'stevearc/aerial.nvim',
    'lewis6991/gitsigns.nvim',
    'sainnhe/sonokai', priority = 1000,
    'sontungexpt/sttusline', dependecies = { 'nvim-tree/nvim-web-devicons' },
    'folke/persistence.nvim', event = "BufReadPre"
}

local opts = {}

require("lazy").setup(plugins, opts)
