vim.treesitter.language.register("bash", "sh")  -- common alias needed by some filetypes

-- Enable highlight and indent for all installed parsers
require("nvim-treesitter").setup({
  highlight = { enable = true },
  indent    = { enable = true },
})