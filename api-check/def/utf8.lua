local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (is.lua53) {
	f,"char",
	f,"codepoint",
	f,"codes",
	f,"len",
	f,"offset",
	s,"charpattern",
}
return def
