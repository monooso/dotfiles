require("conform").setup({
  formatters_by_ft = {
    elixir = { "mix format" },
    lua = { "stylua" },
    javascript = { "deno fmt", "prettierd", "prettier", stop_after_first = true },
    typescript = { "deno fmt", "prettierd", "prettier", stop_after_first = true },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})
