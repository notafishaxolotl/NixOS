return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    name = "gruvbox",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
      vim.cmd.colorscheme "gruvbox"
      
      vim.cmd([[
        highlight NormalFloat guibg=NONE
        highlight FloatBorder guibg=NONE
      ]])
    end
  }
}
