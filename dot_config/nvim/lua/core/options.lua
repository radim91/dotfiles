local options = {
    clipboard = "unnamedplus",
    fileencoding = "utf-8",
    cmdheight = 1,
    hlsearch = true,
    mouse = "a",
    smartcase = true,    
    smartindent = true,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    number = true,
    relativenumber = false,
    cursorline = true,
    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    updatetime = 300,
    undofile = true,
    timeoutlen = 1000,
    showmode = false,
    signcolumn = "yes",
    wrap = false,
    pumheight = 10,
    guifont = "Inconsolata Nerd Font Mono:h17",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[set clipboard=unnamedplus]]
