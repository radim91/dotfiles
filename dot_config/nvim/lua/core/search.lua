require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
    },
    view_options = {
        show_hidden = true,
    }
})

require("telescope").setup({
    defaults = {
        path_display = { "filename_first" },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})

require("aerial").setup({})
