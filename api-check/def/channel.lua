local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (is.gopherlua01) {
	f,"make",
	f,"select",
}
return def
