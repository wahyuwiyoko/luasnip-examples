local luasnip = require("luasnip")
local snippet = luasnip.snippet
local insert = luasnip.insert_node
local format = require("luasnip.extras.fmt").fmt

-- First argument is a function that takes a list of arguments
-- Function nodes must and always return a string to insert a node
local func = luasnip.function_node

-- Examples
luasnip.add_snippets("lua", {
  snippet("req", format("local {} = require(\"{}\")", {
    func(function (value)
      print(value)

      return "name"
    end, { 1 }),
    insert(1)
  }))
})

luasnip.add_snippets("lua", {
  snippet("line", format("{} {} {}", {
    insert(2, { "line 1", "line 2" }),
    insert(1, "111"),
    func(function (value)
      print(value)

      return "test"
    end, { 2, 1 })
  }))
})

local func_template = [[
-- {}{}
function {}({})
  {}
end
]]

luasnip.add_snippets("lua", {
  snippet("ff", format(func_template, {
    insert(1, "Example comment"),
    func(function (value)
      local param_value = value[1][1]
      param_value = param_value:gsub(" ", "")

      if param_value== "" then
        return ""
      end

      local params = vim.split(param_value, ",")
      local docs_comment = { "" }

      for _, param in ipairs(params) do
        table.insert(docs_comment, string.format("-- @param %s any <description>", param))
      end

      return docs_comment
    end, { 3 }),
    insert(2, "name"),
    insert(3),
    insert(4)
  }))
})
