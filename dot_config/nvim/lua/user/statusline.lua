local status_ok, sttusline = pcall(require, "sttusline")
if not status_ok then
  return
end

local FilePath = require("sttusline.component").new()

FilePath.set_timing(true)
FilePath.set_update(function ()
    return "%F"
end)

sttusline.setup({
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
