local schemastore = require('schemastore')
local schemas = schemastore.json.schemas {}

return {
  json = {
    schemas = schemas,
    validate = { enable = true },
  },
}
