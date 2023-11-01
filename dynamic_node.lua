local luasnip = require("luasnip")
local snippet = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node
local choice = luasnip.choice_node
local rep = require("luasnip.extras").rep
local format = require("luasnip.extras.fmt").fmt

-- Snippet node is like grouping some snippet nodes
local node = luasnip.snippet_node

-- Dynamic node can be jumpable than function node
local dynamic = luasnip.dynamic_node

-- Examples
local func_template = [[
-- {}{}
function {}({})
  {}
end
]]

luasnip.add_snippets("lua", {
  snippet("ff", format(func_template, {
    insert(1, "Example comment"),
    dynamic(5, function (value)
      local param_value = value[1][1]
      param_value = param_value:gsub(" ", "")

      if param_value == "" then
        -- Return an empty snippet with empty string
        return node(1, { text("") })
      end

      local params = vim.split(param_value, ",")
      local nodes = {}

      for index, param in ipairs(params) do
        table.insert(nodes, node(index, format("\n\n-- @param {} {} {}", {
          text(param),
          insert(1, "any"),
          insert(2, "description")
        })))
      end

      return node(nil, nodes)
    end, { 3 }),
    insert(2, "name"),
    insert(3),
    insert(4)
  }))
})

-- Example for JavaScript snippet
luasnip.add_snippets("javascript", {
  snippet({ trig = "for([%w_]+)", regTrig = true, hidden = false }, format(
    [[
      for (const {} = 0; {} < {}; {}++) {{
        {}
      }}
    ]],
    {
      dynamic(1, function (_, snip)
        return node(1, insert(1, snip.captures[1]))
      end),
      rep(1),
      choice(2, { insert(1, "num"), node(1, { insert(1, "arr"), text(".length") }) }),
      rep(1),
      insert(3, "// TODO:")
    }
  ))
})
