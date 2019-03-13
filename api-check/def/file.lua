local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (true) {
	f,"close",
	f,"flush",
	f,"lines",
	f,"read",
	f,"seek",
	f,"setvbuf",
	f,"write",
}
return def
