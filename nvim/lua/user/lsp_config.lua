-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "pyright", "tsserver", "vuels", "emmet_ls", "sumneko_lua" }
local configs = {
  vuels = {
    settings = {
      vetur = { ignoreProjectWarning = true },
    },
  },
  emmet_ls = {
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "htmldjango" },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "use" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  },
  tsserver = {
    on_attach = function(client)
      if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
      end
    end
  }
}

for _, server in ipairs(servers) do
  local base_settings = { capabilities = capabilities }
  if configs[server] then
    for k, v in pairs(configs[server]) do
      base_settings[k] = v
    end
  end
  lspconfig[server].setup(base_settings)
end

-- local luasnip = require("luasnip")

-- nvim-cmp setup
-- local check_backspace = function()
--   local col = vim.fn.col "." - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end
-- local cmp = require("cmp")
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body)
-- 		end,
-- 	},
-- 	window = {
-- 		completion = cmp.config.window.bordered(),
-- 		documentation = cmp.config.window.bordered(),
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<CR>"] = cmp.mapping.confirm({
-- 			behavior = cmp.ConfirmBehavior.Replace,
-- 			select = true,
-- 		}),
-- 	}),
-- 	sources = {
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--     { name = "buffer" },
--     { name = "path" },
-- 		-- { name = "emmet_ls" },
-- 	},
-- })
local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = "rounded"
  return opts
end
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "vetur-vls",
    "stylua",
    "lua-language-server",
    "pyright",
  },
  automatic_installation = true
})

require'mason-tool-installer'.setup({

  ensure_installed = {
    'lua-language-server',
    'stylua',
    'shellcheck',
    'editorconfig-checker',
  },
  run_on_start = true,
  auto_update = true,

})
-- require("nvim-lsp-installer").setup({
-- 	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
-- 	ui = {
-- 		icons = {
-- 			server_installed = "✓",
-- 			server_pending = "➜",
-- 			server_uninstalled = "✗",
-- 		},
-- 	},
-- })
