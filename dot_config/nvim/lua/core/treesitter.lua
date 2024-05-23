local configs = require("nvim-treesitter.configs")
configs.setup {
    ensure_installed = { 
        "go",
        "php",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "html",
        "twig",
        "css",
        "bash",
        "lua",
        "python",
        "rust" 
    },
    sync_install = false, 
    ignore_install = { "" },
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
}

vim.g.skip_ts_context_commentstring_module = true

require("Comment").setup({
    pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
        location = location,
    }
    end,
})
