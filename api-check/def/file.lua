local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (true) {
	f,"close",
	f,"flush",
	f,"lines",
	f,"read",
	f,"seek",
	f,"setvbuf",
	f,"write",
}
addif (true) {
	f,"__tostring",
	f,"__gc",
	t,"__index",
}
addif (is.lua53) {
	s,"__name",
}
local removeif = require"api-check.remover"(def)
removeif (is.gopherlua01) {
	f,"__gc",
}

return def
