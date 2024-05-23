vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Codeium --
keymap('i', '<Tab>', ':codeium#Accept<CR>', opts)
keymap('i', '<S-Tab>', ':codeium#CycleCompletions', opts)
keymap('i', '<C-S-Tab>', ':codeium#CycleCompletions', opts)
keymap('i', '<C-x>', ':codeium#Clear', opts)

-- Search --
keymap("n", "<leader>fo", ":Oil --float %:p:h<cr>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fr", ":Telescope resume<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', opts)
keymap('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', opts)

-- Buffers --
keymap("n", "<M-q>", ":Bdelete<cr>", opts)
keymap("n", "<M-S-q>", ":Bdelete!<cr>", opts)
keymap("n", "<M-Right>", ":bnext<CR>", opts)
keymap("n", "<M-Left>", ":bprevious<CR>", opts)

-- Git & Docker --
keymap("n", "<leader>lg", ":LazyGit<cr>", opts)
keymap("n", "<leader>ld", ":LazyDocker<cr>", opts)
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", opts)
keymap("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<cr>", opts)

-- Misc --
keymap('n', '<leader>hh', ':nohlsearch<CR>', opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<C-S-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<C-S-Up>", ":move '<-2<CR>gv-gv", opts)
keymap("n", "<C-S-Left>", "<C-w>h", opts)
keymap("n", "<C-S-Down>", "<C-w>j", opts)
keymap("n", "<C-S-Up>", "<C-w>k", opts)
keymap("n", "<C-S-Right>", "<C-w>l", opts)
keymap("v", "p", '"_dP', opts)
keymap("n", "<C-s>", ":vsplit<cr>", opts)
keymap('n', '<C-f>', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })
keymap('n', '<leader>sl', [[<cmd>lua require("persistence").load()<cr>]], opts)
