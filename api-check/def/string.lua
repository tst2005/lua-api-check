local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

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
addif (is.gopherlua01) {
	f,"gfind",
	t,"__index",
}

return def
