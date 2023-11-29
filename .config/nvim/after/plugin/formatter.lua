require("conform").setup({
  formatters_by_ft = {
    elixir = { "mix format" },
    lua = { "stylua" },
    javascript = { { "deno fmt", "prettierd", "prettier" } },
    typescript = { { "deno fmt", "prettierd", "prettier" } },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})
