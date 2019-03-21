local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (true) {
	f,"clock",
	f,"date",
	f,"difftime",
	f,"execute",
	f,"exit",
	f,"getenv",
	f,"remove",
	f,"rename",
	f,"setlocale",
	f,"time",
	f,"tmpname",
}
addif (is.gopherlua01) {
	f,"setenv",
}

return def
