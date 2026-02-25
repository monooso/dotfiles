local date_time_snippets = function()
  return {
    {
      { prefix = 'ddl', desc = 'The local date in ISO8601 format', body = os.date('!%F') },
      { prefix = 'dtl', desc = 'The local datetime in ISO8601 format', body = os.date('!%FT%T%z') },
      { prefix = 'ddu', desc = 'The UTC date in ISO8601 format', body = os.date('!%F') },
      { prefix = 'dtu', desc = 'The UTC datetime in ISO8601 format', body = os.date('!%FT%TZ') },
    },
  }
end

local timelog_snippets = function()
  return {
    {
      {
        prefix = 'tl',
        desc = 'Time log entry',
        body = {
          '[' .. os.date('!%FT%TZ') .. '/PT${1:15}M] ${2:Description} ${3:#tag}',
          '$0',
        }
      },
    },
  }
end

return { date_time_snippets, timelog_snippets }
