local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (true) {
	t,"_G",
	s,"_VERSION",
	t,"arg",
	f,"assert",
	f,"collectgarbage",
	t,"coroutine",
	t,"debug",
	f,"dofile",
	f,"error",
	f,"getmetatable",
	t,"io",
	f,"ipairs",
	f,"load",
	f,"loadfile",
	t,"math",
	f,"next",
	t,"os",
	t,"package",
	f,"pairs",
	f,"pcall",
	f,"print",
	f,"rawequal",
	f,"rawget",
	f,"rawset",
	f,"require",
	f,"select",
	f,"setmetatable",
	t,"string",
	t,"table",
	f,"tonumber",
	f,"tostring",
	f,"type",
	f,"xpcall",
}

addif (is.luajit20 or is.luajit21 or is.raptorjit10) {
	t,"jit",
	t,"bit",
}

addif (is.lua51 or is.luajit20 or is.luajit21 or is.raptorjit10) {
	f,"gcinfo",
	f,"module",
	f,"setfenv",
	f,"newproxy",
	f,"getfenv",
}

addif (is.lua51 or is.lua52 or is.luajit20 or is.luajit21 or is.raptorjit10) {
	f,"loadstring",
	f,"unpack",
}

addif (is.lua52) {
	t,"bit32",
	f,"module",
	f,"rawlen",
}

addif (is.lua53) {
	t,"bit32",
	t,"utf8",
}

addif (is.lua53 or is.lua52 or is.luajit21) {
	f,"rawlen",
}

return def
