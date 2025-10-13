-- =====================================================
-- Neovim Init.lua
-- Author: wheatfox
-- =====================================================

-- ===== Basic UI =====
vim.cmd [[colorscheme tokyonight]]
vim.cmd [[set number]]
vim.g.rustfmt_autosave = 1

-- ===== Plugin Configs =====
require("plugins")
require("opts")

-- ===== Completion (nvim-cmp) =====
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
  },
  sources = {
    { name = "path" },
    { name = "buffer", keyword_length = 2 },
    { name = "vsnip", keyword_length = 2 },
    { name = "calc" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "menu", "abbr", "kind" },
    format = function(entry, item)
      local menu_icon = {
        vsnip    = "[SNIP]",
        buffer   = "[BUF]",
        path     = "[PATH]",
      }
      item.menu = menu_icon[entry.source.name] or ""
      return item
    end,
  },
})

-- ===== Diagnostics =====
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- ===== Mason (Installer UI only, no LSP) =====
require("mason").setup({
  ui = {
    icons = {
      package_installed = "[I]",
      package_pending = "[P]",
      package_uninstalled = "[U]",
    },
  },
})

