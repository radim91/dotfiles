vim.cmd.colorscheme "sonokai"

require("scrollbar").setup({})
require("dashboard").setup({})

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

require("auto-save").setup({
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = {"InsertLeave", "TextChanged"},
    conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
})
