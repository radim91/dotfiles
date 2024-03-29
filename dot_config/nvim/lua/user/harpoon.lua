local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>A", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-w>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { noremap = true, silent = true, desc = 'open harpoon menu' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-ú>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-/>", function() harpoon:list():next() end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-w>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
