local luasnip = require("luasnip")
local snippet = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node
local format = require("luasnip.extras.fmt").fmt

-- choice(position, { list_of_choice })
local choice = luasnip.choice_node

-- Examples
luasnip.add_snippets("lua", {
  snippet("count", choice(1, {
    text("1st"),
    text("2st"),
    text("3rd")
  }))
})

-- Using format node
luasnip.add_snippets("lua", {
  snippet("var", choice(1, {
    format("local {} = {}", {
      insert(1, "name"),
      insert(2, "\"value\"")
    }),
    format("{} = {}", {
      insert(1, "name"),
      insert(2, "\"value\"")
    })
  }))
})

-- Multiple choice node in format node
luasnip.add_snippets("lua", {
  snippet("var", format("local {} = {}", {
    choice(1, {
      text("str"),
      text("num"),
      text("bool")
    }),
    choice(2, {
      text("\"value\""),
      text("50"),
      text("true")
    })
  }))
})

-- Escape curly braces
luasnip.add_snippets("lua", {
  snippet("func", format(
    [[
      local {} = function ({})
        {} {{ inside curly braces }}
      end
    ]],
    {
      insert(1, "var_name"),
      choice(2, { text(""), insert(1, "args") }),
      insert(3, "-- TODO: something")
    }
  ))
})
