require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = require('config/lualine-theme').theme(),
        -- theme = "catppuccin",
        always_divide_middle = true
    },

    sections = {
        -- mode section
        lualine_a = {'mode'},
        -- git section
        lualine_b = {
            'branch',
            {
                'diff',
                colored = true,
                diff_color = {
                    added    = { fg = '#28A745' },
                    modified = { fg = '#DBAB09' },
                    removed  = { fg = '#D73A49' }
                },
                symbols = {
                    added = '+',
                    modified = '~',
                    removed = '-'
                },
            }
        },
        -- current file section
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },

    -- lua line appearance for inactive panes
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },

    tabline = {},
    extensions = {}
})
