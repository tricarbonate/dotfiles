vim.api.nvim_command([[
    autocmd! BufWritePost .nvimrc source $MYVIMRC | echom "Reloaded $NVIMRC"
    autocmd! BufWritePost *.lua source $MYVIMRC | echom "Reloaded $NVIMRC"
]])

