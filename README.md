A script that know all modules definitions, usefull to check if every table/functions are present.

# How to use

```sh
$ lua api-check.lua
$ lua api-check.lua -v
$ lua api-check.lua -vv
```

# Detect the Lua version

The module [api-check.is](api-check/is.lua) is the module that detect the supported Lua version.

## Supported versions

* Lua 5.1
* Lua 5.2
* Lua 5.3
* LuaJIT 2.0
* LuaJIT 2.1

# API definitions

# Sample of module definition

The package definition ([api-check/def/package.lua](api-check/def/package.lua)):
```lua
local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (true) {
        f,"loadlib",
        s,"config",
        s,"cpath",
        s,"path",
        t,"loaded",
        t,"preload",
}
addif (is.lua52 or is.lua53 or is.luajit20 or is.luajit21) {
        f,"searchpath",
}
addif (is.lua52 or is.lua53) {
        t,"searchers",
}
addif (is.lua51 or is.lua52 or is.luajit20 or is.luajit21) {
        f,"seeall",
        t,"loaders",
}

return def
```

# All modules

All modules definitions are in [api-check/def/](api-check/def/).

# Result

* [Lua 5.1](result/lua51.md)
* [Lua 5.2](result/lua52.md)
* [Lua 5.3](result/lua53.md)
* [LuaJIT 2.0](result/luajit20.md)
* [LuaJIT 2.1](result/luajit21.md)

# TODO

## New supported version

* RaptorJIT
* Some Lua VM in made in Go
* Some Lua VM in made in Rust

## shared project

* See what is common with https://github.com/love2d-community/love-api
