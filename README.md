# LuaSnip Examples

This repository contains some basic examples of how to create snippets using
LuaSnip.

## LuaSnip Global Variables

These is an alternative way to create a snippets without defining every
variables that require LuaSnip modules. So we can use global variables that
LuaSnip provide.

### Snippets for Each File Types

The file name must match with the file type. For example, to create a snippets
for markdown and Go, the file name is `markdown.lua` and `go.lua`. If you want
to add snippets for all file types, the file name is `all.lua`.

Inside the file, we need to `return` some snippets. Here is an example snippets
for `txt` file, the file name is `text.lua`:

```lua
return {
  s("trigger", t("Loaded!")),
  s("lorem", t("Lorem ipsum dolor sit amet."))
}
```

### Disable Diagnostics

For `lua-language-server` that have diagnostic enabled, it need to disabled
within the file to disable `undefined-global` warning. And also if you are
using selene as a linter, it can also disable within the file using `allow()`.
Here is some example to disable diagnostic for `lua-language-server` and selene
for current file:

```lua
--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

return {
  s("trigger", t("Loaded!"))
}
```

## Documentation

- [Getting started with LuaSnip](https://github.com/L3MON4D3/LuaSnip/blob/master/README.md)
- [Full documentation](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md)
- [Snippets example](https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua)

## Learning Resources

- [LuaSnip Zero to Hero](https://youtube.com/playlist?list=PL0EgBggsoPCnZ3a6c0pZuQRMgS_Z8-Fnr&si=pA9LdT-fMURu3lwm)
  by [s1n7ax](https://www.youtube.com/@s1n7ax).
- [The Ultimate LuaSnip Tutorial for Beginners](https://youtu.be/ub0REXjhpmk?si=8mHiU9GmWZwLURbe)
  by [ziontee113](https://www.youtube.com/@ziontee113).
- [Introduction to LuaSnip](https://youtu.be/Dn800rlPIho?si=hoFdUt2_wE7CzSbN)
  by [TJ DeVries](https://www.youtube.com/@teej_dv).
