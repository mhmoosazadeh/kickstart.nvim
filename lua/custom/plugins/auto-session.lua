return {
  'rmagatti/auto-session',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
  },
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
    { '<leader>we', '<cmd>SessionSave<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },
  config = function()
    require('auto-session').setup {
      auto_session_suppress_dirs = { '~/', '~/projects', '~/Downloads', '/' },
      -- ⚠️ This will only work if Telescope.nvim is installed
      -- The following are already the default values, no need to provide them if these are already the settings you want.
      session_lens = {
        -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
      cwd_change_handling = {
        restore_upcoming_session = true, -- Disabled by default, set to true to enable
        -- pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
        post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
          require('lualine').refresh() -- refresh lualine so the new session name is displayed in the status bar
        end,
      },
    }
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
  end,
}
