local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (true) {
	f,"byte",
	f,"char",
	f,"dump",
	f,"find",
	f,"format",
	f,"gmatch",
	f,"gsub",
	f,"len",
	f,"lower",
	f,"match",
	f,"rep",
	f,"reverse",
	f,"sub",
	f,"upper",
}
addif (is.lua51 or is.luajit20) {
	f,"gfind",
}
addif (is.lua53) {
	f,"pack",
	f,"packsize",
	f,"unpack",
}

return def
