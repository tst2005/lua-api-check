local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (is.luajit20 or is.luajit21 or is.raptorjit10) {
	f,"start",
}
return def
