local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (true) {
	f,"loadlib",
	s,"config",
	s,"cpath",
	s,"path",
	t,"loaded",
	t,"preload",
}
addif (is.lua52 or is.lua53 or is.luajit20 or is.luajit21 or is.raptorjit10) {
	f,"searchpath",
}
addif (is.lua52 or is.lua53) {
	t,"searchers",
}
addif (is.lua51 or is.lua52 or is.luajit20 or is.luajit21 or is.raptorjit10) {
	f,"seeall",
	t,"loaders",
}

local removeif = require "api-check.remover"(def)
removeif (is.gopherlua01) {
	f,"loadlib",
	s,"config",
	s,"cpath",
	s,"path",
	t,"loaded",
	t,"preload",
}
return def
