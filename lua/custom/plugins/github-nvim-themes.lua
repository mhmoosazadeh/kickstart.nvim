return {
  'projekt0n/github-nvim-theme',
  lazy = true, -- make sure we load this during startup if it is your main colorscheme
  priority = 0, -- make sure to load this before all the other start plugins
  -- config = function()
  --   require('github-theme').setup {}
  -- end,
}
