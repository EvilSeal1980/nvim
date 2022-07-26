local present, catppuccin = pcall(require, "catppuccin")
if not present then
  return
end
local colors = require("catppuccin.palettes").get_palette()

-- configure it
catppuccin.setup {
  compile = { enabled = true },
  transparent_background = false,
  term_colors = false,
  custom_highlights = {
    TSBoolean = { fg = "#ec7c85" },
    NvimTreeVertSplit = { fg = "#181825", bg = "#181825" },
  },
  styles = {
    comments = { "italic" },
    functions = { "italic" },
    keywords = { "italic" },
    strings = {},
    variables = { "italic" },
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    lsp_trouble = false,
    cmp = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = false,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = true,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = false,
    neogit = true,
    vim_sneak = false,
    fern = false,
    barbar = true,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    hop = true,
    notify = false,
    symbols_outline = true,

  },
}

vim.g.catppuccin_flavour = "Mocha"
vim.cmd([[colorscheme catppuccin]])


-- Ecovim Colors
vim.highlight.create('EcovimPrimary', { guifg = "#488DFF" }, false);
vim.highlight.create('EcovimSecondary', { guifg = "#FFA630" }, false);
vim.highlight.create('EcovimTertiary', { guifg = "#FFFEE3" }, false);


vim.highlight.create('EcovimPrimaryBold', { gui = "bold", guifg = "#488DFF" }, false);
vim.highlight.create('EcovimSecondaryBold', { gui = "bold", guifg = "#FFA630" }, false);

vim.highlight.create('EcovimHeader', { gui = "bold", guifg = "#488DFF" }, false);
vim.highlight.create('EcovimHeaderInfo', { gui = "bold", guifg = "#FFA630" }, false);
vim.highlight.create('EcovimFooter', { gui = "bold", guifg = "#FFA630" }, false);

-- Lines
vim.highlight.link('LineNr', 'Comment', true)

-- Floats/Windows
vim.highlight.create('NormalFloat', { guibg = "None", guifg = "None" }, false);
vim.highlight.create('FloatBorder', { guibg = "None" }, false);
vim.highlight.create('WhichKeyFloat', { guibg = "None" }, false);

-- Telescope
vim.highlight.link('TelescopeTitle', 'EcovimSecondary', true);
vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
vim.highlight.link('TelescopeMatching', 'Constant', true);

-- Diagnostics

-- Misc
vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
