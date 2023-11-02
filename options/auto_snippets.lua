local luasnip = require("luasnip")
local snippet = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node

-- Examples with regex patterns
-- Add hidden property with value of true will hide the snippet from cmp
-- It's hidden by default
luasnip.add_snippets("lua", {
  snippet({ trig = "auto-", snippetType = "autosnippet", hidden = false}, {
    text("This is an auto trigger")
  })
})

-- Also can trigger with a whitespace
luasnip.add_snippets("lua", {
  snippet({ trig = "auto trigger", snippetType = "autosnippet" }, {
    text("This is an auto trigger")
  })
})

-- If regTrig set to true, the trig value will interpreted as regex
-- Find more: https://riptutorial.com/lua/example/20315/lua-pattern-matching
luasnip.add_snippets("lua", {
  snippet({ trig = "trigger%d", regTrig = true, snippetType = "autosnippet" }, {
    text("This is an auto trigger")
  })
})

luasnip.add_snippets("lua", {
  snippet({ trig = "args(%d)(%d)", regTrig = true, snippetType = "autosnippet" }, {
    insert(1, "uppercase me"),
    func(function (args) -- args argument will take node 1
      return " " .. args[1][1]:upper() .. " and " .. args[2][1]:lower() .. " "
    end, { 1, 2 }), -- This is node number
    insert(2, "LOWERCASE ME")
  })
})

luasnip.add_snippets("lua", {
  snippet({ trig = "digit(%d)(%d)", regTrig = true, snippetType = "autosnippet" }, {
    func(function (_, snip)
      -- captures property will get the value from triggered first regex above
      return snip.captures[1] .. " and "
    end),
    func(function (_, snip)
      -- captures property will get the value from triggered second regex above
      return snip.captures[2]
    end)
  })
})
