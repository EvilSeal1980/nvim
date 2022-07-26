local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = { operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = EcoVim.ui.float.border or "rounded", -- none, single, double, shadow, rounded
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>"}, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}


local mappings = {

    -- ignore
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",

  -- single
  ["="] = { '<cmd>vertical resize +5<CR>',                 'resize +5' },
  ["-"] = { '<cmd>vertical resize -5<CR>',                 'resize +5' },
  ["e"] = { "Explorer" },
  ["o"] = { '<cmd>SymbolsOutline<CR>', 'Outline' },
  ["v"] = { '<C-W>v',                                    'split right' },
  ["V"] = { '<C-W>s',                                    'split below' },
  ["q"] = { 'quicklist' },
  ["j"] = { "<cmd>JABSOpen<cr>", "JABS" },
  ["r"] = { "<cmd>Run<cr>", "Run Code"},

  ["/"] = {
    name = "Dashboard",
    ["/"] = { '<cmd>Dashboard<CR>',                      'open dashboard' },
    ["m"] = { ':e $MYVIMRC<CR>',                         'open init' },
    ["s"] = { '<cmd>PackerSync<CR>',                     'packer sync' },
    ["u"] = { '<cmd>PackerUpdate<CR>',                   'packer update' },
    ["c"] = { "<cmd>PackerCompile<cr>", "Compile" },
  },

  a = {
    name = "Actions",
    m = { '<cmd>MarkdownPreviewToggle<CR>', 'markdown preview' },
    n = { '<cmd>set nonumber!<CR>',                      'line numbers' },
    r = { '<cmd>set norelativenumber!<CR>',              'relative number' },
    t = { '<cmd>ToggleTerm direction=float<CR>',         'terminal float' },
    s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
    l = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', "Tabline" },

  },

  b = {
    name = "Buffer",
    b = { '<cmd>BufferMovePrevious<CR>',                 'Move back' },
    c = { '<cmd>BufferCloseAllButCurrent<CR>',           'Close but current' },
    d = { '<cmd>BufferOrderByDirectory<CR>',             'Order by directory' },
    f = { '<cmd>bfirst<CR>',                             'First buffer' },
    l = { '<cmd>BufferCloseBuffersLeft<CR>',             'Close Left' },
    r = { '<cmd>BufferCloseBuffersRight<CR>',            'Close Right' },
    n = { '<cmd>BufferMoveNext<CR>',                     'Move next' },
    p = { '<cmd>BufferPick<CR>',                         'Pick Buffer' },
  },

  c = {
    name = "LSP",
    a = { 'code action' },
    d = { '<cmd>TroubleToggle<CR>',                      'local diagnostics' },
    D = { '<cmd>Telescope diagnostics<CR>',              'workspace diagnostics' },
    f = { '<cmd>lua vim.lsp.buf.formatting({ async=true })<CR>',           'format' },
    i = { '<cmd>TSLspImportAll<CR>',                     'import all'},
    l = { 'line diagnostics' },
    o = { '<cmd>TSLspOrganize<CR>',                      'organize imports'},
    q = { '<cmd>TSLspFixCurrent<CR>',                    'quick fix' },
    r = { 'rename' },
    s = { "<cmd>Telescope lsp_document_symbols<cr>" , "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    t = { '<cmd>LspToggleAutoFormat<CR>',                'toggle format on save' },
  },

  d = {
    name = "Debug",
    a = { 'attach' },
    b = { 'breakpoint' },
    c = { 'continue' },
    d = { 'continue' },
    h = { 'visual hover' },
    i = { 'step into' },
    o = { 'step over' },
    O = { 'step out' },
    s = { 'scopes' },
  },

   f = {
    name = "Peek",
    q = { vim.diagnostic.setloclist,                                     "Quickfix" },
    r = { vim.lsp.buf.rename,                                              "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>",             "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",   "Workspace Symbols" },
    e = { "<cmd>Telescope quickfix<cr>",                       "Telescope Quickfix" },
  },

  g = {
    name = "Git",
    a = { '<cmd>!git add %:p<CR>',                                   'add current' },
    A = { '<cmd>!git add .<CR>',                                     'add all' },
    b = { '<cmd>lua require("blame").open()<CR>',                    'blame' },
    B = { '<cmd>Telescope git_branches<CR>',                         'branches' },
    d = { '<cmd>lua require("plugins.diffview").toggle()<CR>',       'diff file' },
    g = { 'lazygit' },
    o = { "<cmd>Telescope git_status<cr>",                      "Open changed file" },
    c = { "<cmd>Telescope git_commits<cr>",                       "Checkout commit" },
    C = { "<cmd>Telescope git_bcommits<cr>",    "Checkout commit(for current file)" },
    f = { "<cmd>Gitsigns diffthis HEAD<cr>",                             "Git Diff" },
    h = {
      name = "Hunk",
      d = "diff hunk",
      p = "preview",
      R = "reset buffer",
      r = "reset hunk",
      s = "stage hunk",
      S = "stage buffer",
      t = "toggle deleted",
      u = "undo stage",
    },
    l = {
      name = "Log",
      a = "commits",
      c = "buffer commits",
    },
    m = { 'blame line' },
    s = { '<cmd>Telescope git_status<CR>',                           'status' },
  },

  p = {
    name = "Project",
    f = { 'file' },
    w = { 'word' },
    l = { "<cmd>lua require'telescope'.extensions.repo.list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%timeshift/', '/usr/', '/srv/', '/%.oh%-my%-zsh'}}<CR>", 'list' },
    r = { 'refactor' },
    s = { "<cmd>SessionSave<CR>",                                    'save session' },
    t = { "<cmd>TodoTrouble<CR>",                                    'todo' },
  },

  s = {
    name = "Search",
    p = { "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
          "Colorscheme with Preview" },
    d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', 'dotfiles' },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { '<cmd>Telescope oldfiles<CR>', 'file history' },
    H = { '<cmd>Telescope command_history<CR>', 'command history' },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    s = { '<cmd>Telescope search_history<CR>', 'search history' },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
  },


  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  w = {
    name = "Surround",
    ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
    a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
    d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
    r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
    q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
    b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
  },


  x = {
    name = "Table Mode",
    m = { 'toggle' },
    t = { 'tableie' },
  },
}

local wk = require "which-key"
wk.register(mappings, opts)

local function attach_markdown(bufnr)
  wk.register({
    a = {
      name = "Actions",
      m = { '<cmd>MarkdownPreviewToggle<CR>', 'markdown preview' },
    }
  }, {
    buffer = bufnr ,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_typescript(bufnr)
  wk.register({
    c = {
      name = "LSP",
      F = { '<cmd>TypescriptFixAll<CR>',                   'fix all' },
      i = { '<cmd>TypescriptAddMissingImports<CR>',        'import all'},
      o = { '<cmd>TypescriptOrganizeImports<CR>',          'organize imports'},
      u = { '<cmd>TypescriptRemoveUnused<CR>',             'remove unused' },
    }
  }, {
    buffer = bufnr ,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_npm(bufnr)
  wk.register({
    n = {
      name = "NPM",
      c = { '<cmd>lua require("package-info").change_version()<CR>', 'change version' },
      d = { '<cmd>lua require("package-info").delete()<CR>',         'delete package' },
      h = { "<cmd>lua require('package-info').hide()<CR>",           'hide'},
      i = { '<cmd>lua require("package-info").install()<CR>',        'install new package' },
      r = { '<cmd>lua require("package-info").reinstall()<CR>',      'reinstall dependencies' },
      s = { '<cmd>lua require("package-info").show()<CR>',           'show' },
      u = { '<cmd>lua require("package-info").update()<CR>',         'update package'},
    }
  }, {
    buffer = bufnr ,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

return {
  attach_markdown = attach_markdown,
  attach_typescript = attach_typescript,
  attach_npm = attach_npm
}
