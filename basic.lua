local luasnip = require("luasnip")

-- Create snippet
-- snippet(file_type, nodes)
local snippet = luasnip.snippet

-- Text as placeholder
local text = luasnip.text_node

-- insert(position, default_text)
-- It takes a position (like $1) and optionally some default text
local insert = luasnip.insert_node

-- format(string, nodes)
-- It takes a format of string and a list of nodes
-- To escape curly braces, use double curly braces => {{ inside curly braces }}
local format = require("luasnip.extras.fmt").fmt

-- Examples
luasnip.add_snippets("lua", {
  snippet("var", {
    text("local "),
    insert(1, "name"),
    text(" = "),
    insert(2, "\"value\"")
  })
})

-- Using format node to simplify example above
luasnip.add_snippets("lua", {
  snippet("var", format("local {} = {}", {
    insert(1, "name"),
    insert(2, "\"value\"")
  }))
})
