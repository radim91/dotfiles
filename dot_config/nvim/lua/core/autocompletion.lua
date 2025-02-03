require("nvim-autopairs").setup({
    check_ts = true,
        ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

require("nvim-surround").setup()
require("codecompanion").setup({
    adapters = {
        deepseekr1 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "deepseekr1",
            schema = {
              model = {
                default = "deepseek-r1:latest",
              },
            },
          })
        end,
    },
    strategies = { -- Change the adapters as required
        chat = { adapter = "deepseekr1" },
        inline = { adapter = "deepseekr1" },
        agent = { adapter = "deepseekr1" },
    },
    log_level = "TRACE",
})
