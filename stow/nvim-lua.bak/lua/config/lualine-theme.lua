local M = {}
    M.theme = function()
        local colors = {
            darkgray = "#16161d",
            gray = "#727169",
            innerbg = nil,
            outerbg = "#16161D",
            normal = "#7e9cd8",
            insert = "#a8cb7c",
            visual = "#ffa066",
            replace = "#e46876",
            command = "#e6c384",
        }
        return {
            inactive = {
                a = { fg = colors.darkgray, bg = colors.outerbg, gui = "bold" },
                b = { fg = colors.gray, bg = colors.outerbg },
                c = { fg = colors.gray, bg = colors.innerbg },
            },
            visual = {
                a = { fg = colors.darkgray , bg = colors.visual, gui = "bold" },
                b = { fg = colors.visual , bg = colors.outerbg },
                c = { fg = colors.visual , bg = colors.innerbg },
            },
            replace = {
                a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
                b = { fg = colors.replace, bg = colors.outerbg },
                c = { fg = colors.replace, bg = colors.innerbg },
            },
            normal = {
                a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
                b = { fg = colors.normal, bg = colors.outerbg },
                c = { fg = colors.normal, bg = colors.innerbg },
            },
            insert = {
                a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
                b = { fg = colors.insert, bg = colors.outerbg },
                c = { fg = colors.insert, bg = colors.innerbg },
            },
            command = {
                a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
                b = { fg = colors.command, bg = colors.outerbg },
                c = { fg = colors.command, bg = colors.innerbg },
            },
        }
    end
    return M
