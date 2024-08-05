return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      -- Add your custom configuration here
      mappings = {
        basic = true, -- Enable basic mappings: `gcc`, `gbc`, `gc[count]{motion}`, `gb[count]{motion}`
        extra = false, -- Disable extra mappings: `gco`, `gcO`, `gcA`
      },
    }
  end,
}
