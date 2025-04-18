-- Configure the Intelephense language server.
return {
  settings = {
    intelephense = {
      codeLens = {
        implementations = { enable = true },
        overrides = { enable = true },
        parent = { enable = true },
        references = { enable = true },
        usages = { enable = true },
      }
    }
  }
}
