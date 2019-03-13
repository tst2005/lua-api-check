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
