local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (is.raptorjit10) {
	f,"open",
	f,"close",
	f,"start",
	f,"stop",
	f,"select",
}
return def
