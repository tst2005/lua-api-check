local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

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
return def
