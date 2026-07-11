vim.pack.add {
  'https://github.com/rmagatti/auto-session',
  'https://github.com/nvim-telescope/telescope.nvim',
}

vim.keymap.set('n', '<leader>wr', '<Cmd>AutoSession search<CR>', { desc = 'Session search' })
vim.keymap.set('n', '<leader>we', '<Cmd>AutoSession save<CR>', { desc = 'Save session' })
vim.keymap.set('n', '<leader>wa', '<Cmd>AutoSession toggle<CR>', { desc = 'Toggle autosave' })

require('auto-session').setup {
  suppressed_dirs = { '~/', '~/projects', '~/Downloads', '/' },
  session_lens = {
    load_on_setup = true,
    picker_opts = { border = true, previewer = false },
  },
  cwd_change_handling = true,
  post_cwd_changed_cmds = {
    function()
      local ok, lualine = pcall(require, 'lualine')
      if ok then lualine.refresh() end
    end,
  },
}

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
