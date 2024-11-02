-- Lualine
require("lualine").setup({
    icons_enabled = true,
    theme = 'onedark',
})

-- Colorscheme
vim.cmd("colorscheme dracula")

-- Comment
require("Comment").setup()
