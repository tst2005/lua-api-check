local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (true) {
	f,"create",
	f,"resume",
	f,"running",
	f,"status",
	f,"wrap",
	f,"yield",
}
addif (is.lua53) {
	f,"isyieldable",
}
return def