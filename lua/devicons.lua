vim.g.material_style = "palenight"
vim.g.material_italic_comments = 1
vim.g.material_italic_keywords = 1
vim.g.material_italic_functions = 1
vim.g.material_lsp_underline = 1

vim.g.sonokai_style = "atlantis"
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_diagnostic_virtual_text = "colored"

vim.g.edge_style = "neon"
vim.g.edge_enable_italic = 1
vim.g.edge_disable_italic_comment = 0
vim.g.edge_transparent_background = 0

vim.g.embark_terminal_italics = 1

vim.g.nightflyTransparent = 1

vim.g.nvcode_termcolors = 256

vim.o.background = "dark"

vim.g.tokyonight_dev = true
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_sidebars = {
  "qf",
  "vista_kind",
  "terminal",
  "packer",
  "spectre_panel",
  "NeogitStatus",
  "help",
}
vim.g.tokyonight_cterm_colors = false
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = {}
-- vim.g.tokyonight_colors = { border = "orange" }

require("tokyonight").colorscheme()
-- vim.cmd("colorscheme tokyonight") -- Put your favorite colorscheme herecal present, devicons = pcall(require, "nvim-web-devicons")

if not present then
   return
end

local options = {
   override = {
      c = {
         icon = "",
         name = "c",
      },
      css = {
         icon = "",
         name = "css",
      },
      deb = {
         icon = "",
         name = "deb",
      },
      Dockerfile = {
         icon = "",
         name = "Dockerfile",
      },
      html = {
         icon = "",
         name = "html",
      },
      jpeg = {
         icon = "",
         name = "jpeg",
      },
      jpg = {
         icon = "",
         name = "jpg",
      },
      js = {
         icon = "",
         name = "js",
      },
      kt = {
         icon = "󱈙",
         name = "kt",
      },
      lock = {
         icon = "",
         name = "lock",
      },
      lua = {
         icon = "",
         name = "lua",
      },
      mp3 = {
         icon = "",
         name = "mp3",
      },
      mp4 = {
         icon = "",
         name = "mp4",
      },
      out = {
         icon = "",
         name = "out",
      },
      png = {
         icon = "",
         name = "png",
      },
      py = {
         icon = "",
         name = "py",
      },
      ["robots.txt"] = {
         icon = "ﮧ",
         name = "robots",
      },
      toml = {
         icon = "",
         name = "toml",
      },
      ts = {
         icon = "ﯤ",
         name = "ts",
      },
      ttf = {
         icon = "",
         name = "TrueTypeFont",
      },
      rb = {
         icon = "",
         name = "rb",
      },
      rpm = {
         icon = "",
         name = "rpm",
      },
      vue = {
         icon = "﵂",
         name = "vue",
      },
      woff = {
         icon = "",
         name = "WebOpenFontFormat",
      },
      woff2 = {
         icon = "",
         name = "WebOpenFontFormat2",
      },
      xz = {
         icon = "",
         name = "xz",
      },
      zip = {
         icon = "",
         name = "zip",
      },
   },
}

devicons.setup(options)
