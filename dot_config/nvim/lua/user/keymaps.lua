local opts = { noremap = true, silent = true } local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-S-Left>", "<C-w>h", opts)
keymap("n", "<C-S-Down>", "<C-w>j", opts)
keymap("n", "<C-S-Up>", "<C-w>k", opts)
keymap("n", "<C-S-Right>", "<C-w>l", opts)

-- Resize
keymap("n", "<C-k>", ":resize +2<CR>", opts)
keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<M-Right>", ":bnext<CR>", opts)
keymap("n", "<M-Left>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)

-- Move text up and down
--[[ keymap("v", "<C-S-Down>", ":m .+1<CR>==", opts) ]]
--[[ keymap("v", "<C-S-Up>", ":m .-2<CR>==", opts) ]]
keymap("v", "p", '"_dP', opts)
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<C-S-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<C-S-Up>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- Telescope --
-- Find files using Telescope command-line sugar.
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
--[[ keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts) ]]

-- LazyGit && LazyDocker --
keymap("n", "<leader>lg", ":LazyGit<cr>", opts)
keymap("n", "<leader>ld", ":LazyDocker<cr>", opts)

-- NvimTree --
keymap("n", "<M-+>", ":NvimTreeToggle<cr>", opts)

-- Buffers --
keymap("n", "<M-q>", ":Bdelete<cr>", opts)
keymap("n", "<M-S-q>", ":Bdelete!<cr>", opts)

-- Word Wrap --
keymap("n", "<leader>ww", ":set wrap!<cr>", opts)
keymap("n", "<leader>hh", ":noh<cr>", opts)

keymap("n", "<leader>bb", ":Colortils<cr>", opts)
vim.keymap.set("n", "<leader>fo", function()
    vim.cmd("vsplit | wincmd 1")
    require("oil").open()
end)
