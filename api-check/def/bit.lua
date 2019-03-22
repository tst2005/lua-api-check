local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (is.luajit20 or is.luajit21 or is.raptorjit10) {
	f,"arshift",
	f,"band",
	f,"bnot",
	f,"bor",
	f,"bxor",
	f,"lshift",
	f,"rshift",
	f,"rol",
	f,"ror",
	f,"bswap",
	f,"tobit",
	f,"tohex",
}
return def
