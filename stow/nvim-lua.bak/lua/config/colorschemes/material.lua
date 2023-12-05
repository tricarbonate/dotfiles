local material_theme = require('material')

vim.g.material_style = 'palenight'

material_theme.setup({
    contrast = true,
    borders = false,

    italics = {
        comments = true,
        keywords = true,
        strings = true,
        functions = true
    },

    custom_highlights = {
        lineNr = '#AA0000';
    }
})

