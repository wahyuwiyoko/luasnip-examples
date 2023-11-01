local luasnip = require("luasnip")
local snippet = luasnip.snippet
local insert = luasnip.insert_node
local choice = luasnip.choice_node
local format = require("luasnip.extras.fmt").fmt

-- restore(position, variable_name)
-- The variable_name is a key to store a value
-- Changing the choice node will reflecting the next choice node
local restore =luasnip.restore_node

-- Examples
local func_name = [[
local function {}()

end
]]

local var_name = [[
local {} = function ()

end
]]

luasnip.add_snippets("lua", {
  snippet("func", choice(1, {
    format(func_name, {
      restore(1, "func_name")
    }),
    format(var_name, {
      restore(1, "func_name")
    })
  }),
    -- Store default value from snippets using stored key
    {
      stored = {
        func_name = insert(nil, "default_name")
      }
    })
})
