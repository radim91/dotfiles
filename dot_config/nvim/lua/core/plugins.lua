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

    "nomnivore/ollama.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },

      -- All the user commands added by the plugin
      cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

      keys = {
        -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
        {
          "<leader>lp",
          ":<c-u>lua require('ollama').prompt()<cr>",
          desc = "ollama prompt",
          mode = { "n", "v" },
        },

        -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
        {
          "<leader>lG",
          ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
          desc = "ollama Generate Code",
          mode = { "n", "v" },
        },
      },

      ---@type Ollama.Config
      opts = {
        model = "deepseek-r1",
          url = "http://127.0.0.1:11434",
          serve = {
            on_start = false,
            command = "ollama",
            args = { "serve" },
            stop_command = "pkill",
            stop_args = { "-SIGTERM", "ollama" },
          },
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
