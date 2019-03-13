local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (true) {
	f,"abs",
	f,"acos",
	f,"asin",
	f,"atan",
	f,"atan2",
	f,"ceil",
	f,"cos",
	f,"cosh",
	f,"deg",
	f,"exp",
	f,"floor",
	f,"fmod",
	f,"frexp",
	f,"ldexp",
	f,"log",
	f,"log10",
	f,"max",
	f,"min",
	f,"modf",
	f,"pow",
	f,"rad",
	f,"random",
	f,"randomseed",
	f,"sin",
	f,"sinh",
	f,"sqrt",
	f,"tan",
	f,"tanh",
	n,"huge",
	n,"pi",
}
addif (is.lua51 or is.luajit20) {
	f,"mod",
}
addif (is.lua53) {
	f,"type",
	f,"ult",
	f,"tointeger",
	n,"maxinteger",
	n,"mininteger",
}

return def
