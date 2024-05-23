vim.cmd.colorscheme "sonokai"

require("scrollbar").setup()
require("dashboard").setup()
require("notify").setup()

local FilePath = require("sttusline.component").new()

FilePath.set_timing(true)
FilePath.set_update(function ()
    return "%F"
end)

require("sttusline").setup({
    statusline_color = "StatusLine",
    laststatus = 3,
    disabled = {
        filetypes = {
            "NvimTree",
        },
        buftypes = {
            "terminal",
        },
    },
    components = {
        "mode",
        "git-branch",
        "git-diff",
        "%=",
        FilePath,
        "diagnostics",
        "indent",
        "pos-cursor",
    },
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.api.nvim_command('silent update')
    end
  end,
})
