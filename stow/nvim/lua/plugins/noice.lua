return {
  {
    "folke/noice.nvim",
    enabled = false,
    view = "cmdline",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
}
