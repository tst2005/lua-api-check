local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (true) {
	f,"create",
	f,"resume",
	f,"running",
	f,"status",
	f,"wrap",
	f,"yield",
}
addif (is.lua53 or is.raptorjit10) {
	f,"isyieldable",
}
return def
