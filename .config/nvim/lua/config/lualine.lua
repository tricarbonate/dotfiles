require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'onedarkpro',
        always_divide_middle = true
    },

    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_lsp'}}},
        lualine_c = {'filename'},
    }
})
