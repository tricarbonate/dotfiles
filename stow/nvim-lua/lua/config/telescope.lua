
require('telescope').setup {

    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },

        -- previewer = false,
        preview = {
            treesitter = false
        },

        file_ignore_patterns = {
            "node_modules",
            ".git",
            ".cache",
            ".var",
            ".local",
            ".vscode",
            ".mozilla",
            ".minecraft",
            ".stremio-server",
            ".rustup",
            ".npm",
            ".jabba",
            ".icons",
            "*.pdf",
            "*.png",
            "*.jpeg",
        },

        -- previewer = false,
        -- disable_devicons = true
    },


    pickers = setmetatable({}, {
        __index = function(_, key)
            if builtins[key] == nil then
                error "Invalid key, please check :h telescope.builtin"
                return
            end
            return function(opts)
                opts = vim.tbl_extend("keep", opts or {}, defaults)
                builtins[key](opts)
            end
        end,
    })

    -- extensions = {
    --     -- Your extension configuration goes here:
    --     -- extension_name = {
    --     --   extension_config_key = value,
    --     -- }
    --     -- please take a look at the readme of the extension you want to configure
    -- }
}
