local luasnip = require("luasnip")
local snippet = luasnip.snippet
local insert = luasnip.insert_node
local rep = require("luasnip.extras").rep

-- Examples
luasnip.add_snippets("lua", {
  snippet("autorepeat", {
    insert(1, "Repeat me"),
    rep(1)
  })
})
