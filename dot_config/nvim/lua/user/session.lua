local status_ok, projections = pcall(require, "projections")
if not status_ok then
  return
end

projections.setup {
    workspaces = {
        "~/dev",
    },
    store_hooks = {
        pre = function()
            local nvim_tree_present, api = pcall(require, "nvim-tree.api")
            if nvim_tree_present then api.tree.close() end
        end
    }
}

-- Bind <leader>fp to Telescope projections
require('telescope').load_extension('projections')
vim.keymap.set("n", "<leader>fp", function() vim.cmd("Telescope projections") end)


-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
    end,
})

vim.opt.sessionoptions:append("localoptions")

local Workspace = require("projections.workspace")
vim.api.nvim_create_user_command("AddWorkspace", function() 
    Workspace.add(vim.loop.cwd()) 
end, {})

local Session = require("projections.session")
vim.api.nvim_create_user_command("StoreProjectSession", function()
    Session.store(vim.loop.cwd())
end, {})

vim.api.nvim_create_user_command("RestoreProjectSession", function()
    Session.restore(vim.loop.cwd())
end, {})

vim.keymap.set("n", "<leader>ss", ":StoreProjectSession")
vim.keymap.set("n", "<leader>rs", ":RestoreProjectSession")
