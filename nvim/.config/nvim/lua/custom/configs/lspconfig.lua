local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

vim.tbl_deep_extend('keep', lspconfig, {
	markdown_oxide = {
		cmd = { "markdown-oxide" },
		filetypes = "markdown",
		name = 'markdown_oxide',
	}
})

capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

local servers = {
  "gopls",
  "golangci_lint_ls",
  "bashls",
  "bufls",
  "docker_compose_language_service",
  "dockerls",
  "html",
  "jqls",
  "jsonls",
  -- "markdown_oxide",
  "nil_ls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
   },
  }
end

-- 
