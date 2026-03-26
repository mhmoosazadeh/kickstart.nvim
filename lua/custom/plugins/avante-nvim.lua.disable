vim.opt.laststatus = 3

local op_cache = {}

local function env_or_op(var_name, op_path)
  local value = op_cache[var_name] or vim.env[var_name]
  if value and value ~= '' then
    return value
  end

  value = vim.fn.system('op read ' .. op_path):gsub('%s+$', '')
  op_cache[var_name] = value
  vim.env[var_name] = value
  return value
end

return {
  'yetone/avante.nvim',
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = 'avante.md',
    -- for example
    provider = 'gemini-cli',
    acp_providers = {
      ['gemini-cli'] = {
        command = 'gemini',
        args = { '--experimental-acp' },
        env = {
          NODE_NO_WARNINGS = '1',
          GEMINI_API_KEY = env_or_op('GEMINI_API_KEY', 'op://Private/API_KEYS/GEMINI_API_KEY'),
        },
      },
    },
    providers = {
      ollama_deepseek_coder_v2 = {
        __inherited_from = 'ollama',
        model = 'deepseek-coder-v2:16b',
      },
      ollama_codellama = {
        __inherited_from = 'ollama',
        model = 'codellama:7b',
      },
      ollama_codegemma = {
        __inherited_from = 'ollama',
        model = 'codegemma:7b',
      },
      ollama_q_coder = {
        __inherited_from = 'ollama',
        model = 'qwen2.5-coder:7b',
      },
      gemini = {
        api_key = env_or_op('GEMINI_API_KEY', 'op://Private/API_KEYS/GEMINI_API_KEY'),
        timeout = 30000, -- Timeout in milliseconds
      },
    },
    web_search_engine = {
      provider = 'google',
      providers = {
        google = {
          api_key_name = env_or_op('GEMINI_API_KEY', 'op://Private/API_KEYS/GOOGLE_SEARCH_API_KEY'),
          engine_id_name = 'c4bbf66208cfb4fb6',
        },
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-mini/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'stevearc/dressing.nvim', -- for input provider dressing
    'folke/snacks.nvim', -- for input provider snacks
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
