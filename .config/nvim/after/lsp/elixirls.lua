local command = os.getenv("HOME") .. "/.local/bin/language-servers/elixirls/language_server.sh"

return {
  cmd = { command }
}
