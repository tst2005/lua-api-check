local t,s,f,n,u = "table", "string", "function", "number", "userdata"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (true) {
	f,"close",
	f,"flush",
	f,"input",
	f,"lines",
	f,"open",
	f,"output",
	f,"popen",
	f,"read",
	f,"tmpfile",
	f,"type",
	f,"write",
	u,"stderr",
	u,"stdin",
	u,"stdout",
}
return def
